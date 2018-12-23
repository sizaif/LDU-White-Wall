<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 11/19/2018
  Time: 4:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WhiteWall</title>
    <%@include file="/HeadTag.jsp"%>
    <link rel="stylesheet" href="/extend/clock/css/style.css">
</head>
<body>
        <div class="container">
            <jsp:include page="../HeaderNav.jsp"></jsp:include>
            <div class="row clearfix">
                <%--菜单栏--%>
                <div class="col-md-2 column">
                    <jsp:include page="../MenuList.jsp"></jsp:include>
                    <%--时钟--%>
                    <%--<div class="row clearfix">--%>
                        <%--<div class="col-md-12 column">--%>
                            <%--<div class="clock">--%>
                                <%--<div class="numbers">--%>
                                    <%--<ul>--%>
                                        <%--<li>12</li>--%>
                                        <%--<li>3</li>--%>
                                        <%--<li>6</li>--%>
                                        <%--<li>9</li>--%>
                                    <%--</ul>--%>
                                <%--</div>--%>
                                <%--<div class="clockwise">--%>
                                    <%--<div class="center"></div>--%>
                                    <%--<div class="hand-second" id="analogsecond"></div>--%>
                                    <%--<div class="hand-minute" id="analogminute"></div>--%>
                                    <%--<div class="hand-hour" id="analoghour"></div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                </div>

                <div class="col-md-10 column">
                    <%--表白墙--%>
                    <div >
                        <h2>表白墙</h2>
                        <div class="row">
                            <c:forEach var="whiteWall" items="${whitewall_PageList}">
                                <div class="col-md-4">
                                    <div class="thumbnail" >
                                        <div>
                                            <img width="150px" height="160px" src="${whiteWall.imageurl}" />
                                            <div class="caption">
                                                <%--<h3> ${whiteWall.id}</h3>--%>
                                                <p>
                                                    ${whiteWall.textWhite}
                                                </p>
                                                <p>
                                                    <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div >
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div >
                        <nav>
                            <ul class="pagination">
                                <li><a href="<c:url value="/Servlet_page?Page=1"/>">首页</a></li>

                                <li><a href="<c:url value="/Servlet_page?Page=${page-1>1?page-1:1}"/>" class="button button-raised button-caution">&laquo;</a></li>

                                <c:forEach begin="1" end="${totalPage}" varStatus="loop">
                                    <c:set var="active" value="${loop.index==page? 'active':''}"/>
                                    <li><a class="button button-raised button-caution" href="<c:url value="/Servlet_page?Page=${loop.index}"/>">${loop.index}</a></li>
                                </c:forEach>

                                <li><a href="<c:url value="/Servlet_page?Page=${page+1 <totalPage ? page+1 : totalPage}"/> " class="button button-raised button-caution">&raquo;</a></li>

                                <li><a href="<c:url value="/Servlet_page?Page=${totalPage}"/>">尾页</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
</body>
<script  src="/extend/clock/js/index.js"></script>
<script src="/extend/clock/js/prefixfree.min.js"></script>
</html>
