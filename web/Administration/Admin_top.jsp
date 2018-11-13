<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 10/22/2018
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="./css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
    <link rel="stylesheet" href="./css/Admin_topcss.css" type="text/css" media="all" />
    <script src="../js/jquery-3.3.1.min.js"></script>
</head>
<body>
    <%-- 导航栏--%>
    <div class="top-nav">
        <nav class="navbar navbar-default">
            <div class="container">
                <!--右半部分-->
                <div class="navbar-header navbar-right">
                    <ul>
                        <li><div> <a href="#"><span>登陆</span></a></div></li>
                        <li><div>
                            <div class="loginCenter">
                                <a href="#">账号信息</a>
                            </div>
                            <div class="usercontrol"></div>
                        </div></li>
                        <li><div> <a href="#"><span>登出</span></a></div></li>
                    </ul>
                </div>
                <!--navigation-->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-left cl-effect-5">
                        <li> <a href="#"  ><span data-hover="趣闻轶事">趣闻轶事</span></a></li>
                        <li> <a href="#"  ><span data-hover="表白墙">表白墙</span></a></li>
                        <li> <a href="#"  ><span data-hover="寻人">寻人</span></a></li>
                        <li> <a href="#"  ><span data-hover="留坑">留坑</span></a></li>
                        <li> <a href="#"  ><span data-hover="留坑">留坑</span></a></li>
                        <li> <a href="#"  ><span data-hover="留坑">留坑</span></a></li>
                        <li> <a href="#"  ><span data-hover="关于我们">关于我们</span></a></li>
                    </ul>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <!-- end globalNav -->

        </nav>
    </div>

        <%--<%--%>
            <%--Object user_name = session.getAttribute("user_name");--%>
            <%--Object user_permission =  session.getAttribute("user_permission");--%>
            <%--out.print("<div>session : 信息 : "+user_name+"  SSSS  权限: "+user_permission+"  </div>");--%>
            <%--String name = user_name.toString();--%>
        <%--%>--%>
        <%--<h1 align="center">--%>
            <%--Weclome ! <%=name%>--%>
        <%--</h1>--%>
    </div>

</body>
</html>
