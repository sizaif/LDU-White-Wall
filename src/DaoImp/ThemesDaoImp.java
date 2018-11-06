package DaoImp;

import Dao.ThemeDao;
import JDBCUtil.JDBCUtil;
import entity.Theme;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ThemesDaoImp implements ThemeDao {
    @Override
    public int inserttheme(Theme theme) {

        Connection conn = JDBCUtil.getConnection();

        PreparedStatement pstm = null;
        String sql ="Insert into themes (tname) values(?)";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1,theme.getTheme_name());
            int su = pstm.executeUpdate();
            return su;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }
        return 0;
    }

    @Override
    public int deletetheme(int id) {

        Connection conn = JDBCUtil.getConnection();

        PreparedStatement pstm = null;
        String sql ="DELETE FROM themes WHERE  tid=?";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1,id);
            int su = pstm.executeUpdate();
            return su;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }
        return 0;
    }

    @Override
    public int updatetheme(Theme theme) {

        Connection conn = JDBCUtil.getConnection();

        PreparedStatement pstm = null;
        String sql ="UPDATE themes SET tname=? WHERE tid=?";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1,theme.getTheme_name());
            pstm.setInt(2,theme.getTheme_id());
            int su = pstm.executeUpdate();
            return su;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }
        return 0;
    }

    @Override
    public Theme findthemeById(int id) {

        Connection conn = JDBCUtil.getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Theme theme = null;
        String sql ="SELECT * FROM  themes WHERE tid=?";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1,id);
            rs = pstm.executeQuery();
            while(rs.next()){
                theme = new Theme(rs.getInt(1),rs.getString(2));
            }
            return theme;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }
        return null;
    }

    @Override
    public Theme findthemeByName(String name) {
        Connection conn = JDBCUtil.getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Theme theme = null;
        String sql ="SELECT * FROM  themes WHERE tname=?";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1,name);
            rs = pstm.executeQuery();
            while(rs.next()){
                theme = new Theme(rs.getInt(1),rs.getString(2));
            }
            return theme;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }
        return null;
    }
}
