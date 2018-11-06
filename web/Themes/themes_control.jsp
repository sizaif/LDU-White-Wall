<%@ page import="DaoImp.ThemesDaoImp" %>
<%@ page import="entity.Theme" %><%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 10/30/2018
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>themes_control</title>
</head>
<body>
    <div>
        <%
            request.setCharacterEncoding("UTF-8");
            String name = request.getParameter("themename");
            Theme them = null;
            them = new ThemesDaoImp().findthemeByName(name);

            if( them != null ) {
                out.println("<script>alert('"+name+"已经存在! 请重试.');top.location.href='../Administration/welcomeAdmin.jsp';</script>");
            }
            else{
                new ThemesDaoImp().inserttheme(new Theme(0,name));
                response.sendRedirect("themeList1.jsp");
            }
//            HttpSession Ssession = request.getSession();
        %>
    </div>
</body>
</html>
