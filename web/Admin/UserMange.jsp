<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 12/26/2018
  Time: 5:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/css/HeaderNav.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/HeaderNav.jsp"></jsp:include>
<<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>
                        编号
                    </th>
                    <th>
                        用户名
                    </th>
                    <th>
                        密码
                    </th>
                    <th>
                        用户昵称
                    </th>
                    <th>
                        权限
                    </th>
                    <th>
                        管理
                    </th>
                </tr>
                </thead>
                <c:forEach var="User" varStatus="j" items="${userPageList}">
                    <tr class="error">
                        <input name="getID" value="${User.id}" hidden/>
                        <th>
                                ${User.id}
                        </th>
                        <th>
                                ${User.name}
                        </th>
                        <th>
                                ${User.pwd}
                        </th>

                        <th>
                                ${User.nick}
                        </th>
                        <th>
                                ${User.permission}
                        </th>
                        <th>
                            <a href="#">修改</a>
                            <a href="javascript:void(0)" onclick="Delete()">删除</a>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <nav>
            <ul class="pagination">
                <li><a href="<c:url value="/Servlet_PageService?Page=1&Dao=user"/>">首页</a></li>

                <li><a href="<c:url value="/Servlet_PageService?Dao=user&Page=${page-1>1?page-1:1}"/>" class="button button-raised button-caution">&laquo;</a></li>

                <c:forEach begin="1" end="${totalPage}" varStatus="loop">
                    <c:set var="active" value="${loop.index==page? 'active':''}"/>
                    <li><a class="button button-raised button-caution" href="<c:url value="/Servlet_PageService?Dao=user&Page=${loop.index}"/>">${loop.index}</a></li>
                </c:forEach>

                <li><a href="<c:url value="/Servlet_PageService?Dao=user&Page=${page+1 <totalPage ? page+1 : totalPage}"/> " class="button button-raised button-caution">&raquo;</a></li>

                <li><a href="<c:url value="/Servlet_PageService?Dao=user&Page=${totalPage}"/>">尾页</a></li>
            </ul>
        </nav>
    </div>
</div>
</body>
<script>
    function Delete() {
        var id=$("input[name='getID']").val();
        var type ="delete";
        alert(id);
        console.log(id);

        $.ajax({
            type:"POST",
            url : "/Servlet_Admin",
            data: {type:type,id:id},
            dataType:"json",
            success: function (data) {
                console.log(data);
                if(data["success"]){
                    alert("删除成功!");
                    window.location.reload();
                }else {
                    alert("删除失败!");
                    window.location.reload();
                }

            },
            error:function (data) {
                alert("删除失败!");
                window.location.reload();
            }
        })
    }
</script>
</html>
