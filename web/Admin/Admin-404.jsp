<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 1/3/2019
  Time: 7:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
                    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">404</strong> / <small>That’s an error</small></div>
                </div>

                <hr>

                <div class="am-g">
                    <div class="am-u-sm-12">
                        <h2 class="am-text-center am-text-xxxl am-margin-top-lg">404. Not Found</h2>
                        <p class="am-text-center">没有找到你要的页面</p>
                        <pre class="page-404">
          .----.
       _.'__    `.
   .--($)($$)---/#\
 .' @          /###\
 :         ,   #####
  `-..__.-' _.-\###/
        `;_:    `"'
      .'"""""`.
     /,  ya ,\\
    //  404!  \\
    `-._______.-'
    ___`. | .'___
   (______|______)
        </pre>
                    </div>
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
