package Servlet;

import DaoImp.UploadImgDaoImp;
import DaoImp.WhiteWallDaoImp;
import entity.Uploadimg;
import entity.WhiteWall;
import net.sf.json.JSONObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "Servlet_Upload",urlPatterns = "/Servlet_Upload")
public class Servlet_Upload extends HttpServlet {

    private WhiteWallDaoImp whiteWallDaoImp;
    // 上传配置
    int memory_threshold   = 1024 * 1024 * 10;  // 3MB`
    int max_file_size      = 1024 * 1024 * 40; // 40MB
    int max_request_size   = 1024 * 1024 * 50; // 50MB

    String upload_directory = "upload";
    String slash_directory = "/";
    /**
     *  处理 上传
     */

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     * @Auther admin
     * @explain  servlet 处理的是 文件图片和其他数据 一起的多数据 ,form表单采用的是 multipart/form-data 格式
     *           request.getParameter() 得到的数据 为null
     *           解决方法: 采用 apache 的fileupload组件,smartupload  需要导入commons-fileupload-1.3.2.jar和commons-io-2.6.jar 包
     *                     并在 tomcat 目录下的 lib 中 拷贝一份
     *           使用方法:   DiskFileItemFactory factory = new DiskFileItemFactory();
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    upload.setHeaderEncoding("UTF-8");
                    List<FileItem> formItems = upload.parseRequest(request);
                    Map param = new HashMap();
                    if (formItems != null && formItems.size() > 0) {
                    for (FileItem item : formItems) {
                    if (fileItem.isFormField()) { // 文件图片
                    param.put(fileItem.getFieldName(), fileItem.getString("utf-8"));//如果你页面编码是utf-8的
                    }else{
                    // 表单中的其他数据
                    }
                    } }
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String forward="";
        JSONObject jsonObject =new JSONObject();

        // 配置上传参数
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 配置内存临界值
        factory.setSizeThreshold(memory_threshold);
        // 设置临时存储路径
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));;

        ServletFileUpload upload = new ServletFileUpload(factory);

        // 设置最大文件上传值
        upload.setFileSizeMax(max_file_size);
        // 设置最大请求值 (包含文件和表单数据)
        upload.setSizeMax(max_request_size);
        upload.setHeaderEncoding("UTF-8");
        // 上传文件的存储路径
        String realPath = getServletContext().getRealPath("");
        realPath = realPath.replace("\\","/"); // 统一斜杠 为 右斜
        String uploadPath =  realPath+upload_directory;

//        System.out.println(uploadPath);
        String fileName="";
        String filePath="";
        // 如果空 则创建
        File uploadDir = new File(uploadPath);
        if(!uploadDir.exists()){
            uploadDir.mkdirs();
        }
        Map paramMap = new HashMap();

        try {
            /**
             *  逻辑分析:
             *  对获取的类型进行分析,
             *      如果是图片,则进行改名: (格式)图片名+日期   本地改名
             *      如果是其他类型 则 插入到数据库中,  数据库存的是 图片地址 url
             *
             */
            List<FileItem> formItems = upload.parseRequest(request);
            if (formItems != null && formItems.size() > 0) {
                for (FileItem item : formItems) {
                    // 处理不在表单中的字段  如果是文件 或者图片 等
                    if (!item.isFormField()) {
                        fileName = new File(item.getName()).getName();
                        filePath = uploadPath + slash_directory + fileName;

                        SimpleDateFormat sim = new SimpleDateFormat("yyyyMMdd");
                        String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());//文件后缀
                        String newFileName =  sim.format(new Date().getTime())+"_"+ new Random().nextInt(100000)+fileType;// 新文件名
                        String newFilePath =  uploadPath+slash_directory+newFileName;
//                        System.out.println("New :"+newFileName);

                        File storeFile = new File(filePath);// 创建写入file
                        item.write(storeFile);// 写入到本地
                        new File(filePath).renameTo(new File(newFilePath)); //修改文件名字
//                        System.out.println(" img: "+newFileName +" imgpath : "+newFilePath);

                        paramMap.put("fileName", newFileName);
                        paramMap.put("filePath", slash_directory+upload_directory+slash_directory+newFileName);

                    }else {
                        // 如果是 其他数据  例如 insert , textArea
                        String value = item.getString("utf-8");
//                        System.out.println("others: "+value);
                        paramMap.put(item.getFieldName(), value);
                    }
                }
            }


            try {
//               插入到数据库中
                Uploadimg up = new Uploadimg(0,(String)paramMap.get("filePath"));
                int su = new UploadImgDaoImp().insertUploadimg(up);
                int upId = new UploadImgDaoImp().getLastId();
                if( su == 0 )
                {
                    jsonObject.put("success","fail");
                }
                else
                    jsonObject.put("success","success");
                jsonObject.put("filePath",paramMap.get("filePath"));
                jsonObject.put("imgId",upId);
            }catch(Exception e){
                e.printStackTrace();
            }finally{

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
