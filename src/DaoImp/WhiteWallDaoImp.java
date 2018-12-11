package DaoImp;

import Dao.WhiteWallDao;
import JDBCUtil.JDBCUtil;
import entity.WhiteWall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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

        String sql = "insert into whiteWall (contant) values(?)";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1,u.getContant());
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
}
