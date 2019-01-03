<%@ page import="entity.User" %>
<%@ page import="DaoImp.UserDaoImp" %><%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 12/30/2018
  Time: 11:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>UpdateInfo</title>

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
    <%
        request.setCharacterEncoding("UTF-8");
        String Dao = request.getParameter("Dao");
        String ID = request.getParameter("Id");
        User usr = null;
        try {
            int id = Integer.parseInt(ID.trim());
            usr = new UserDaoImp().findUserById(id);
        }catch(Exception e){
            e.printStackTrace();
        }


    %>
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
                    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">修改信息</strong> / <small><%=Dao%></small></div>
                </div>
                <hr>
            </div>
            <div class="am-u-sm-12 am-u-md-8">
                <div  hidden>
                    <input type="text" id="update-dao"  value="<%=Dao%>" hidden>
                </div>
                <%
                    if( Dao.equalsIgnoreCase("user"))
                    {
                %>
                <form class="am-form am-form-horizontal" role="form" >
                    <div class="am-form-group">
                        <label for="user-name" class="am-u-sm-3 am-form-label">用户名 / Name</label>
                        <div class="am-u-sm-9">
                            <input type="text" id="user-name" placeholder="<%=usr.getName()%>">
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="user-pwd" class="am-u-sm-3 am-form-label">密码 / pwd</label>
                        <div class="am-u-sm-9">
                            <input type="password"  id="user-pwd" placeholder="<%=usr.getPwd()%>">
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="user-nick" class="am-u-sm-3 am-form-label">昵称 / Nick</label>
                        <div class="am-u-sm-9">
                            <input type="text" id="user-nick" placeholder="<%=usr.getNick()%>">
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="user-permission" class="am-u-sm-3 am-form-label">权限</label>
                        <div class="am-u-sm-9">
                            <select class="am-selected-btn" id="user-permission">
                                <option value="user">user</option>
                                <option value="admin">admin</option>
                            </select>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <div class="am-u-sm-9 am-u-sm-push-3">
                            <button type="button" class="am-btn am-btn-primary" onclick="SubmitThis('<%=usr.getId()%>')">保存修改</button>
                        </div>
                    </div>
                </form>
                <%
                    }
                %>

            </div>
            <footer class="admin-content-footer">
                <hr>
                <p class="am-padding-left">© 2018 SIZ.</p>
            </footer>


        </div>
        <!-- content end -->
    </div>
</body>
<script>
    function SubmitThis(ID) {
        var Dao = $("input[id=update-dao]").val();
        var Id = ID;
        if(Dao=="user"){
            var Name = $('input[id=user-name]').val();
            var Pwd = $('input[id=user-pwd]').val();
            var Nick =$('input[id=user-nick]').val();
            var Per =$("#user-permission option:selected").val();

            // alert(Id+" "+Name+" "+Pwd+" "+Nick+" "+Per);

            $.ajax({
                url:"/Servlet_Admin",
                type:"POST",
                dataType:"json",
                data:{type:"update",Dao:Dao,Id:Id,Name:Name,Pwd:Pwd,Nick:Nick,Per:Per},
                success:function (data) {
                    console.log(data);
                    if(data["success"]=="success"){
                        window.location.href=data["forward"];
                    }else
                    {
                        alert("修改失败!");
                    }
                },
                error:function (data) {
                    console.log(data);
                     alert("系统错误,请联系管理员");
                }
            })
        }
    }
</script>
</html>
