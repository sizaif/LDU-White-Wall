package Servlet;

import Dao.WhiteWallDao;
import DaoImp.UserDaoImp;
import DaoImp.WhiteWallDaoImp;
import entity.User;
import entity.WhiteWall;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Servlet_White",urlPatterns = "/Servlet_White")
public class Servlet_White extends HttpServlet {
    private WhiteWallDaoImp whiteWallDaoImp;
    public Servlet_White()
    {
        super();
        whiteWallDaoImp = new WhiteWallDaoImp();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String forward="";
        JSONObject jsonObject =new JSONObject();
        HttpSession session = request.getSession();

        try {
            String action = request.getParameter("type");
            System.out.println(action);
            if(action.equalsIgnoreCase("insert"))
            {
                String cont = request.getParameter("textWhile");
                WhiteWall whiteWall = new WhiteWall(1,cont);
                whiteWallDaoImp = new WhiteWallDaoImp();
                whiteWallDaoImp.insertWhite(whiteWall);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{

        }
        PrintWriter out = response.getWriter();
        out.println(jsonObject.toString());
        out.flush();
        out.close();
       // response.sendRedirect(forward);
//        RequestDispatcher view = request.getRequestDispatcher(forward);
//
//        view.forward(request,response);
    }
}
