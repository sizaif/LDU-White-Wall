package DaoImp;

import Dao.WhiteWallDao;
import JDBCUtil.JDBCUtil;
import entity.WhiteWall;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WhiteWallDaoImp implements WhiteWallDao {
    /**
     * 插入一条数据:
     * 返回值：int
     *
     * @param u
     * @return boolean
     * insert  into WhiteWall values(7,'qq','123',1,2);
     */
    @Override
    public int insertWhite(WhiteWall u) {
        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;

        String sql = "insert into whiteWall (textWhile) values(?)";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1,u.gettextWhite());
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
     * 删除表白内容
     */
    @Override
    public int deleteWhiteWall(int id) {
        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;
        String sql = "DELETE  FROM whiteWall  WHERE wid=?";
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
     * 修改name, pwd where id =?
     * 修改表白内容
     *
     */
    @Override
    public int updateWhiteWall(WhiteWall u) {
        return 0;
    }

    /**
     * 根据页码进行查询
     * 返回值：
     * 参数：page  ,index
     *
     * @param index
     * @param pageSize
     */
    @Override
    public List<WhiteWall> listByPage(int index, int pageSize) {
        return null;
    }

    /**
     * @param id
     * @return 查询 数据 通过 id
     */
    @Override
    public WhiteWall findWhiteWallById(int id) {
        return null;
    }

    /**
     * 列出所有
     *
     * @return
     */
    @Override
    public List<WhiteWall> listAll() {
        List<WhiteWall> list = new ArrayList<>();
        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;
        Statement st = null;
        ResultSet res = null;
        String sql = "SELECT  * from whitewall";

        try {
            st = conn.createStatement();
            res = st.executeQuery(sql);
            while (res.next())
            {
                list.add(new WhiteWall(res.getInt(1),res.getString(2)));
            }
            return  list;
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(res,null,conn);
        }
        return list;
    }
}
