<%@ page import="entity.mysql" %>
<%@ page import="entity.User" %>
<%@ page import="DaoImp.UserDaoImp" %><%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 9/17/2018
  Time: 6:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>regerinfo</title>
    <%@include file="/HeadTag.jsp"%>
    <%--<link href="/css/bootstrap.min.css" type="text/css" rel="stylesheet">--%>
    <%--<link href="/css/HeaderNav.css" type="text/css" rel="stylesheet">--%>

</head>
<body>
<div>
    <%
        request.setCharacterEncoding("UTF-8");
        Object userName = session.getAttribute("username");
        Object userPwd = session.getAttribute("password");
        Object userNick = session.getAttribute("usernick");
        User newUser=null;
        try {
            if(userName.equals(null) || userPwd.equals(null))
            {
                newUser = new User(0,"null","null","null","null");
            }
            else if( !userName.equals(null) && !userPwd.equals(null))
            {
                newUser = new UserDaoImp().findUserByNamePwd(userName.toString(),userPwd.toString());

            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{

        }

    %>
</div>
<div class="container">
    <jsp:include page="/HeaderNav.jsp"></jsp:include>
    <div class="col-md-12">
        <div class="my_table">
            <table class="table_p" width="80%" border="0" align="center">
                <tr >
                    <th width="50%" colspan="3" bgcolor="#A7C942">
                        Your message is as follows
                    </th>
                </tr>
                <tr bgcolor="white">
                    <td>
                        name
                    </td>
                    <td>
                        <%=newUser.getName()%>
                    </td>
                    <td>
                        <span><a href="./UpdateInfo.jsp" >修改</a> </span>
                    </td>
                </tr>
                <tr bgcolor="#EAF2D3">
                    <td>
                        nick
                    </td>
                    <td>
                        <%=newUser.getNick()%>
                    </td>
                    <td>
                        <span><a href="./UpdateInfo.jsp" >修改</a> </span>
                    </td>
                </tr>
                <tr bgcolor="white">
                    <td>
                        pwd
                    </td>
                    <td>
                        <%=newUser.getPwd()%>
                    </td>
                    <td>
                        <span><a href="./UpdateInfo.jsp" >修改</a> </span>
                    </td>
                </tr>
                <tr bgcolor="#EAF2D3">
                    <td>
                        permission
                    </td>
                    <td>
                        <%=newUser.getPermission()%>
                    </td>
                    <td>
                        <span><a href="./UpdateInfo.jsp" >修改</a> </span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
<style>
    .table_p{
        background-color:rgba(235,235,235,0.5);
        margin-top: 50px;
    }
    .my_table a
    {
        color: black;
        font-size: 25px;
        font-family:宋体;
        display: block;
        text-align: left;
        padding-left: 140px;
    }
    .table_p th,td{
        text-align: center;
        border: 1px solid black;
        height: 50px;
        vertical-align: middle;
        font-size: 30px;
        font-family: 宋体;

    }
</style>
</html>
