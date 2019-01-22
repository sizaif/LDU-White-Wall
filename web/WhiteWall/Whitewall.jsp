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
        <%
            Object user_name = session.getAttribute("username");
            Object user_permission =  session.getAttribute("permission");
            System.out.println(user_name+ " "+ user_permission);
        %>
        <div class="container">
            <jsp:include page="../HeaderNav.jsp"></jsp:include>
            <div class="row clearfix">
                <%--菜单栏--%>
                <div class="col-md-2 column">
                    <div class="row clearfix">
                        <div class="col-md-12 column">
                            <%--选项--%>
                            <%
                                if( user_name ==null || user_permission ==null){

                                }
                                else
                                {
                            %>
                                <%@include file="../MenuList.jsp"%>
                            <%
                                }
                            %>
                        </div>

                    </div>
                    <div class="row clearfix">
                        <div class="col-md-12 column">
                            <%--云标签--%>
                        </div>
                    </div>
                    <div class="row clearfix" >
                        <div class="col-md-12 column" >
                            <%--时钟--%>

                        </div>
                    </div>

                    <%--时钟--%>

                </div>

                <div class="col-md-10 column">
                    <%--表白墙--%>
                    <div >
                        <h2>表白墙</h2>
                        <div class="row">
                            <c:forEach var="whiteWall" varStatus="j" items="${whitewall_PageList}">
                                <div class="col-md-4">
                                    <div class="thumbnail" >
                                        <div>
                                        <c:if test="${whiteWall.imageurl !=null}">
                                            <img  id="whiteimg${j.index}" width="auto" height="160px" style="border-radius: 8px;"  src="${whiteWall.imageurl}"  />
                                        </c:if>
                                            <div class="caption">
                                                <%--<h3> ${whiteWall.id}</h3>--%>
                                                <p>
                                                    ${whiteWall.textWhite}
                                                </p>
                                                <p>
                                                    <a class="btn"  href="/Servlet_White_detail?type=detail&id=${whiteWall.id}">详情</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div >
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div  >
                        <%--分页--%>
                        <nav>
                            <ul class="pagination">
                                <li><a href="<c:url value="/Servlet_PageService?Page=1&Dao=whitewall"/>">首页</a></li>

                                <li><a href="<c:url value="/Servlet_PageService?Dao=whitewall&Page=${page-1>1?page-1:1}"/>" class="button button-raised button-caution">&laquo;</a></li>

                                <c:forEach begin="1" end="${totalPage}" varStatus="loop">
                                    <c:set var="active" value="${loop.index==page? 'active':''}"/>
                                    <li><a class="button button-raised button-caution" href="<c:url value="/Servlet_PageService?Dao=whitewall&Page=${loop.index}"/>">${loop.index}</a></li>
                                </c:forEach>

                                <li><a href="<c:url value="/Servlet_PageService?Dao=whitewall&Page=${page+1 <totalPage ? page+1 : totalPage}"/> " class="button button-raised button-caution">&raquo;</a></li>

                                <li><a href="<c:url value="/Servlet_PageService?Dao=whitewall&Page=${totalPage}"/>">尾页</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../footer.jsp"></jsp:include>
</body>
<script  src="/extend/clock/js/index.js"></script>
<script src="/extend/clock/js/prefixfree.min.js"></script>
<style>
    .thumbnail{border-radius: 20px;}
    a{color: #dc19d5;}
    .pagination{
        margin-left: 24%;
    }
</style>
<script>
    // function sendToDetial(d1,d2,d3) {
    //     alert("SS");
    //     var textArea = d1;
    //     var imgurl = d2;
    //     var id  = d3;
    //     alert(textArea);
    //     $.ajax({
    //         url:"/Servlet_White_detail",
    //         type:"POST",
    //         data: {type:"detail",textArea:textArea,imgurl:imgurl,id:id},
    //         dataType:"json",
    //         success:function (data) {
    //
    //         },
    //         error:function (data) {
    //             alert("系统错误");
    //             window.location.reload();
    //         }
    //     })
    //
    // }
</script>
</html>
