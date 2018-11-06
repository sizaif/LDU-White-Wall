package Dao;

import entity.User;

import java.util.List;

public interface UserDao {

    /**
     * 插入一条数据:
     * 返回值：int
     * @param u
     * @return boolean
     * insert  into user values(7,'qq','123',1,2);
     */
    public  int insertUser(User u);
    /**
     *
     * @param id
     * @return boolean
     * 删除用户
     */
    public  int  deleteUser(int id );

    /***
     *
     * @param u
     * @return
     * 修改name,pwd where id =?
     * 修改用户
     *
     */
    public int updateUser(User u);

    /**
     *
     *根据页码进行查询
     *返回值：
     *参数：page  ,index
     *
     */
    public List<User> listByPage(int index, int pageSize);

    /***
     *登录的业务
     *查找：
     *select * from user where user=?  and pwd=?
     *参数：
     *返回值：
     */
    public  User  findUserByNamePwd(String username,String pwd);

    /**
     *
     * @param id
     * @return
     * 查询 数据 通过 id
     */

    public User findUserById(int id);

}
