<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 1/4/2019
  Time: 10:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Photo</title>
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
        <!-- sidebar start -->
        <%@include file="Admin-sidebar.jsp"%>
        <!-- sidebar end -->

        <!-- content start -->
        <div class="admin-content">

            <div class="admin-content-body">
                <div class="am-cf am-padding am-padding-bottom-0">
                    <div class="am-fl am-cf">
                        <strong class="am-text-primary am-text-lg">相册</strong> / <small>Gallery</small>
                    </div>
                </div>

                <hr>

                <ul class="am-avg-sm-2 am-avg-md-4 am-avg-lg-6 am-margin gallery-list">
                    <c:forEach var="photo" items="${allimg}">
                        <li>
                            <a href="#">
                                <img class="am-img-thumbnail am-img-bdrs" src="${photo}" alt=""/>
                            </a>
                        </li>
                    </c:forEach>
                </ul>

                <div class="am-margin am-cf">
                    <hr/>
                    <p class="am-fl">共 ${length} 条记录</p>
                    <ol class="am-pagination am-fr">
                        <li class="am-disabled"><a href="#">&laquo;</a></li>
                        <li class="am-active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ol>
                </div>
            </div>

            <footer class="admin-content-footer">
                <hr>
                <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
            </footer>

        </div>
        <!-- content end -->
    </div>
</body>
</html>
