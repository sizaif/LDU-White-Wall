<%@ page import="entity.mysql" %>
<%@ page import="DaoImp.ThemesDaoImp" %>
<%@ page import="entity.Theme" %><%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 10/15/2018
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FUUSS</title>
</head>
<body>
    <%
        /*
         *  页面逻辑:
         *  处理从update_thmes2.jsp 中传过来的  tid 和tname  数据库更新操作
         *  可能 tid 多传 一个空格  处理掉空格
         *  连接数据库  update 接口更新
         *  返回到themeList1.jsp
         */
        request.setCharacterEncoding("UTF-8");
        String Tid = request.getParameter("tid");
        String Change_name = request.getParameter("themename");

        Tid=Tid.trim();// 取掉首位空格

        new ThemesDaoImp().updatetheme(new Theme(Integer.parseInt(Tid.trim()),Change_name));

        response.sendRedirect("themeList1.jsp");
    %>
</body>
</html>
