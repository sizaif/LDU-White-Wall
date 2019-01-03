package Servlet;

import Dao.UserDao;
import Dao.WhiteWallDao;
import DaoImp.UserDaoImp;
import DaoImp.WhiteWallDaoImp;
import com.mysql.jdbc.StringUtils;
import entity.User;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Servlet_Login",urlPatterns = "/Servlet_Login")
public class Servlet_Login extends HttpServlet {

    public static int currentPage; // 当前页数
    public static int perPageCount  = 6;// 每页显示数据
    public static int  totalCount ; // 总记录数
    public static int totalPage ; // 总页数
    public static int startIndex ; // 开始索引
    public static int page = 1;
    private static WhiteWallDaoImp whiteWallDaoImp = new WhiteWallDaoImp();

    static JSONObject jsonObject = new JSONObject();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");



        try {
            String user_name = request.getParameter("username");
            String user_pwd = request.getParameter("password");
//            System.out.println("Logcheck : "+user_name+" "+user_pwd);
            if( ! StringUtils.isNullOrEmpty(user_name) &&  ! StringUtils.isNullOrEmpty(user_pwd))
            {
                /*
                 * 如果不为空 则进行 登陆验证
                 * 如果查询空, 返回到登陆
                 * 否则 创建session
                 */
                UserDao userDaoImp = new UserDaoImp();
                User user = userDaoImp.findUserByNamePwd(user_name,user_pwd);
                if( user != null)
                {
                    /*
                     *  创建session
                     */
                    System.out.println("servlet_login -> 创建session");
                    HttpSession session = request.getSession();
                    System.out.println("session ID : "+session.getId());
                    session.setAttribute("userid",user.getId());
                    session.setAttribute("username",user.getName());
                    session.setAttribute("password",user.getPwd());
                    session.setAttribute("permission",user.getPermission());
                    session.setAttribute("usernick",user.getNick());
                    Servlet_Login.initialzation(request, response);
                }else {
                     user_name  = null;
                     user_pwd = null;
                     jsonObject.put("success","fail");
                     jsonObject.put("forward","/SignIN/login.jsp");
                }
            }
        }catch(Exception e){
            String user_name  = null;
            String user_pwd = null;
            jsonObject.put("success","fail");
            jsonObject.put("forward","/Home.jsp");
        }finally{
            PrintWriter out = response.getWriter();
            out.println(jsonObject.toString());
            out.flush();
            out.close();
        }
    }

    private static void initialzation(HttpServletRequest request, HttpServletResponse response) {

        try {


            // 获取总记录
            totalCount = whiteWallDaoImp.getCount(WhiteWallDao.SEARCH_WHITEWALL);
            // 获取 分页数
            totalPage = totalCount%perPageCount==0? totalCount/perPageCount : totalCount/perPageCount+1;
            // 本页起始 索引
            startIndex = (page-1)*perPageCount;


            // 初始化  表白墙
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(60*30);
//            System.out.println("Session Id getid : "+session.getId());
            session.setAttribute("whitewall_PageList",whiteWallDaoImp.getPageWhiteWall(startIndex,perPageCount));
            session.setAttribute("Page",page);
            session.setAttribute("totalPage",totalPage);
            jsonObject.put("success","success");
            jsonObject.put("forward","/Home.jsp");
        }catch(Exception e){
            e.printStackTrace();
        }finally{

        }
    }
}
