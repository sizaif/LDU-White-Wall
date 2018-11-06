<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 10/22/2018
  Time: 8:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index_Top</title>
</head>
<body>
    <jsp:useBean id="Time" class="java.util.Date"></jsp:useBean>

    <%
        String name = "Weclome to my House";
        String urlAddress = "http://www.sizaif.com";
        String Page = "www.baidu.com";
    %>
    <div style="text-align: center;font-size:35px">
        <%=name%>
        <a href="<%=urlAddress%>">Sizaif小屋</a>
    </div>
</body>
</html>
