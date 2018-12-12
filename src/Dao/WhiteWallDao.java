package Dao;

import entity.WhiteWall;

import java.util.List;

public interface WhiteWallDao {
    /**
     * 插入一条数据:
     * 返回值：int
     * @param u
     * @return boolean
     * insert  into WhiteWall values(7,'qq','123',1,2);
     */
    public  int insertWhite(WhiteWall u);
    /**
     *
     * @param id
     * @return boolean
     * 删除表白内容
     */
    public  int  deleteWhiteWall(int id );

    /***
     *
     * @param u
     * @return
     * 修改name,pwd where id =?
     * 修改表白内容
     *
     */
    public int updateWhiteWall(WhiteWall u);

    /**
     *
     *根据页码进行查询
     *返回值：
     *参数：page  ,index
     *
     */
    public List<WhiteWall> listByPage(int index, int pageSize);
    /**
     *
     * @param id
     * @return
     * 查询 数据 通过 id
     */
    public WhiteWall findWhiteWallById(int id);

    /**
     *  列出所有
     * @return
     */
    public List<WhiteWall>listAll();

}
