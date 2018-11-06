package DaoImp;

import Dao.NewsDao;
import Dao.Pageable;
import JDBCUtil.JDBCUtil;
import entity.News;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class NewsDaoImp implements NewsDao {
    @Override
    public int insertnews(News nes) {
        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;

        String sql = "insert into news (ntheme,nnews,ntitle) values(?,?,?)";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1,nes.getNews_theme());
            pstm.setString(2,nes.getNews_content());
            pstm.setString(3,nes.getNews_title());

            int su = pstm.executeUpdate();
            return  su;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }
        return 0;
    }

    @Override
    public int deletenews(int id) {

        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;

        String sql = "DELETE FROM news WHERE nid=?";
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

    @Override
    public int updateUser(News nes) {
        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;

        String sql = "UPDATE news SET ntheme=?,nnews=?,ntitle=? WHERE nid=?";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1,nes.getNews_theme());
            pstm.setString(2,nes.getNews_content());
            pstm.setString(3,nes.getNews_title());
            pstm.setInt(4,nes.getId());
            int su = pstm.executeUpdate();
            return  su;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }
        return 0;
    }

    @Override
    public News findNewsById(int id) {

        Connection conn = JDBCUtil.getConnection(); // 连接数据库
        PreparedStatement pstm = null;
        ResultSet resultSet = null;
        News news = null;
        String sql = "SELECT  * FROM  news WHERE nid=?";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1,id);
            resultSet = pstm.executeQuery();
            while (resultSet.next()){
                news = new News(resultSet.getInt(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4));
            }
            return news;
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(resultSet,pstm,conn);
        }

        return null;
    }

    @Override
    public ResultSet findAllNews() {
//        Connection conn = JDBCUtil.getConnection(); // 连接数据库
//        PreparedStatement pstm = null;
//        Pageable rs = null;
//        String sql = "SELECT * FROM news";
//        try {
//            pstm = conn.prepareStatement(sql);
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
            return null;

    }
}
