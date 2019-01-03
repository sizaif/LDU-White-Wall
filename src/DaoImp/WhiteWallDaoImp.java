package DaoImp;

import Dao.WhiteWallDao;
import JDBCUtil.JDBCUtil;
import entity.WhiteWall;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WhiteWallDaoImp implements WhiteWallDao {

    public final static String SQLtable = WhiteWallDao.SEARCH_WHITEWALL;
    public Connection conn = null;
    public PreparedStatement pstm = null;
    public ResultSet resultSet = null;
    public Statement st = null;

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
        String url = u.getImageurl();
        String sql ="";
        if( url.equals("/upload/addphoto.jpg"))
        {
            sql = "insert into "+SQLtable+" (textWhile,uid) values(?,?)";
            try {
                pstm = conn.prepareStatement(sql);
                pstm.setString(1,u.gettextWhite());
                pstm.setInt(2,u.getUid());
                int su = pstm.executeUpdate();
                return  su;
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                JDBCUtil.closeAll(null,pstm,conn);
            }
        }
        else
        {
            sql = "insert into whiteWall (textWhile,img,uid) values(?,?,?)";
            try {
                pstm = conn.prepareStatement(sql);
                pstm.setString(1,u.gettextWhite());
                pstm.setString(2,u.getImageurl());
                pstm.setInt(3,u.getUid());
                int su = pstm.executeUpdate();
                return  su;
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                JDBCUtil.closeAll(null,pstm,conn);
            }
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
        WhiteWall ww = new WhiteWall();
        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;

        ResultSet res = null;
        try {
            String sql = "SELECT * from whitewall WHERE wid=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1,id);
            res = pstm.executeQuery();
            while (res.next()){
                ww = new WhiteWall(res.getInt(1),res.getString(2),res.getString(3),res.getInt(4));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(res,pstm,conn);
        }
        return ww;
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
                list.add(new WhiteWall(res.getInt(1),res.getString(2),res.getString(3),res.getInt(4)));
            }
            return  list;
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(res,null,conn);
        }
        return list;
    }

    /**
     * 返回总数目
     *
     * @param keys
     * @return
     */
    @Override
    public int getCount(String keys) {
        String sql = "";
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet resultSet  = null;
        int counts = 0;
        try {
            if( keys.equalsIgnoreCase(SEARCH_WHITEWALL)){
                conn = JDBCUtil.getConnection();
                sql = "SELECT COUNT(*) FROM "+SEARCH_WHITEWALL;
                pstm = conn.prepareStatement(sql);
                resultSet = pstm.executeQuery();
                while (resultSet.next())
                {
                    counts  = resultSet.getInt(1);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(resultSet,pstm,conn);
        }
        return  counts;
    }

    @Override
    public List<WhiteWall> getPageWhiteWall(int startIndex, int offset) {
        String sql = "";

        List<WhiteWall> list = new ArrayList<>();
        try {
            conn = JDBCUtil.getConnection();
            sql = "SELECT * FROM whitewall LIMIT ?,?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1,startIndex);
            pstm.setInt(2,offset);
            resultSet = pstm.executeQuery();
            while (resultSet.next()){
                list.add(new WhiteWall(resultSet.getInt(1),resultSet.getString(2),resultSet.getString(3),resultSet.getInt(4)));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(resultSet,pstm,conn);
        }
        return  list;
    }

}
