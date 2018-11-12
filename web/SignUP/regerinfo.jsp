<%@ page import="entity.mysql" %>
<%@ page import="entity.User" %>
<%@ page import="DaoImp.UserDaoImp" %><%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 9/17/2018
  Time: 6:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>regerinfo</title>
</head>
<body>
    <div>
        <%
            request.setCharacterEncoding("UTF-8");
            String name = request.getParameter("name");
            String pwd = request.getParameter("pwd");

            String age = request.getParameter("age");
            int id = 0;
            /*
             *  User 类
             *  mysql 实现 UserDaoImp
            */
            User newuser = new User(id,name,pwd,"user");
            UserDaoImp mysql = new UserDaoImp();
            int su =  mysql.insertUser(newuser);
            response.sendRedirect("../SignIN/login.jsp");
        %>
    </div>


    <%--<div>--%>
        <%--<table border="1">--%>
            <%--<tr>--%>
                <%--<td>--%>
                    <%--your info is :--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>--%>
                    <%--name: <%=name%>--%>
                    <%--name: <%=newuser.getName()%>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>--%>
                    <%--pwd : <%=pwd%>--%>
                    <%--pwd : <%=newuser.getPwd()%>--%>
                <%--</td>--%>
            <%--</tr>--%>
        <%--</table>--%>
    <%--</div>--%>

</body>
</html>
