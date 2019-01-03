package Servlet;

import DaoImp.UserDaoImp;
import DaoImp.WhiteWallDaoImp;
import entity.WhiteWall;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "Servlet_White_detail",urlPatterns = "/Servlet_White_detail")
public class Servlet_White_detail extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        JSONObject jsonObject = new JSONObject();
        String forward ="";
        String id = request.getParameter("id");
        String action = request.getParameter("type");
        try {
            if(action.equalsIgnoreCase("detail"))  {
                int ID = Integer.parseInt(id.trim());
                WhiteWall ww = new WhiteWallDaoImp().findWhiteWallById(ID);
                String textArea = ww.gettextWhite();
                String imgurl = ww.getImageurl();
                int Uid = ww.getUid();
                String author = new UserDaoImp().findUserById(Uid).getNick(); //获取作者Nick
                request.setAttribute("author",author);
                request.setAttribute("article",ww);
                request.setAttribute("id",id);
                request.setAttribute("textArea",textArea);
                request.setAttribute("imgurl",request.getContextPath()+imgurl);
                request.setAttribute("action",action);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{

        }
        request.getRequestDispatcher("/WhiteWall/detailInfoWhite.jsp").forward(request, response);
    }
}
