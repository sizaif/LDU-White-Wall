<%--
Created by IntelliJ IDEA.
  User: SIZ
  Date: 10/22/2018
  Time: 5:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>loging_check_control</title>
</head>
<body>
        <%
            Object user_name = session.getAttribute("user_name");
            Object user_permission =  session.getAttribute("user_permission");
            if( user_name==null) // exit log info
            {
                 response.sendRedirect("login.jsp");
            }
            else{
                if( user_permission.equals("user") ){ // User
                    out.print("你没有权限.! ");
                    response.sendRedirect("login.jsp");
                }
            }
        %>
</body>
</html>
