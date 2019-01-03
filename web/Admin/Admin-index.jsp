<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 12/27/2018
  Time: 8:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>后台主页</title>
    <meta name="mobile-web-app-capable" content="yes">
    <%--<link rel="icon" sizes="192x192" href="/extent/assets/i/app-icon72x72@2x.png">--%>

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/extend/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="/extend/assets/css/app.css">
    <link rel="stylesheet" href="/extend/assets/css/admin.css">
    <script src="/extend/assets/js/amazeui.ie8polyfill.min.js"></script>
    <script src="/extend/assets/js/amazeui.min.js"></script>

</head>
<body>
    <%--Header start--%>
    <%@include file="Admin-header.jsp"%>
    <%--Header end--%>

    <div class="am-cf admin-main">
        <%--sidebar start--%>
        <%@include file="Admin-sidebar.jsp"%>
        <%--sidebar end--%>
        <div class="admin-content">
            <div class="admin-content-body">
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong> / <small>一些常用模块</small></div>
                </div>
            </div>
            <footer class="admin-content-footer">
                <hr>
                <p class="am-padding-left">© 2018 SIZ V2.license.</p>
            </footer>
        </div>

    </div>

</body>
</html>
