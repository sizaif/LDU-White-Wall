package DaoImp;

import Dao.AnecdoteDao;
import JDBCUtil.JDBCUtil;
import entity.Anecdote;
import jdk.nashorn.internal.scripts.JD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class AnecdoteDaoImp implements AnecdoteDao {

    private Connection conn =  null;;
    private PreparedStatement pstm = null;
    private ResultSet res = null;
    private static AnecdoteDao instance;
    private final String sqltable = "anecdote";

    public static final AnecdoteDao getInstance() {
        if (instance == null) {
            try {
                instance = new AnecdoteDaoImp();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return instance;

    }


    /**
     * 浏览了文章 增加文章的浏览次数
     *
     * @param anecdote_id
     */
    @Override
    public void addVisit(int anecdote_id) {

        try {
            conn = JDBCUtil.getConnection();
            String sql = "update anecdote set visit = visit+1 where id = " + anecdote_id;
            pstm = conn.prepareStatement(sql);
            pstm.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(null,pstm,conn);
        }
    }

    /**
     * 获取上一文章 或 下一文章
     *
     * @param time
     * @param less_or_more
     * @return
     */
    @Override
    public Anecdote getANearAnecdote(String time, int less_or_more) {
        Anecdote anecdote = null;
        try {
            conn = JDBCUtil.getConnection();

            String sql = null;
            if( less_or_more == this.LESS){
                sql = "SELECT * FROM anecdote WHERE TIME <'"+time+"' ORDER BY TIME DESC";
            }
            else if( less_or_more == this.MORE){
                sql = "SELECT * FROM anecdote WHERE TIME >'"+time+"' ORDER BY TIME";
            }
            pstm = conn.prepareStatement(sql);
            res = pstm.executeQuery();
            if( res.next()){
                anecdote = new Anecdote(res.getInt(1),res.getString(2),res.getString(3),res.getString(4),res.getString(5),
                        res.getInt(6),res.getInt(7),res.getInt(8),res.getString(9));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(res,pstm,conn);
        }
        return  anecdote;
    }

    /**
     * 分组某一列属性 计算每个组的大小 返回Map
     *
     * @param search_column
     * @return
     */
    @Override
    public Map getColumAndCount(String search_column) {
        Map map = null;
        try {
            conn = JDBCUtil.getConnection();
            String sql = "SELECT "+ search_column + ", count("+search_column+") as counts FROM anecdote group by "+search_column;
            pstm = conn.prepareStatement(sql);
            res = pstm.executeQuery();
            map  = new HashMap();
            while (res.next()){
                map.put(res.getString(search_column),res.getInt("counts"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(res,pstm,conn);
        }
        return  map;
    }

    /**
     * 返回所有的类别
     *
     * @return
     */
    @Override
    public List<String> getAllSort() {

        List<String> list= new ArrayList();
        try {
            conn = JDBCUtil.getConnection();
            String sql = "SELECT distinct(sort) from "+sqltable+" order by sort";
            pstm = conn.prepareStatement(sql);
            res = pstm.executeQuery();
            while (res.next()){
                list.add(res.getString(1));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(res,pstm,conn);
        }
        return list;
    }

    /**
     * 新的文章
     *
     * @param a
     * @return
     */
    @Override
    public boolean addAnecdote(Anecdote a) {
        conn = JDBCUtil.getConnection();
        String sql = "insert into "+sqltable+" values(null,?,?,?,?,?,?,?,?)";
        int su  = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, a.getTitle());
            pstm.setString(2, a.getAuthor());
            pstm.setString(3, a.getSort());
            pstm.setString(4, a.getTime());
            pstm.setInt(5, a.getStar());
            pstm.setInt(6, a.getComment());
            pstm.setInt(7, a.getVisit());
            pstm.setString(8, a.getContent());
            su  =  pstm.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(null,pstm,conn);
        }
        return su>0;
    }


    /**
     * 删除文章
     *
     * @param id
     * @return
     */
    @Override
    public int deleteAnecdote(int id) {

        conn = JDBCUtil.getConnection();

        String sql = "delete from "+sqltable+"  where id=?";

        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, id);
            result = pstm.executeUpdate();

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(null,pstm,conn);
        }
        return result;
    }

    /**
     * 获取所有的文章
     *
     * @return
     */
    @Override
    public List getAllAnecdote() {
        conn = JDBCUtil.getConnection();
        List<Anecdote> list = new ArrayList();

        String sql = "select * from "+sqltable;
        try {
            pstm = conn.prepareStatement(sql);
            res = pstm.executeQuery();
            // bean实例化
            while (res.next()) {
                Anecdote article = new Anecdote(res.getInt("id"), res.getString("title"), res.getString("author"),
                        res.getString("sort"), res.getString("time"), res.getInt("star"), res.getInt("comment"),
                        res.getInt("visit"), res.getString("content"));
                list.add(article);
            }

            // 排序 article compareTo();
            Collections.sort(list);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeAll(res,pstm,conn);
        }
        return list;
    }

    /**
     * 获取阅读排行文章列表
     *
     * @return
     */
    @Override
    public List getVisitRank() {
        List<Anecdote> list = new ArrayList();
        try {
            conn = JDBCUtil.getConnection();
            String sql = "SELECT * FROM "+sqltable+"  ORDER BY visit DESC LIMIT 0,10";
            pstm = conn.prepareStatement(sql);
            res = pstm.executeQuery();
            while (res.next()){
                list.add(new Anecdote(res.getInt("id"), res.getString("title"), res.getString("author"),
                        res.getString("sort"), res.getString("time"), res.getInt("star"), res.getInt("comment"),
                        res.getInt("visit"), res.getString("content")));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(res,pstm,conn);
        }
        return list;
    }

    /**
     * 通过某一列查询文章
     *
     * @param column
     * @param value
     * @return
     */
    @Override
    public List<Anecdote> getAnecdoteByColumn(String column, String value) {
        List<Anecdote> list = new ArrayList();
        try {
            conn = JDBCUtil.getConnection();
            String sql = "select * from "+sqltable+" where " + column + " = ?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1,value);
            res = pstm.executeQuery();
            while (res.next()){
                list.add(new Anecdote(res.getInt("id"), res.getString("title"), res.getString("author"),
                        res.getString("sort"), res.getString("time"), res.getInt("star"), res.getInt("comment"),
                        res.getInt("visit"), res.getString("content")));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(res,pstm,conn);
        }
        return list;
    }

    /**
     * 获取文章的数量或者类别的数量
     *
     * @param search_key
     * @return
     */
    @Override
    public int getCount(String search_key) {

        int su = 0;
        try {
            conn = JDBCUtil.getConnection();
            String sql = null;
            if (search_key.equals(SEARCH_ANECDOTE)) {
                sql = "SELECT COUNT(id) FROM "+sqltable;
            } else {// SEARCH_SORT
                sql = "SELECT COUNT(DISTINCT(sort)) FROM "+sqltable;
            }
            pstm = conn.prepareStatement(sql);
            res = pstm.executeQuery();
            while (res.next()){
               su = res.getInt(1);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(res,pstm,conn);
        }
        return su;
    }

    /**
     * 点赞了文章
     *
     * @param id
     * @return
     */
    @Override
    public int star_Anecdote(int id) {

        int count = 0;
        try {
            conn = JDBCUtil.getConnection();
            String sql = "UPDATE "+sqltable+" SET star=star+1 WHERE id="+id;
            pstm = conn.prepareStatement(sql);

            pstm.executeQuery();
            sql = "SELECT  star FROM anecdote WHERE id="+id;
            pstm = conn.prepareStatement(sql);
            res = pstm.executeQuery();
            while (res.next()){
                count = res.getInt(1);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(res,pstm,conn);
        }
        return count;
    }

    /**
     * 更新了类别
     *
     * @param old_sort
     * @param new_sort
     * @return
     */
    @Override
    public boolean updateSort(String old_sort, String new_sort) {
        int su = 0;
        try {
            conn = JDBCUtil.getConnection();
            String sql = "UPDATE "+sqltable+" SET sort=? WHERE sort=?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1,new_sort);
            pstm.setString(2,old_sort);
            su = pstm.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(res,pstm,conn);
        }
        return su>0;
    }

    /**
     * 删除分类和文章
     *
     * @param sort
     * @return
     */
    @Override
    public boolean delelteSort(String sort) {
        return false;
    }

    /**
     * 获取一页文章
     * @param startIndex
     * @param offset
     * @return
     */
    @Override
    public List<Anecdote> getPageArticle(int startIndex, int offset) {
        List<Anecdote> list = new ArrayList();
        try {
            conn = JDBCUtil.getConnection();
            String sql = "SELECT * FROM "+sqltable+" ORDER BY TIME DESC LIMIT ?,?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1,startIndex);
            pstm.setInt(2,offset);
            res = pstm.executeQuery();
            while (res.next()){
                list.add(new Anecdote(res.getInt("id"), res.getString("title"), res.getString("author"),
                        res.getString("sort"), res.getString("time"), res.getInt("star"), res.getInt("comment"),
                        res.getInt("visit"), res.getString("content")));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(res,pstm,conn);
        }
        return list;
    }

    /**
     * 根据 类别进行分类
     *
     * @param sort
     * @param startIndex
     * @param offset
     * @return
     */
    @Override
    public List<Anecdote> getPageArticleBySort(String sort, int startIndex, int offset) {


        List<Anecdote> list = new ArrayList<>();
        try {
            conn = JDBCUtil.getConnection();
            String sql = "SELECT * FROM "+sqltable+ " WHERE sort =?  ORDER BY TIME DESC LIMIT ?,?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1,sort);
            pstm.setInt(2,startIndex);
            pstm.setInt(3,offset);
            res = pstm.executeQuery();
            while (res.next()){
                list.add(new Anecdote(res.getInt("id"), res.getString("title"), res.getString("author"),
                        res.getString("sort"), res.getString("time"), res.getInt("star"), res.getInt("comment"),
                        res.getInt("visit"), res.getString("content")));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(res,pstm,conn);
        }
        return list;
    }

    /**
     * 使用ID获取文章内容
     *
     * @param id
     * @return
     */
    @Override
    public Anecdote getArticleByID(int id) {
        Anecdote an = null;
        try {
            String sql = "SELECT * FROM "+sqltable+ " WHERE id=?";
            conn = JDBCUtil.getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1,id);
            res = pstm.executeQuery();
            while (res.next()){
                an = new Anecdote(res.getInt("id"), res.getString("title"), res.getString("author"),
                        res.getString("sort"), res.getString("time"), res.getInt("star"), res.getInt("comment"),
                        res.getInt("visit"), res.getString("content"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(res,pstm,conn);
        }
        return  an;
    }
}
