package Servlet;

import DaoImp.UserDaoImp;
import entity.User;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

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
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        String forward="";

        JSONObject jsonObject =new JSONObject();

        try {
            String action = request.getParameter("type");
            System.out.println(action);
            if(action.equalsIgnoreCase("signup")) {
                /*
                 * 连接数据库
                 * 插入到数据库中
                 */
                String name = request.getParameter("username");
                String pwd = request.getParameter("password");
                String nick = request.getParameter("usernick");
                int id = 0;
                /*
                 *  User 类
                 *  mysql 实现 UserDaoImp
                 */
                User newuser = new User(id, name, pwd, "user",nick);
                UserDaoImp mysql = new UserDaoImp();
                int su = mysql.insertUser(newuser);
                if (su == 1) {
                    jsonObject.put("forward", "/SignIN/login.jsp");
                } else
                    jsonObject.put("forward", "/SignUP/reger.jsp");
            }else if(action.equalsIgnoreCase("change")) {
                /*
                 * 修改个人信息
                 */
                String name = request.getParameter("username");
                String pwd = request.getParameter("password");
                String nick = request.getParameter("usernick");
                int id = 0;
                User newuser = new User(id,name,pwd,"user",nick);
                UserDaoImp mysql = new UserDaoImp();
                int su = mysql.updateUser(newuser);
                jsonObject.put("forward","/SignIN/Userinfo.jsp");
            }
            else if (action.equalsIgnoreCase("logout")){
                if( request.getSession(false)!=null) {
                    request.getSession().invalidate();
//                    request.getSession().removeAttribute("username");
//                    request.getSession().removeAttribute("permission");
//                    request.getSession().removeAttribute("password");
//                    request.getSession().removeAttribute("usernick");
//                    System.out.println(request.getSession().getAttribute("username"));
                    System.out.println("session 注销! test");
                    jsonObject.put("forward","/Home.jsp");
                }
            }

        }catch(Exception e){
            e.printStackTrace();
        }finally{

        }
        // 向前台写入数据
        PrintWriter out = response.getWriter();
        out.println(jsonObject.toString());
        out.flush();
        out.close();
    }
}
