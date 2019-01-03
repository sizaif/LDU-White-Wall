package Dao;

import entity.Anecdote;

import java.util.List;
import java.util.Map;

public interface AnecdoteDao {

    static final String SEARCH_ANECDOTE = "anecdote";
    static final String SEARCH_SORT = "sort";

    static final int LESS = 1;
    static final int MORE = 2;


    /**
     * 浏览了文章 增加文章的浏览次数
     *
     * @param article_id
     */
    void addVisit(int article_id);

    /**
     * 获取上一文章 或 下一文章
     *
     * @param time
     * @param less_or_more
     * @return
     */
    Anecdote getANearAnecdote(String time, int less_or_more);

    /**
     * 分组某一列属性 计算每个组的大小 返回Map
     *
     * @param search_column
     * @return
     */
    Map getColumAndCount(String search_column);

    /**
     * 返回所有的类别
     *
     * @return
     */
    List<String> getAllSort();

    /**
     * 新的文章
     *
     * @param a
     * @return
     */
    boolean addAnecdote(Anecdote a);

    /**
     * 删除文章
     *
     * @param id
     * @return
     */
    int deleteAnecdote(int id);

    /**
     * 获取所有的文章
     *
     * @return
     */
    List getAllAnecdote();

    /**
     * 获取阅读排行文章列表
     *
     * @return
     */
    List getVisitRank();

    /**
     * 通过某一列查询文章
     *
     * @param column
     * @param value
     * @return
     */
    List<Anecdote> getAnecdoteByColumn(String column, String value);

    /**
     * 获取文章的数量或者类别的数量
     *
     * @param search_key
     * @return
     */
    int getCount(String search_key);

    /**
     * 点赞了文章
     *
     * @param id
     * @return
     */
    int star_Anecdote(int id);

    /**
     * 更新了类别
     *
     * @param old_sort
     * @param new_sort
     * @return
     */
    boolean updateSort(String old_sort, String new_sort);

    /**
     * 删除分类和文章
     *
     * @param sort
     * @return
     */
    boolean delelteSort(String sort);

    /**
     * 获取一页文章
     * @param startIndex
     * @param offset
     * @return
     */
    List<Anecdote> getPageArticle(int startIndex, int offset);

    /**
     *  根据 类别进行分类
     * @param sort
     * @param startIndex
     * @param offset
     * @return
     */
    List<Anecdote> getPageArticleBySort(String sort,int startIndex, int offset);

    /**
     *  使用ID获取文章内容
     * @param id
     * @return
     */
    Anecdote getArticleByID(int id);


}