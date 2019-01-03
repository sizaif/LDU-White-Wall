package Servlet.Admin;

import Dao.*;
import DaoImp.AnecdoteDaoImp;
import DaoImp.AnecdoteTagDaoImp;
import DaoImp.UserDaoImp;
import DaoImp.WhiteWallDaoImp;
import entity.Anecdote;
import entity.User;
import entity.WhiteWall;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet(name = "ServletAdminTableService",urlPatterns = "/ServletAdminTableService")
public class ServletAdminTableService extends HttpServlet {

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

    //操作
    public static String Dao = null;
    public static String Page = null;
    public static String forward = "/Admin/Admin-table.jsp";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        JSONObject jsonObject = new JSONObject();

        Dao = null;
        Page = null;
        try {
            Dao = request.getParameter("Dao");
            Dao = Dao.trim();
        }catch(Exception e){
            Dao = "ALL"; //默认为全部
        }finally{
        }
        try {
            Page = request.getParameter("Page");
            currentPage = Integer.parseInt(Page);
        }catch(Exception e){
            currentPage = 1;
        }finally{

        }
        System.out.println("Page : "+Page+" Dao: "+Dao);
        if( Dao.equalsIgnoreCase("user")){


            totalCount = userDaoImp.getCount(USER);
            totalPage = totalCount%perPageCount==0? totalCount/perPageCount : totalCount/perPageCount+1;
            startIndex = (currentPage-1)*perPageCount;
            request.setAttribute("Mark","user"); //标志
            request.setAttribute("userPageList",userDaoImp.listByPage(startIndex,perPageCount));
            request.setAttribute("Page",currentPage);
            request.setAttribute("totalPage",totalPage);
            request.setAttribute("totalCount",totalCount);
        }
        else if( Dao.equalsIgnoreCase("whitewall")){


            totalCount = whiteWallDaoImp.getCount(WHITEWALL);
            totalPage = totalCount%perPageCount==0? totalCount/perPageCount : totalCount/perPageCount+1;
            startIndex = (currentPage-1)*perPageCount;
            request.setAttribute("Mark","whitewall"); //标志
            request.setAttribute("whitewall_PageList",whiteWallDaoImp.getPageWhiteWall(startIndex,perPageCount));
            request.setAttribute("Page",currentPage);
            request.setAttribute("totalPage",totalPage);
            request.setAttribute("totalCount",totalCount);
        }
        else if(Dao.equalsIgnoreCase("anecdote")){

            totalCount = anecdoteDaoImp.getCount(AnecdoteDao.SEARCH_ANECDOTE);
            totalPage = totalCount%perPageCount==0? totalCount/perPageCount : totalCount/perPageCount+1;
            startIndex = (currentPage-1)*perPageCount;
            request.setAttribute("Mark","anecdote"); //标志
            request.setAttribute("AnecdotePageList",anecdoteDaoImp.getPageArticle(startIndex,perPageCount));
            request.setAttribute("Page",currentPage);
            request.setAttribute("totalPage",totalPage);
            request.setAttribute("totalCount",totalCount);

        }
        else if (Dao.equalsIgnoreCase("ALL")){

            int c1 = anecdoteDaoImp.getCount(AnecdoteDao.SEARCH_ANECDOTE);
            int c2 = whiteWallDaoImp.getCount(WHITEWALL);;
            int c3 = userDaoImp.getCount(USER);
            totalCount =  c1+c2+c3;
            totalPage = totalCount%perPageCount==0? totalCount/perPageCount : totalCount/perPageCount+1;
            startIndex = (currentPage-1)*perPageCount;


            List<User> list1 = userDaoImp.listByPage(startIndex,perPageCount);
            List<WhiteWall>list2 = whiteWallDaoImp.getPageWhiteWall(startIndex,perPageCount);
            List<Anecdote>list3 = anecdoteDaoImp.getPageArticle(startIndex,perPageCount);

            List<Map<String,String> > allList = new ArrayList<>();
            Iterator<User> it1 = list1.iterator();
            /**
             *  备注:
             *  whitewall中 textArea  和 anecdote 中 conntent  不添加进去
             *  里面存的是 html 代码
             */
            while (it1.hasNext())
            {
                User user = it1.next();
                Map<String,String> allMap = new HashMap<>();
                allMap.put("id",String.valueOf(user.getId()));
                allMap.put("name",user.getName());
                allMap.put("other1",user.getNick());
                allMap.put("other2",user.getPwd());
                allMap.put("other3",user.getPermission());
                allMap.put("other3","空");
                allMap.put("other4","空");
                allMap.put("other5","空");
                allMap.put("other6","空");
                allList.add(allMap);
            }
            Iterator<WhiteWall> it2 = list2.iterator();
            while (it2.hasNext())
            {
                WhiteWall whiteWall = it2.next();
                Map<String,String> allMap = new HashMap<>();
                allMap.put("id",String.valueOf(whiteWall.getId()));
                allMap.put("name","空");// 暂时留坑 ,  等待 添加user表外键
                allMap.put("other1",whiteWall.getImageurl());
                allMap.put("other2","空");
                allMap.put("other3","空");
                allMap.put("other4","空");
                allMap.put("other5","空");
                allMap.put("other6","空");
                allList.add(allMap);
            }
            Iterator<Anecdote> it3 = list3.iterator();
            while (it3.hasNext())
            {
                Anecdote anecdote = it3.next();
                Map<String,String> allMap = new HashMap<>();
                allMap.put("id",String.valueOf(anecdote.getId()));
                allMap.put("name",anecdote.getTitle());
                allMap.put("other1",anecdote.getAuthor());
                allMap.put("other2",anecdote.getTime());
                allMap.put("other3",anecdote.getSort());
                allMap.put("other4",String.valueOf(anecdote.getComment()));
                allMap.put("other5",String.valueOf(anecdote.getStar()));
                allMap.put("other6",String.valueOf(anecdote.getVisit()));

                allList.add(allMap);
            }
            request.setAttribute("Mark","ALL");
            request.setAttribute("Page",currentPage);
            request.setAttribute("totalPage",totalPage);
            request.setAttribute("totalCount",totalCount);
            request.setAttribute("ALLlist",allList);
        }
        else if(Dao.equalsIgnoreCase("anecdotetag")) {
        }
        else   if(Dao.equalsIgnoreCase("uploadimg")) {

        }
//        jsonObject.put("forward",forward);
//        PrintWriter out = response.getWriter();
//        out.println(jsonObject.toString());
//        out.flush();
//        out.close();
        request.getRequestDispatcher(forward).forward(request,response);
    }
}

