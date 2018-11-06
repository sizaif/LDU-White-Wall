<%@ page import="entity.mysql" %>
<%@ page import="DaoImp.ThemesDaoImp" %><%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 10/16/2018
  Time: 12:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Theme_delete</title>
</head>
<body>
    <div>
        <%
            /*
             *  页面逻辑:
             *    数据库更新 删除 从 themeList1.jsp  传过来的 tid
             *    并返回到
             */
            request.setCharacterEncoding("UTF-8");
            String Tid = request.getParameter("tid");

            new ThemesDaoImp().deletetheme(Integer.parseInt(Tid.trim()));

            response.sendRedirect("themeList1.jsp");
        %>
    </div>
</body>
</html>
