<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 9/17/2018
  Time: 8:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WelcomeAdmin</title>
    <link rel="stylesheet" href="../css/newtab.css">
    <frameset rows="132,*" cols="*" frameborder="yes" border="1" framespacing="0">
        <frame src="/Administration/Admin_top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
        <frameset rows="*" cols="*,250" framespacing="0" frameborder="yes" border="1">
            <frame src="/Administration/Admin_main.jsp" name="mainFrame" id="mainFrame" title="mainFrame" />
            <frame src="/Administration/Admin_left.jsp" name="rightFrame" scrolling="No" noresize="noresize" id="rightFrame" title="rightFrame" />
        </frameset>
    </frameset>
</head>

<body>


</body>
</html>
