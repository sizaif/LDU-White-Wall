<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 1/4/2019
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Manage</title>
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <%@include file="/HeadTag.jsp"%>
</head>
<body>

    <div class="container">
        <jsp:include page="../HeaderNav.jsp"></jsp:include>
        <div class="row clearfix">
            <div class="col-md-12 column">
                <table class="table">
                    <thead>
                    <tr>
                        <th>
                            编号
                        </th>
                        <th>
                            内容
                        </th>
                        <th>
                            操作
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="white" items="${alllist}">
                        <tr class="info">
                            <td>
                                ${white.id}
                            </td>
                            <td>
                                ${white.textWhite}
                            </td>
                            <td>
                                <a>修改</a>
                                <a>删除</a>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
