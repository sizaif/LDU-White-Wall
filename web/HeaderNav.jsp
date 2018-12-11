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
    <link href="/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
    <link rel="stylesheet" href="/css/HeaderNav.css" type="text/css" media="all" />
    <script src="js/jquery-3.3.1.min.js"></script>
    

</head>

<body>
    <%-- 导航栏--%>
    <%
        Object user_name = session.getAttribute("username");
        Object user_permission =  session.getAttribute("permission");
    %>
    <div class="top-nav">
        <nav class="navbar navbar-default">
            <div class="container">
                <!--右半部分-->
                <div class="navbar-header navbar-right">
                    <ul>

                        <%
                            if( user_name ==null || user_permission ==null)
                            {
                                out.print("<li><div  class =\"\"> <a href=\"/SignIN/login.jsp\" ><span>登陆</span></a></div></li>");
                                out.print("<li><div > <a href=\"/SignUP/reger.jsp\"><span>注册</span></a></div></li>");
                            }
                            else
                            {
                                out.print("<li><div class=\"loginCenter\">\n" +
                                        "                            <a href=\"/SignIN/Userinfo.jsp\" target=\"\"><span>账号信息</span></a>\n" +
                                        "                        </div></li>\n" +
                                        "                        <li><div> <a href=\"javascript:void(0) \"onclick=\"Logout()\"><span>登出</span></a></div></li>");
                            }
                        %>

                        <div class="usercontrol"></div>
                    </ul>
                </div>
                <!--navigation-->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-left cl-effect-5">
                        <li> <a href="#"  ><span data-hover="趣闻轶事">趣闻轶事</span></a></li>
                        <li> <a href="/WhiteWall/Whitewall.jsp"  ><span data-hover="表白墙">表白墙</span></a></li>
                        <li> <a href="/SearchUser/SU_home.jsp"  ><span data-hover="寻人">寻人</span></a></li>
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





</body>
<script type="text/javascript">
    <%-- Logout--%>
    function Logout() {
        $.ajax({
            type:"POST",
            url : "/Servlet_Users",
            dataType:"json",
            data: {type:"logout"},
            success: function (data) {
                alert("登出成功!");
                var urll = data["forward"];
                window.location.href=urll
            },
            error:function () {
                alert("登出失败!");
                window.location.reload();
            }
        })
    }
</script>
</html>
