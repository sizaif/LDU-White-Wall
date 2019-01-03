package DaoImp;

import Dao.UserDao;
import entity.User;
import JDBCUtil.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImp implements UserDao {

    static final String SQLTABLE = "users";
    @Override
    public int insertUser(User u) {

        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;

        try {
            String sql = "insert into users (uname,upwd,upermission,unick) values(?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1,u.getName());
            pstm.setString(2,u.getPwd());
            pstm.setString(3,u.getPermission());
            pstm.setString(4,u.getNick());
            int success = pstm.executeUpdate();
            return  success;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }
        return 0;
    }

    @Override
    public int deleteUser(int id) {
        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;
        int suc = 0;
        try {
            String sql = "DELETE FROM  "+SQLTABLE+" WHERE uid=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1,id);
             suc = pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }
        return  suc;
    }

    @Override
    public int updateUser(User u) {
        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;
        int suc = 0;
        try {
            String sql = "UPDATE users SET uname=?,upwd=?,upermission=?,unick=? WHERE uid=?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1,u.getName());
            pstm.setString(2,u.getPwd());
            pstm.setString(3,u.getPermission());
            pstm.setString(4,u.getNick());
            pstm.setInt(5,u.getId());

            suc = pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }

        return  suc;
    }

    @Override
    public List<User> listByPage(int startIndex, int offset) {
        String sql = "";
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet resultSet = null;
        List<User> list = new ArrayList<>();
        try {
            conn = JDBCUtil.getConnection();
            sql = "SELECT * FROM "+SQLTABLE+" LIMIT ?,?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1,startIndex);
            pstm.setInt(2,offset);
            resultSet = pstm.executeQuery();
            while (resultSet.next()){
                list.add( new User(resultSet.getInt(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getString(5)));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(resultSet,pstm,conn);
        }
        return  list;
    }

    @Override
    public User findUserByNamePwd(String username, String pwd) {
        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;
        ResultSet resultSet = null;
        User user = null;

        try {
            String sql = "SELECT * FROM users WHERE uname=? AND upwd=?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1,username);
            pstm.setString(2,pwd);

            resultSet = pstm.executeQuery(); // 不需要加 sql

            while (resultSet.next()) {
                user  = new User(resultSet.getInt(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getString(5));
            }
            return  user;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(resultSet,pstm,conn);
        }
        return null;
    }

    @Override
    public User findUserById(int id) {
        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;
        ResultSet resultSet = null;
        User user = null;
        try {
            String sql = "select * from users where uid=? ";
            pstm = conn.prepareStatement(sql);

            pstm.setInt(1,id);
            resultSet = pstm.executeQuery();
            while (resultSet.next()) {
                user  = new User(resultSet.getInt(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getString(5));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(resultSet,pstm,conn);
        }
        return  user;
    }

    /**
     * 获取总数
     *
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
            if( keys.equalsIgnoreCase(UserDao.SEARCH_USER)){
                conn = JDBCUtil.getConnection();
                sql = "SELECT COUNT(*) FROM "+ keys;
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
    public List<User> getAllUser() {
        String sql = "";
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet resultSet = null;
        List<User> list = new ArrayList<>();
        try {
            conn = JDBCUtil.getConnection();
            sql = "SELECT * FROM "+SQLTABLE;
            pstm = conn.prepareStatement(sql);
            resultSet = pstm.executeQuery();
            while (resultSet.next()){
                list.add( new User(resultSet.getInt(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getString(5)));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(resultSet,pstm,conn);
        }
        return  list;
    }

    /**
     * 通过昵称进行模糊查询
     *
     * @param nick
     * @return
     */
    @Override
    public List<User> SearchUserFuzzyByNick(String nick) {

        List<User> list = null;
        String sql = "";
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet resultSet = null;
        try {
            list = new ArrayList<>();
            conn = JDBCUtil.getConnection();
            sql = "SELECT * FROM "+SQLTABLE+" where unick like ? ";
            String sqlParasevalue =     "%"+nick+"%";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1,sqlParasevalue);
            resultSet = pstm.executeQuery();
            while (resultSet.next()){
                list.add( new User(resultSet.getInt(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getString(5)));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(resultSet,pstm,conn);
        }
        return  list;
    }
}
