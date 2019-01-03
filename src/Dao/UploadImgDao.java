package Dao;

import entity.Uploadimg;

public interface UploadImgDao {

    static final String SEARCH_UPLOAD = "upload_img";

    /**
     *  插入到数据库
     * @param u
     * @return
     */
    public  int insertUploadimg(Uploadimg u);
    /**
     *
     * @param id
     * @return boolean
     * 删除
     */
    public  int  deleteUploadimg(int id );
    /***
     *
     * @param u
     * @return
     *
     * 修改
     *
     */
    public int updateUploadimg(Uploadimg u);
    /***
     *登录的业务
     *查找：
     *select * from user where user=?  and pwd=?
     *参数：
     *返回值：
     */
    public  Uploadimg  findImgById(Integer id);

    /**
     *  获取 最后一次 添加后 自动递增的ID;
     * @return
     */
    public int getLastId();
}
