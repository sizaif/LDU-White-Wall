<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 10/22/2018
  Time: 4:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WelcomeUser</title>
</head>
<body>
        <br>WelcomeUSer.<br>
        <div>
            <%
                Object user_name = session.getAttribute("user_name");
                Object user_permission =  session.getAttribute("user_permission");
                out.print("<div>session : 信息 "+user_name+"SSSS </div>");
            %>
            <%
                String name = request.getParameter("name");
            %>
            <h1 align="center">
                Weclome ! <%=name%>
            </h1>
        </div>
</body>
</html>
