<%@ page import="entity.mysql" %>
<%@ page import="DaoImp.NewsDaoImp" %>
<%@ page import="entity.News" %><%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 10/9/2018
  Time: 5:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>addnew_back</title>
</head>
<body>
        <div>
            <%
                request.setCharacterEncoding("UTF-8");
                String title = request.getParameter("ntitle");
                String theme = request.getParameter("ntheme");
                String news = request.getParameter("nnews");

                NewsDaoImp mysql = new NewsDaoImp();
                int succ = mysql.insertnews(new News(0,theme,news,title));

                if( succ > 0 ){
                    out.print("<script>alert(\"添加成功!\");location(\"news_add.jsp\");</script>");
                }else{
                    out.print("<script>alert(\"添加失败!\");location(\"news_add.jsp\");</script>");
                }
            %>
        </div>

</body>
</html>
