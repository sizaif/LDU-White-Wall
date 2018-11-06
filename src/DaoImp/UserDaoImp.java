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

    @Override
    public int insertUser(User u) {

        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;

        try {
            String sql = "insert into users (uname,upwd,upermission) values(?,?,?)";
            pstm = conn.prepareStatement(sql);
            //pstm.setInt(1,u.getId());

            pstm.setString(1,u.getName());
            pstm.setString(2,u.getPwd());
            pstm.setString(3,u.getPermission());

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

        try {
            String sql = "DELETE FROM  users WHERE uid=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1,id);
            int suc = pstm.executeUpdate();
            return  suc;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }
        return 0;
    }

    @Override
    public int updateUser(User u) {
        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;


        try {
            String sql = "UPDATE users SET uname=?,upwd=?,upermission=? WHERE uid=?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1,u.getName());
            pstm.setString(2,u.getPwd());
            pstm.setString(3,u.getPermission());
            pstm.setInt(4,u.getId());

            int suc = pstm.executeUpdate();
            return  suc;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }

        return 0;
    }

    @Override
    public List<User> listByPage(int index, int pageSize) {
        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;
        ResultSet resultSet = null;
        List<User>list = new ArrayList<>();
        /*
            未完成.
         */
        try {

        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(resultSet,pstm,conn);
        }
        return null;
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
                user  = new User(resultSet.getInt(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4));
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
                user  = new User(resultSet.getInt(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4));
            }
            return  user;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(resultSet,pstm,conn);
        }
        return null;
    }
}
