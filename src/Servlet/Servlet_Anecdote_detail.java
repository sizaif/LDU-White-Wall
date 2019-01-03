package Servlet;

import DaoImp.AnecdoteDaoImp;
import DaoImp.AnecdoteTagDaoImp;
import DaoImp.UserDaoImp;
import Service.AnecdoteService;
import entity.Anecdote;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Servlet_Anecdote_detail",urlPatterns = "/Servlet_Anecdote_detail")
public class Servlet_Anecdote_detail extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String forward="";
        String id = request.getParameter("id");
        int ID = Integer.parseInt(id.trim());

        AnecdoteService anecdoteService = new AnecdoteService();
        AnecdoteDaoImp anecdoteDaoImp  = new AnecdoteDaoImp();
        anecdoteDaoImp.addVisit(ID); // 增加访问量  简单的记录  留坑

        Anecdote an = anecdoteDaoImp.getArticleByID(ID);
        request.setAttribute("Anecdote",an);
        forward="/Anecdote/detailInfoAnecdote.jsp";
        request.getRequestDispatcher(forward).forward(request,response);
    }
}
