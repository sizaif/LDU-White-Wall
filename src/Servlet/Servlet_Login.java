package Servlet;

import Dao.UserDao;
import DaoImp.UserDaoImp;
import com.mysql.jdbc.StringUtils;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

//@WebServlet(name = "Servlet_Login",urlPatterns = "/Servlet_Login")
@WebServlet("/Servlet_Login")
public class Servlet_Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        try {
            String user_name = request.getParameter("username");
            String user_pwd = request.getParameter("password");
            if(StringUtils.isNullOrEmpty(user_name) && StringUtils.isNullOrEmpty(user_pwd))
            {
                /*
                 * 如果为空 则跳转到登陆界面
                 */
                //Servlet_Login.initialzation(request, response);
                try {
                    response.sendRedirect("/SignIN/login.jsp");
                }catch(Exception e){
                    e.printStackTrace();
                }finally{

                }
            }
            else
            {
                /*
                 * 如果不为空 则进行 登陆验证
                 * 如果查询空, 返回到登陆
                 * 否则 创建session
                 */
                UserDao userDaoImp = new UserDaoImp();
                User user = userDaoImp.findUserByNamePwd(user_name,user_pwd);
                if( user == null)
                {
                    request.getRequestDispatcher("/SignIN/login.jsp").forward(request,response);
                }
                else
                {
                    /*
                     *  创建session
                     */
                    System.out.println("servlet_login -> 创建session");
                    HttpSession session = request.getSession();
                    session.setAttribute("username",user.getName());
                    session.setAttribute("password",user.getPwd());
                    session.setAttribute("permission",user.getPermission());
                    session.setAttribute("usernick",user.getNick());
                    Servlet_Login.initialzation(request, response);
                }
            }
        }catch(Exception e){
            String user_name  = null;
            String user_pwd = null;
            request.getRequestDispatcher("/SignIN/login.jsp").forward(request,response);
        }finally{

        }
    }

    private static void initialzation(HttpServletRequest request, HttpServletResponse response) {

        try {
            request.getRequestDispatcher("/Home.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
