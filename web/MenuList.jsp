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
    <%--<link rel="stylesheet" href="../css/Admin_leftCSS.css" type="text/css" charset="UTF-8">--%>
    <%--<script src="/js/menu-display.js"></script>--%>
</head>
<body>
<div class="panel-group" id="panel-804515">
    <div class="panel panel-default">
        <div class="panel-heading">
            <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-804515" href="#panel-element-498571">表白选项</a>
        </div>
        <div id="panel-element-498571" class="panel-collapse collapse">
            <div class="panel-body">
                <a href="/WhiteWall/Add.jsp">发布表白</a>
            </div>
            <div class="panel-body">
                <a href="#">管理自己的表白</a>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <a class="panel-title" data-toggle="collapse" data-parent="#panel-804515" href="#panel-element-766719">寻人相关</a>
        </div>
        <div id="panel-element-766719" class="panel-collapse in">
            <div class="panel-body">
                <a href="#">发布寻人通缉令</a>
            </div>
            <div class="panel-body">
                <a href="#">管理通缉令</a>
            </div>
        </div>
    </div>
</div>
</body>
<style>
    .panel-group .panel{border-radius: 25px;}
    .panel-default>.panel-heading{border-radius: 25px;}
</style>
</html>
