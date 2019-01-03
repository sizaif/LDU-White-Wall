package DaoImp;

import Dao.UploadImgDao;
import entity.Uploadimg;

import JDBCUtil.JDBCUtil;

import java.sql.*;

public class UploadImgDaoImp implements UploadImgDao {

    public Connection conn = null;
    public PreparedStatement pstm = null;
    public ResultSet resultSet = null;
    public Statement st = null;
    /**
     * 插入到数据库
     *
     * @param u
     * @return
     */
    @Override
    public int insertUploadimg(Uploadimg u) {
        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;

        String sql = "insert into upload_img (img) values(?)";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1,u.getImgurl());
            int su = pstm.executeUpdate();
            return  su;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }
        return 0;
    }
    /**
     * @param id
     * @return boolean
     * 删除
     */
    @Override
    public int deleteUploadimg(int id) {
        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;
        String sql = "DELETE  FROM upload_img  WHERE id=?";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1,id);
            int su = pstm.executeUpdate();
            return  su;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }
        return 0;
    }

    /***
     *
     * @param u
     * @return
     *
     * 修改
     *
     */
    @Override
    public int updateUploadimg(Uploadimg u) {
        return 0;
    }

    /***
     *登录的业务
     *查找：
     *select * from user where user=?  and pwd=?
     *参数：
     *返回值：
     * @param id
     */
    @Override
    public Uploadimg findImgById(Integer id) {
        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;
        String sql = "SELECT * FROM upload_img WHERE id=?";
        Uploadimg up = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1,id);
            resultSet = pstm.executeQuery();
            while(resultSet.next())
            {
                up = new Uploadimg(resultSet.getInt(1),resultSet.getString(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }
       return up;
    }

    /**
     * 获取 最后一次 添加后 自动递增的ID;
     *
     * @return
     */
    @Override
    public int getLastId() {
        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;
        String sql = "SELECT max(id) FROM upload_img";
        Uploadimg up = null;
        try {
            pstm = conn.prepareStatement(sql);
            resultSet = pstm.executeQuery();
            while(resultSet.next())
            {
                up = new Uploadimg(resultSet.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }
        return up.getId();


    }
}
