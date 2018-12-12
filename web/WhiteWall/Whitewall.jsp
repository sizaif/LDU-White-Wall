<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 11/19/2018
  Time: 4:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WhiteWall</title>
    <%@include file="/HeadTag.jsp"%>
</head>
<body>
        <jsp:include page="../HeaderNav.jsp"></jsp:include>
        <jsp:include page="../MenuList.jsp"></jsp:include>

        <%--表白墙--%>
        <div>
                <%--随机六个一组--%>
                <span><button type="button" onclick="javascrapt:Flash()">换一组</button> </span>
        </div>
</body>
<script>
       function Flash() {

       } 
</script>
</html>
