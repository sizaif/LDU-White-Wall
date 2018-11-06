package DaoImp;

import entity.User;

import static org.junit.Assert.*;

public class UserDaoImpTest {

    private UserDaoImp uDaoImp= new UserDaoImp();

    @org.junit.Test
    public void insertUser() {
        User user = new User();
        //user.setId(6);
        user.setName("test");
        user.setPwd("test");
        user.setPermission("admin");
        int su = uDaoImp.insertUser(user);
        if( su > 0)
        {
            System.out.println("插入成功");
        }
        else{
            System.out.println("c插入");
        }

        /*
         测试 ok
         */
    }

    @org.junit.Test
    public void deleteUser() {
        User user = new User();
        user.setId(6);
        int su = uDaoImp.deleteUser(6);
        if( su >0)
        {
            System.out.println("删除成功");
        }
        /*
         测试 ok
         */
    }

    @org.junit.Test
    public void updateUser() {
        User user = new User();
        user.setName("CCC");
        user.setPwd("222");
        user.setPermission("user");
        user.setId(8);
        int  su = uDaoImp.updateUser(user);
        if( su > 0)
        {
            System.out.println("修改成功");
        }
        /*
            test ok
        */
    }

    @org.junit.Test
    public void findUserByNamePwd() {
        String name = "23";
        String pd = "123";
        User user = uDaoImp.findUserByNamePwd(name,pd);
        System.out.println(user.toString());
        /*
            test ok
         */
    }

    @org.junit.Test
    public void findUserById() {
        User user = uDaoImp.findUserById(9);
        System.out.println(user.toString());
        /*
        test ok
         */
    }
}