package Servlet;

import DaoImp.UserDaoImp;
import entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Servlet_Users",urlPatterns = "/Servlet_Users")
public class Servlet_Users extends HttpServlet {

    private UserDaoImp userDaoImp;
    public Servlet_Users(){
        super();
        userDaoImp =  new UserDaoImp();
    }
    public void init() throws SecurityException{
        String message = "Hessl";

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String forward="";

            String name = request.getParameter("name");
            String pwd = request.getParameter("pwd");
            /*
             * 连接数据库
             * 查询name 和 pwd 语句 返回到User 类 中
             * 查询结果
             * 如果 找到 对应 则  判定 用户名 密码正确  跳转下一个页面
             * 否则返回登陆页面
             */
            ;
            User user = userDaoImp.findUserByNamePwd(name,pwd);

            int flag = 1;
            if (user!=null) {
                String getName = user.getName();
                String getpwd = user.getPwd();
                String getPermission = user.getPermission();
                //out.print("<br>");
                if(getName.equals(name) && getpwd.equals(pwd)){
                    flag = 0;
                    //out.print(getName+ " "+getpwd+" "+getPermission);
//                    session = request.getSession();
//                    session.setAttribute("user_name",getName);
//                    session.setAttribute("user_pwd", getpwd);
//                    session.setAttribute("user_permission",getPermission);

                    if(getPermission.equals(new String("admin").toLowerCase())) {
                        forward = "../Administration/welcomeAdmin.jsp";
                    }
                    else{
                        forward = "../Users/welcomeUser.jsp";
                    }
                }

            if( flag == 1)
                forward = "./login.jsp";
        }
        response.sendRedirect(forward);
//        RequestDispatcher view = request.getRequestDispatcher(forward);
//
//        view.forward(request,response);
    }
}
