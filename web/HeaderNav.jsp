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
    <%@include file="/HeadTag.jsp"%>
    <%--<link rel="stylesheet" href="/css/logCsszhihu.css" type="text/css" media="all">--%>

    <link rel="stylesheet" href="/css/HeaderNav.css" type="text/css" media="all">
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
                                out.print("                        <div class=\"nav-account\">\n" +
                                        "                            <button class=\"button\" id=\"log\" >登录</button>\n" +
                                        "                            <button class=\"button\" id=\"reger\">注册</button>\n" +
                                        "                        </div>");

                            }
                            else
                            {
                                out.print("                        <div class=\"nav-account\">\n" +
                                        "                            <a href=\"/SignIN/Userinfo.jsp\" class=\"button\" ><span>账号信息</span></a>\n" +
                                        "                            <a href=\"javascript:void(0)\" class=\"button\" onclick=\"Logout()\"><span>登出</span></a>\n" +
                                        "                        </div>");
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
    <div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                    </button>
                    <h2 class="modal-title SignFlowHeader-slogen" id="myModalLabel" style="position: center">
                        通往新世界的大门
                    </h2>
                </div>
                <div class="modal-body">
                    <form  role="form"   class="SignFlow"  >
                        <div class="SignFlow-account">
                            <div class="SignFlow-supportedCountriesSelectContainer"></div>
                            <div class="SignFlowInput SignFlow-accountInputContainer">
                                <div class="SignFlow-accountInput Input-wrapper">
                                    <input class="Input" type="text" name="username" id="username" placeholder="用户名"value="">
                                </div>
                                <div class="SignFlowInput-errorMask SignFlowInput-errorMask--hidden"></div>
                            </div>
                        </div>
                        <div class="SignFlow-password">
                            <div class="SignFlowInput SignFlow-accountInputContainer">
                                <div class="SignFlow-passwordInput Input-wrapper">
                                    <input class="Input" type="password" name="password" id="password" value="" >
                                </div>
                                <div class="SignFlowInput-errorMask SignFlowInput-errorMask--hidden"></div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit"  class="btn btn-primary SignFlow-submitButton  Button--primary Button--blue" onclick="CheckUserInfoAndLogin()">登陆</button>
                    <div class="SignContainer-switch">
                        无账号?
                        <span><button type="button" onclick="javascrtpt:window.location.href='../SignUP/reger.jsp'" >注册一个</button></span>
                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="RegisteredModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h2 class="modal-titleswitch-nav-wrap" id="myModalLabe2" style="position: center">
                        注册账号
                    </h2>
                </div>
                <div class="modal-body">
                    <form  role="form"  enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">账号</label>
                            <div class="col-sm-9">
                                <li>
                                    <input type="text" class="form-control" name="username" id="register_username" value="" placeholder="账号">
                                </li>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">昵称</label>
                            <div class="col-sm-9">
                                <li>
                                    <input type="text" class="form-control" name="nick" id="register_nick" value="" placeholder="昵称">
                                </li>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">密码</label>
                            <div class="col-sm-9">
                                <li>
                                    <input type="password" class="form-control" name="password" id="register_password" placeholder="密码 (长度不少于 8 位)" value="">
                                </li>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">重复密码</label>
                            <div class="col-sm-9">
                                <li>
                                    <input type="password" class="form-control" name="password2" id="_registerpassword2" placeholder="重复密码"value="">
                                </li>
                            </div>
                        </div>
                        <%--<li>--%>
                        <%--<input type="text" class="Input" name="age" placeholder="年龄" id="age">--%>
                        <%--</li>--%>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit"  class="btn btn-primary" onclick="CheckUserInfoAndRegister()">注册</button>
                    <button type="reset" class="btn btn-default" name="reset">重置</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>

</body>

<script type="text/javascript">
    $(function () {
        /*
            先隐藏
         */
        $('#RegisteredModal').modal('hide');
        $('#LoginModal').modal("hide");
        // 监听事件
        $('#log').click(function () {
            $('#LoginModal').modal('show');
        });
        $('#reger').click(function () {
            $('#RegisteredModal').modal("show");
        });

    });
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

    <%-- Login 模态框--%>
    function CheckUserInfoAndLogin() {
        var Name = $.trim($('#username').val());
        var Pwd =  $.trim($('#password').val());
        if(!Name){
            alert("用户名不能为空!");
            return false;
        }
        if(!Pwd){
            alert("密码不能为空!")
            return false;
        }
        $.ajax(
            {
                url:"/Servlet_Login",
                type:"post",
                data:{username:Name,password:Pwd},
                dataType:"json",
                success:function (data) {
                    var urll = data["forward"];
                    window.location.href=urll;
                },
                error:function (data) {
                    var urll = data["forward"];
                    alert("登陆失败!");
                    window.location.href=urll;
                }
            }
        )
        return false;
    }
    function CheckUserInfoAndRegister() {
        var Name = $.trim($('#register_username').val());
        var Pwd1 =  $.trim($('#register_password').val());
        var Pwd2 =  $.trim($('#register_password2').val());
        var Nick = $.trim($('#register_nick').val());
        if(!Name){
            alert("用户名不能为空!");
            return false;
        }
        if(!Pwd1){
            alert("密码不能为空!")
            return false;
        }
        if( Pwd1==Pwd2 ){
            if( Pwd1.length<8)
            {
                alert("密码长度过短!");
                return false;
            }
            $.ajax({
                type:"POST",
                url : "/Servlet_Users",
                data: {type:"signup",username:Name,password: Pwd1,usernick:Nick},
                dataType:"json",
                success: function (data) {
                    var urll = data["forward"];
                    alert("注册成功!");
                    window.location.href= urll;

                },
                error:function () {
                    var urll = data["forward"];
                    alert("注册失败!");
                    window.location.href= urll;
                }
            })
        }
        else
        {
            alert("输入密码不一致!");
            return false;
        }
        return false;
    }
</script>
</html>


