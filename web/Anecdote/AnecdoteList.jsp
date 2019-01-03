<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 12/25/2018
  Time: 8:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>趣闻轶事</title>
    <%--每隔10s刷新--%>
    <meta http-equiv="refresh" content="10">

    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/css/HeaderNav.css" rel="stylesheet" type="text/css">

</head>
<body>

    <%
        Object user_name = session.getAttribute("username");
        Object user_permission =  session.getAttribute("permission");
        if(user_name==null || user_permission==null)
        {
            response.sendRedirect("/SignIN/login.jsp");
        }
    %>
<div class="container">
    <div class="row clearfix">
        <jsp:include page="/HeaderNav.jsp"></jsp:include>
        <div class="wp">
            <div class="boardnav">
                <div class="wp cl ct2">
                    <div class="col-md-10">
                        <div class="ppr_maim">
                        <div class="threadlist_header">
                            <div class="ppr">
                                <table class="thread_types_table">
                                    <%--分类等--%>
                                    <tbody>
                                    <tr>
                                        <th>
                                            分类
                                        </th>
                                        <td>
                                            <span class="subforum_pipe">&nbsp;|</span>
                                            <a href="/Servlet_PageService?Dao=anecdote&Page=1" style="">全部</a>
                                            <c:forEach var="AnecdoteSort" items="${AnecdoteSortList}">
                                                <span class="subforum_pipe">&nbsp;|</span>
                                                <a href="/Servlet_PageService?Dao=anecdote&Page=1&Sort=${AnecdoteSort}" style="">${AnecdoteSort}</a>
                                            </c:forEach>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="threadlist t1">
                            <div class="threadlist_inner">
                                <div class="">
                                    <%--主要内容展示--%>
                                    <div>
                                        <div class="row">
                                            <div class="">
                                                <c:forEach var="Anecdote" varStatus="j" items="${AnecdotePageList}">
                                                    <table class="col-md-12" id="${Anecdote.id}">
                                                        <tr>
                                                            <th>
                                                                <div class="sub it">
                                                                    <a href="/Servlet_Anecdote_detail?id=${Anecdote.id}" style="margin-bottom: 5px; text-decoration: none; font-weight: bold;color: #EE5023;" onclick="atarget(this)" class="s xst">${Anecdote.title}</a>
                                                                    <img src="https://static.bbs.miui.com/static/image/miui/base/hot_3.gif" align="absmiddle" alt="heatlevel" >
                                                                    <c:if test="${Anecdote.star > 5}">
                                                                        <img src="https://static.bbs.miui.com/static/image/miui/base/agree.gif" align="absmiddle" alt="agree" >
                                                                    </c:if>

                                                                </div>
                                                                <div class="sub-infos">
                                                                    <a href="space-uid-8.html" c="1" mid="card_7571">${Anecdote.author}</a>
                                                                    <span class="pipe">|</span>
                                                                    浏览:
                                                                    <span class="">${Anecdote.visit}</span>
                                                                    <span class="pipe">|</span>
                                                                    分类:
                                                                    <span class="">${Anecdote.sort}</span>
                                                                    <span class="pipe">|</span>
                                                                    点赞数:
                                                                    <span class="">${Anecdote.star}</span>
                                                                    <span class="pipe">|</span>
                                                                    回复数:
                                                                    <span class="">${Anecdote.comment}</span>
                                                                    <span class="pipe">|</span>
                                                                    时间:
                                                                    <span class="">${Anecdote.time}</span>
                                                                </div>
                                                            </th>
                                                        </tr>
                                                    </table>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <div  >
                                        <%--分页--%>
                                        <nav>
                                            <ul class="pagination">
                                                <li><a href="<c:url value="/Servlet_PageService?Page=1&Dao=anecdote"/>">首页</a></li>

                                                <li><a href="<c:url value="/Servlet_PageService?Dao=anecdote&Page=${page-1>1?page-1:1}"/>" class="button button-raised button-caution">&laquo;</a></li>

                                                <c:forEach begin="1" end="${totalPage}" varStatus="loop">
                                                    <c:set var="active" value="${loop.index==page? 'active':''}"/>
                                                    <li><a class="button button-raised button-caution" href="<c:url value="/Servlet_PageService?Dao=anecdote&Page=${loop.index}"/>">${loop.index}</a></li>
                                                </c:forEach>

                                                <li><a href="<c:url value="/Servlet_PageService?Dao=anecdote&Page=${page+1 <totalPage ? page+1 : totalPage}"/> " class="button button-raised button-caution">&raquo;</a></li>

                                                <li><a href="<c:url value="/Servlet_PageService?Dao=anecdote&Page=${totalPage}"/>">尾页</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row clearfix">

                        </div>
                    </div>
                    </div>
                    <div class="col-md-2">
                        <div class="ppr_right">
                            <div class="big_post_btn">
                                <div class="col-md-12 column">
                                    <%--发布--%>
                                    <a href="/Anecdote/Add.jsp" style="font-size: 30px;color: white;text-decoration: none;font-family: 华文楷体;"></a>
                                </div>
                            </div>

                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
</body>
<style>
    .wp {
        margin: 0 auto;
        width: 960px;
    }
    #wp .wp {
        width: auto;
        clear: both;
    }
    .ct2 .ppr_main {
        float: left;
        width: 700px;
        margin-bottom: 1em;
    }
    .ct2 .ppr_left{
        float: right;
        width: 250px;
        overflow: hidden;
    }
    .ppr{
        background:#fafafa;margin: 15px 15px 0;border-radius:5px;border: 1px solid #f2f2f2;padding: 9px 9px 0;
    }
    .threadlist_header{
        border-radius: 5px 5px 0 0;
        border: 1px solid #e3e3e4;
        border-bottom-color: #fff;
        background: #fff
    }
    .threadlist_header .thread_types_table{
        margin: 4px 0 12px;
    }
    .threadlist{
        border-top: none;
        border-radius: 0 0 5px 5px;
        background: rgb(255, 255, 255);
        border-width: 1px;
        border-style: solid;
        border-color: rgb(227, 227, 228);
        border-image: initial;
        border-radius: 5px;
    }
    .t1 th{
        padding: 13px 30px;
        border-bottom: 1px dotted #CDCDCD;
        border-right: 1px solid #ffffff;
        border-left: 1px solid #ffffff;
        border-top: 1px solid #ffffff;
    }
    caption, th{
        text-align: left;
        font-weight: 400;
    }
    .setbox_c{
        padding: 8px 10px 10px;
        width: 227px;
    }
    .miui_bm{
        margin-bottom: 10px;
    }
    .b_mt{
        margin-top: 15px;
    }
    .big_post_btn a{
        display: inline-block;
        width: 120px;
        height: 30px;
        background: url(/images/anecdote/post_btn_big.png) -60px -8px;
    }
</style>
</html>
