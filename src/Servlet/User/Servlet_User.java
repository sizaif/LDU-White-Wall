package Servlet.User;

import DaoImp.AdminDaoImp;
import DaoImp.AnecdoteDaoImp;
import DaoImp.UserDaoImp;
import DaoImp.WhiteWallDaoImp;
import entity.User;
import entity.WhiteWall;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "Servlet_User" ,urlPatterns = "/Servlet_User")
public class Servlet_User extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        JSONObject jsonObject = new JSONObject();
        String forward = "";
        String action = request.getParameter("type");
        try {
            if(action.equalsIgnoreCase("manage")){
                String id = request.getParameter("uid");
                System.out.println(id);
                int Id = Integer.parseInt(id.trim());
                List<WhiteWall> list = new AdminDaoImp().getAllWhiteByID(Id);
                request.setAttribute("alllist",list);
                request.getRequestDispatcher("/WhiteWall/User-whiewalllist.jsp").forward(request,response);

            }

        }catch(NullPointerException e){
            e.printStackTrace();

        }finally{

        }

        PrintWriter out = response.getWriter();
        out.println(jsonObject.toString());
        out.flush();
        out.close();
    }

}
