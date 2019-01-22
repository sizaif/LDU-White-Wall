package Servlet;

import DaoImp.WhiteWallDaoImp;
import entity.WhiteWall;
import net.sf.json.JSONObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.RequestContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@WebServlet(name = "Servlet_White",urlPatterns = "/Servlet_White")
public class Servlet_White extends HttpServlet {


    String lastboundary = ""; // 结束分界符字符串

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
                String textArea = request.getParameter("textArea");
                String action = request.getParameter("type");
                String filepath = request.getParameter("filepath");
                String userID = request.getParameter("userID");
                int begin = filepath.indexOf("/upload");
                int last = filepath.length();
                filepath = filepath.substring(begin,last);
                int id ;
                try {
                        if(action.equalsIgnoreCase("insert")){
                            id = Integer.parseInt(userID.trim());
                            if(action==null)
                            {
                                jsonObject.put("success","fail");
                            }
                            else
                            {
                                WhiteWall wall = new WhiteWall(1,textArea,filepath,id);
                                int su = new WhiteWallDaoImp().insertWhite(wall);
                                if( su==0)
                                {
                                    jsonObject.put("success","fail");
                                    jsonObject.put("forward","/WhiteWall/Whitewall.jsp");
                                }
                                else {
                                    jsonObject.put("success", "success");
                                    jsonObject.put("forward","/WhiteWall/Whitewall.jsp");
                                }
                            }
                        }

                }catch(Exception e){
                    jsonObject.put("success","fail");
                    jsonObject.put("forward","/WhiteWall/Whitewall.jsp");
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
