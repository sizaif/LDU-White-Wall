<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 12/27/2018
  Time: 9:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>后台表单</title>
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
                    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">表格</strong> / <small>Table</small></div>

                </div>
                <hr>
                <div class="am-g">
                    <div class="am-u-sm-12 am-u-md-6">
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增</button>
                                <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
                                <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 审核</button>
                                <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
                            </div>
                        </div>
                    </div>
                    <div class="am-u-sm-12 am-u-md-3">
                        <div class="am-form-group">
                            <zselect onchange="sel()" id="DaoChose" data-am-selected="{btnSize: 'sm'}">
                                 <option value="ALL">所有类别</option>
                                <option value="user">用户</option>
                                <option value="whitewall">表白内容</option>
                                <option value="anecodte">趣闻轶事论坛</option>
                            </zselect>
                        </div>
                    </div>
                    <div class="am-u-sm-12 am-u-md-3">
                        <div class="am-input-group am-input-group-sm">
                            <input type="text" id="DaoMark" value="${Mark}" hidden>
                            <input type="text" class="am-form-field" id="search">
                            <span class="am-input-group-btn">
                                <button onclick="Search()" class="am-btn am-btn-default" type="button">搜索</button>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="am-g">
                    <div class="am-u-sm-12">
                        <form class="am-form">
                            <table class="am-table am-table-striped am-table-hover table-main">
                                <thead>
                                <tr>
                                    <th class="table-check">
                                        <input type="checkbox" />
                                    </th>
                                    <c:if test="${Mark=='ALL'}">
                                        <th class="table-id">ID</th>
                                        <th class="table-title">名称</th>
                                        <th class="table-bordered">其他1</th>
                                        <th class="table-bordered">其他2</th>
                                        <th class="table-bordered">其他3</th>
                                        <th class="table-bordered">其他4</th>
                                        <th class="table-bordered">其他5</th>
                                        <th class="table-bordered">其他6</th>
                                        <th class="table-set">操作</th>
                                    </c:if>
                                    <c:if test="${Mark=='user'}">
                                        <th class="table-id">ID</th>
                                        <th class="table-author">用户名</th>
                                        <th class="table-author">密码</th>
                                        <th class="table-title">昵称</th>
                                        <th class="table-type">权限</th>
                                        <th class="table-set">操作</th>
                                    </c:if>
                                    <c:if test="${Mark=='anecdote'}">
                                        <th class="table-id">ID</th>
                                        <th class="table-title">标题</th>
                                        <th class="table-author am-hide-sm-only">作者</th>
                                        <th class="table-type">类别</th>
                                        <th class="table-date am-hide-sm-only">修改日期</th>
                                        <th class="table-title">点赞数</th>
                                        <th class="table-title">访问量</th>
                                        <th class="table-title">回复数</th>
                                        <th class="table-set">操作</th>
                                    </c:if>
                                    <c:if test="${Mark=='whitewall'}">
                                        <th class="table-id">ID</th>
                                        <th class="table-">图片地址</th>
                                        <th class="table-set">操作</th>
                                    </c:if>
                                </tr>
                                </thead>
                                <tbody>
                               
                                <c:if test="${Mark=='ALL'}">
                                    <c:forEach var="allMap" varStatus="j" items="${ALLlist}">
                                    <tr>
                                        <td><input type="checkbox" /></td>
                                        <td> ${allMap.id}</td>
                                        <td> ${allMap.name}</td>
                                        <td> ${allMap.other1}</td>
                                        <td> ${allMap.other2}</td>
                                        <td> ${allMap.other3}</td>
                                        <td> ${allMap.other4}</td>
                                        <td> ${allMap.other5}</td>
                                        <td> ${allMap.other6}</td>
                                        <td>
                                            <div class="am-btn-toolbar">
                                                <div class="am-btn-group am-btn-group-xs">
                                                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="change('${allMap.id}')"><span class="am-icon-pencil-square-o"></span> 编辑</button>
                                                    <button class="am-btn am-btn-default am-btn-xs am-hide-sm-only" ><span class="am-icon-copy"></span> 复制</button>
                                                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick=" delete('${allMap.id}')"><span class="am-icon-trash-o"></span> 删除</button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${Mark=='user'}">
                                    <c:forEach var="User" varStatus="j" items="${userPageList}">
                                        <tr>
                                            <td><input type="checkbox" /></td>
                                            <td> ${User.id}</td>
                                            <td> ${User.name}</td>
                                            <td> ${User.pwd}</td>
                                            <td> ${User.nick}</td>
                                            <td>${User.permission}</td>
                                            <td>
                                                <div class="am-btn-toolbar">
                                                    <div class="am-btn-group am-btn-group-xs">
                                                        <a class="am-btn am-btn-default am-btn-xs am-text-secondary" href="/Admin/Admin-UpdateInfo.jsp?Dao=user&Id=${User.id}"><span class="am-icon-pencil-square-o"></span> 编辑</a>
                                                        <button class="am-btn am-btn-default am-btn-xs am-hide-sm-only" ><span class="am-icon-copy"></span> 复制</button>
                                                        <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick=" Delete('${User.id}','user')"><span class="am-icon-trash-o"></span> 删除</button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${Mark=='anecdote'}">
                                    <c:forEach var="Anecdote" varStatus="j" items="${AnecdotePageList}">
                                        <tr>
                                            <td><input type="checkbox" /></td>
                                            <th>${Anecdote.id}</th>
                                            <th>${Anecdote.title}</th>
                                            <th>${Anecdote.author}</th>
                                            <th>${Anecdote.sort}</th>
                                            <th>${Anecdote.time}</th>
                                            <th>${Anecdote.star}</th>
                                            <th>${Anecdote.visit}</th>
                                            <th>${Anecdote.comment}</th>
                                            <td>
                                                <div class="am-btn-toolbar">
                                                    <div class="am-btn-group am-btn-group-xs">
                                                        <button class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="change('${Anecdote.id}','anecdote')"><span class="am-icon-pencil-square-o"></span> 编辑</button>
                                                        <button class="am-btn am-btn-default am-btn-xs am-hide-sm-only" ><span class="am-icon-copy"></span> 复制</button>
                                                        <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick=" delete('${Anecdote.id}','anecdote')"><span class="am-icon-trash-o"></span> 删除</button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${Mark=='whitewall'}">
                                    <c:forEach var="whiteWall" varStatus="j" items="${whitewall_PageList}">
                                        <tr>
                                            <td><input type="checkbox" /></td>
                                            <th>${whiteWall.id}</th>
                                            <th>${whiteWall.imageurl}</th>
                                            <td>
                                                <div class="am-btn-toolbar">
                                                    <div class="am-btn-group am-btn-group-xs">
                                                        <button class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="change('${whiteWall.id}')"><span class="am-icon-pencil-square-o"></span> 编辑</button>
                                                        <button class="am-btn am-btn-default am-btn-xs am-hide-sm-only" ><span class="am-icon-copy"></span> 复制</button>
                                                        <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick=" Delete('${whiteWall.id}','whitewall')"><span class="am-icon-trash-o"></span> 删除</button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>

                                </tbody>
                            </table>
                            <div class="am-cf">
                                共 ${totalCount} 条记录
                                <div class="am-fr">
                                    <ul class="pagination">
                                        <li ><a href="<c:url value="/ServletAdminTableService?Page=1&Dao=${Mark}"/>">首页</a></li>
                                        <li class="am-disabled">
                                            <a href="<c:url value="/ServletAdminTableService?Dao=${Mark}&Page=${page-1>1?page-1:1}"/>" >&laquo;</a>
                                        </li>
                                        <c:forEach begin="1" end="${totalPage}" varStatus="loop">
                                            <c:set var="active" value="${loop.index==page? 'active':''}"/>
                                            <li><a  href="<c:url value="/ServletAdminTableService?Dao=${Mark}&Page=${loop.index}"/>">${loop.index}</a></li>
                                        </c:forEach>
                                        <li class="am-active">
                                            <a href="<c:url value="/ServletAdminTableService?Dao=${Mark}&Page=${page+1 <totalPage ? page+1 : totalPage}"/> " >&raquo;</a>
                                        </li>
                                        <li  class="am-disabled"><a href="<c:url value="/ServletAdminTableService?Dao=${Mark}&Page=${totalPage}"/>">尾页</a></li>
                                    </ul>
                                </div>
                            </div>
                            <hr />
                            <p>注：.....</p>
                        </form>
                    </div>

                </div>
            </div>

            <footer class="admin-content-footer">
                <hr>
                <p class="am-padding-left">© 2018 SIZ.</p>
            </footer>


        </div>
    <!-- content end -->
    </div>
</body>

<script type="text/javascript">
    
    function Search() {
        var Mark = $("input[id=DaoMark]") .val();
        var SearchCont = $("input[id=search]").val();
        $.ajax({
            url:"/ServletAdminTableService2",
            type:"POST",
            data:{Dao:Mark,SearchCont:SearchCont,Page:1,type:"search"},
            dataType:"json",
            success: function (data) {
                console.log(data);
                window.location.href=data.forward;
                // window.location.reload();
            },
            error:function (data) {
                alert("发布失败");
                console.log(data);
            }
        })
    }
    function sel() {

        var dao = $("#DaoChose option:selected").val();
        var page =1;
        {
            $.ajax({
                url:"/ServletAdminTableService2",
                type:"POST",
                data:{Page:page,Dao:dao},
                dataType:"json",
                success: function (data) {
                    console.log(data);
                    window.location.href=data.forward;
                    // window.location.reload();
                },
                error:function (data) {
                    alert("发布失败");
                    console.log(data);
                }
            })
        }
    }
    function editinfo() {
        
    }
    function Delete(data,dao) {
        var Dao = dao;
        var Id = data;
        
        $.ajax({
            url:"/Servlet_Admin",
            type:"POST",
            data:{type:"delete",Id:Id,Dao:dao},
            dataType:"json",
            success: function (data) {
                console.log(data);
                window.location.href=data.forward;
                // window.location.reload();
            },
            error:function (data) {
                alert("发布失败");
                console.log(data);
            }
        })
    }

</script>
</html>
