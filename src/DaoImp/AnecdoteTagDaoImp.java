package DaoImp;

import Dao.AnecdoteTagDao;
import JDBCUtil.JDBCUtil;
import entity.AnecdoteTag;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AnecdoteTagDaoImp implements AnecdoteTagDao {

    private static  Connection conn;
    private static ResultSet res;
    private static PreparedStatement pstm;
    private final String sqlTable="anecdoteTag";
    /**
     * 新的标签
     *
     * @param id
     * @param tag
     * @return
     */
    @Override
    public boolean addTag(int id, String tag) {


        String sql = "insert into "+sqlTable+" (id,tag) values(?,?)";
        int result = 0;
        try {
            conn = JDBCUtil.getConnection();
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, id);
            pstm.setString(2, tag);
            result = pstm.executeUpdate();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }
        return result != 0;
    }

    /**
     * 删除标签
     *
     * @param id
     * @param tag
     * @return
     */
    @Override
    public boolean deleteTag(int id, String tag) {

        String sql = "delete from "+sqlTable+" where id=? or tag=?";
        int result = 0;
        try {
            conn = JDBCUtil.getConnection();
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, id);
            pstm.setString(2, tag);
            result = pstm.executeUpdate();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }
        return result != 0;
    }

    /**
     * 获取所有的标签 不含重复
     *
     * @return
     */
    @Override
    public List getAllTag() {

        String sql = "SELECT  distinct(tag)  FROM "+sqlTable;
        List<AnecdoteTag> list = new ArrayList<>();
        int result = 0;
        try {
            conn = JDBCUtil.getConnection();
            pstm = conn.prepareStatement(sql);
            res = pstm.executeQuery();
            while (res.next()){
                list.add(new AnecdoteTag(0,res.getString(1)));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(res,pstm,conn);
        }
        return list;
    }

    /**
     * 更新标签
     *
     * @param old_tag
     * @param new_tag
     * @return
     */
    @Override
    public boolean updateTag(String old_tag, String new_tag) {


        String sql = "update "+sqlTable+" set tag=? where tag=?";
        int result = 0;
        try {
            conn = JDBCUtil.getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, new_tag);
            pstm.setString(2, old_tag);
            result = pstm.executeUpdate();

        } catch (SQLException e) {

            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }
        return result != 0;
    }

    /**
     * 通过列属性获取标签
     *
     * @param column
     * @param value
     * @return
     */
    @Override
    public List getTagByColumn(String column, String value) {

        AnecdoteTag atag = null;
        String sql = "select * from "+sqlTable+" where " + column + "=?";
        List list = new ArrayList();
        try {
            conn = JDBCUtil.getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, value);
            res =  pstm.executeQuery();
            while (res.next()) {
                list.add(new AnecdoteTag(0,res.getString(1)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(res,pstm,conn);
        }
        return list;
    }
}
