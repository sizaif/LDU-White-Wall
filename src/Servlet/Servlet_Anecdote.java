package Servlet;

import DaoImp.AnecdoteDaoImp;
import Service.AnecdoteService;
import entity.Anecdote;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Servlet_Anecdote",urlPatterns = "/Servlet_Anecdote")
public class Servlet_Anecdote extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String forward="";
        JSONObject jsonObject =new JSONObject();

        try {

            int id = 1;
            String action = request.getParameter("type");

            if(action==null)
            {
                jsonObject.put("success","fail");
            }
            else
            {
                if(action.equalsIgnoreCase("insert")){
                    AnecdoteService anecdoteService = new AnecdoteService();
                    Anecdote anecdote = anecdoteService.addArticle(request);

                    request.setAttribute("Anecdote",anecdote);
                    forward = "/Anecdote/AnecdoteList.jsp";
                    jsonObject.put("forward",forward);
                    jsonObject.put("success","success");
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{

        }
        PrintWriter out = response.getWriter();
        out.println(jsonObject.toString());
        out.flush();
        out.close();
    }
}
