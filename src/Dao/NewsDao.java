package Dao;

import entity.News;

import java.sql.ResultSet;

public interface NewsDao {

    /**
     *@param nes
     * 插入到数据库中
     */
    public  int insertnews(News nes);

    /**
     *
     * @param id
     * @return int
     * 删除
     */
    public  int deletenews(int id);
    /**
     * 更新
     * @param nes
     * @return
     */
    public  int updateUser(News nes);

    /**
     * 业务操作 , 查询 使用 id 查询
     * @param id
     * @return news
     */
    public  News findNewsById(int id);

    /**
     * 查询全部信息
     */
    public ResultSet findAllNews();
}
