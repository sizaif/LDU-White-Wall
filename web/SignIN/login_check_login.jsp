<%@ page import="entity.mysql" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="entity.User" %>
<%@ page import="DaoImp.UserDaoImp" %><%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 9/17/2018
  Time: 8:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>checklog</title>
</head>
<body>

    <%
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String pwd = request.getParameter("pwd");
        /*
         * 连接数据库
         * 查询name 和 pwd 语句 返回到User 类 中
         * 查询结果
         * 如果 找到 对应 则  判定 用户名 密码正确  跳转下一个页面
         * 否则返回登陆页面
        */
        UserDaoImp mysql = new UserDaoImp();
        User user = mysql.findUserByNamePwd(name,pwd);

        int flag = 1;
        if (user!=null) {
            String getName = user.getName();
            String getpwd = user.getPwd();
            String getPermission = user.getPermission();
            //out.print("<br>");
            if(getName.equals(name) && getpwd.equals(pwd)){
                flag = 0;
                //out.print(getName+ " "+getpwd+" "+getPermission);
                session = request.getSession();
                session.setAttribute("user_name",getName);
                session.setAttribute("user_pwd", getpwd);
                session.setAttribute("user_permission",getPermission);

                if(getPermission.equals(new String("admin").toLowerCase())) {
                    request.getRequestDispatcher("../Administration/welcomeAdmin.jsp").forward(request,response);
                }
                else{
                     request.getRequestDispatcher("../Users/welcomeUser.jsp").forward(request,response);
                }
            }
        }
        if( flag == 1)
            response.sendRedirect("login.jsp");
    %>
</body>
</html>
