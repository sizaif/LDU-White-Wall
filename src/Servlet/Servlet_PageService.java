package Servlet;

import Dao.*;
import DaoImp.AnecdoteDaoImp;
import DaoImp.AnecdoteTagDaoImp;
import DaoImp.UserDaoImp;
import DaoImp.WhiteWallDaoImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Servlet_PageService",urlPatterns = "/Servlet_PageService")
public class Servlet_PageService extends HttpServlet {

    public static int currentPage; // 当前页数
    public static int perPageCount  = 7;// 每页显示数据
    public static int  totalCount ; // 总记录数
    private static int totalPage ; // 总页数
    private static int startIndex ; // 开始索引

    // 数据库中的表名
    public static final String USER = UserDao.SEARCH_USER;
    public static final String WHITEWALL = WhiteWallDao.SEARCH_WHITEWALL;
    public static final String ANECDOTE = AnecdoteDao.SEARCH_ANECDOTE;
    public static final String ANECDOTETAG = AnecdoteTagDao.SEARCH_ANECDOTETAG;
    public static final String UPLOADIMG = UploadImgDao.SEARCH_UPLOAD;

    // Dao 层实现
    private WhiteWallDaoImp whiteWallDaoImp = new WhiteWallDaoImp();
    private AnecdoteDaoImp anecdoteDaoImp = new AnecdoteDaoImp();
    private UserDaoImp userDaoImp = new UserDaoImp();
    private AnecdoteTagDaoImp anecdoteTagDaoImp = new AnecdoteTagDaoImp();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MainWork(request,response);
    }

    private void MainWork(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String p = request.getParameter("Page");
        String Dao = null ;
        String forward="";
        try {
            Dao = request.getParameter("Dao");
            Dao.trim();
        }catch(Exception e){
            e.printStackTrace();
            /*
                默认操作 留坑
             */
        }
        System.out.println(Dao);
        int page;
        try {
            page  = Integer.valueOf(p);
        }catch(NumberFormatException e){
            page = 1;
        }
        HttpSession session = request.getSession();
        System.out.println(session.getId());
        session.setMaxInactiveInterval(60*30);

        if( Dao.equalsIgnoreCase("user")){
            totalCount = userDaoImp.getCount(USER);
            totalPage = totalCount%perPageCount==0? totalCount/perPageCount : totalCount/perPageCount+1;
            startIndex = (page-1)*perPageCount;
            request.setAttribute("userPageList",userDaoImp.listByPage(startIndex,perPageCount));
            request.setAttribute("Page",page);
            request.setAttribute("totalPage",totalPage);
            forward="/Admin/UserMange.jsp";
            System.out.println(totalCount+" "+totalPage+" "+forward);
        }
        else if( Dao.equalsIgnoreCase("whitewall")){

            perPageCount = 6;
            totalCount = whiteWallDaoImp.getCount(WHITEWALL);
            totalPage = totalCount%perPageCount==0? totalCount/perPageCount : totalCount/perPageCount+1;
            startIndex = (page-1)*perPageCount;
            request.setAttribute("whitewall_PageList",whiteWallDaoImp.getPageWhiteWall(startIndex,perPageCount));
            request.setAttribute("Page",page);
            request.setAttribute("totalPage",totalPage);
            forward="/WhiteWall/Whitewall.jsp";
        }
        else if(Dao.equalsIgnoreCase("anecdote")){
            System.out.println("anecdote");
            request.setAttribute("AnecdoteSortList",anecdoteDaoImp.getAllSort());
            String sort = request.getParameter("Sort");
            try {
                sort = sort.trim();
                if(sort==null){
                    // 初始化
                    // 获取总记录
                    totalCount = anecdoteDaoImp.getCount(AnecdoteDao.SEARCH_ANECDOTE);
                    // 获取 分页数
                    totalPage = totalCount%perPageCount==0? totalCount/perPageCount : totalCount/perPageCount+1;
                    // 本页起始 索引
                    startIndex = (page-1)*perPageCount;
                    request.setAttribute("AnecdotePageList",anecdoteDaoImp.getPageArticle(startIndex,perPageCount));
                    request.setAttribute("Page",page);
                    request.setAttribute("totalPage",totalPage);
                }
                else {
                    // 初始化
                    // 获取总记录
                    totalCount = anecdoteDaoImp.getCount(sort);
                    // 获取 分页数
                    totalPage = totalCount%perPageCount==0? totalCount/perPageCount : totalCount/perPageCount+1;
                    // 本页起始 索引
                    startIndex = (page-1)*perPageCount;
                    request.setAttribute("AnecdotePageList",anecdoteDaoImp.getPageArticleBySort(sort,startIndex,perPageCount));
                    request.setAttribute("Page",page);
                    request.setAttribute("totalPage",totalPage);
                }
            }catch(NullPointerException e){

                // 初始化
                // 获取总记录
                totalCount = anecdoteDaoImp.getCount(AnecdoteDao.SEARCH_ANECDOTE);
                // 获取 分页数
                totalPage = totalCount%perPageCount==0? totalCount/perPageCount : totalCount/perPageCount+1;
                // 本页起始 索引
                startIndex = (page-1)*perPageCount;
                request.setAttribute("AnecdotePageList",anecdoteDaoImp.getPageArticle(startIndex,perPageCount));
                request.setAttribute("Page",page);
                request.setAttribute("totalPage",totalPage);
            }
            forward="/Anecdote/AnecdoteList.jsp";
        }
        else if(Dao.equalsIgnoreCase("anecdotetag")) {
        }
        else  if(Dao.equalsIgnoreCase("uploadimg")) {
        }

        request.getRequestDispatcher(forward).forward(request,response);

    }
}
