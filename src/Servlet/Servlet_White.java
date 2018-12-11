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
        JSONArray jsonArray = new JSONArray();
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if(action.equalsIgnoreCase("insert"))
        {
            String cont = request.getParameter("contant");
            WhiteWall whiteWall = new WhiteWall(1,cont);
            whiteWallDaoImp = new WhiteWallDaoImp();
            whiteWallDaoImp.insertWhite(whiteWall);

        }






       // response.sendRedirect(forward);
//        RequestDispatcher view = request.getRequestDispatcher(forward);
//
//        view.forward(request,response);
    }
}
