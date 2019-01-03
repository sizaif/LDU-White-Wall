package Servlet.Admin;

import DaoImp.AnecdoteDaoImp;
import DaoImp.UserDaoImp;
import DaoImp.WhiteWallDaoImp;
import entity.User;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Servlet_Admin",urlPatterns = "/Servlet_Admin")
public class Servlet_Admin extends HttpServlet {

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
            if(action.equalsIgnoreCase("update")){
                String Dao = request.getParameter("Dao");
                String id = request.getParameter("Id");
                System.out.println(id);
                int ID = Integer.parseInt(id.trim());
                int su = 0;
                if(Dao.equalsIgnoreCase("user")){
                    String Name = request.getParameter("Name");
                    String Pwd = request.getParameter("Pwd");
                    String Nick = request.getParameter("Nick");
                    String Per = request.getParameter("Per");
                    su = new UserDaoImp().updateUser(new User(ID,Name,Pwd,Per,Nick));
                    if( su > 0)
                        jsonObject.put("success","success");
                    else
                        jsonObject.put("success","fail");
                }
                jsonObject.put("forward","/Admin/Admin-table.jsp");
            }else if(action.equalsIgnoreCase("delete")){
                String id = request.getParameter("Id");
                String Dao = request.getParameter("Dao");
                System.out.println(id );
                int ID = Integer.parseInt(id.trim());
                int su = 0;
                if(Dao.equalsIgnoreCase("user"))
                {
                    su = new UserDaoImp().deleteUser(ID);
                    System.out.println(su);
                    if( su > 0)
                        jsonObject.put("success","success");
                    else
                        jsonObject.put("success","fail");
                }
                else if( Dao.equalsIgnoreCase("whitewall"))
                {
                    su = new WhiteWallDaoImp().deleteWhiteWall(ID);
                    if( su > 0)
                        jsonObject.put("success","success");
                    else
                        jsonObject.put("success","fail");
                }
                else if(Dao.equalsIgnoreCase("anecdote")){
                    su = new AnecdoteDaoImp().deleteAnecdote(ID);
                    if( su > 0)
                        jsonObject.put("success","success");
                    else
                        jsonObject.put("success","fail");
                }
                jsonObject.put("forward","/Admin/Admin-table.jsp");
            }

        }catch(NullPointerException e){
            e.printStackTrace();
            forward="/Home.jsp";
            jsonObject.put("success","fail");
            jsonObject.put("forward",forward);
        }finally{

        }

        PrintWriter out = response.getWriter();
        out.println(jsonObject.toString());
        out.flush();
        out.close();
    }
}
