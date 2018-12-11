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
    <jsp:include page="../HeaderNav.jsp"></jsp:include>
    <div>
        <table border="0">
            <tr>
                <td>
                    your info is :
                </td>
            </tr>
            <tr>
                <td>
                    name: <%=newUser.getName()%>
                </td>
            </tr>
            <tr>
                <td>
                    nick: <%=newUser.getNick()%>
                </td>
            </tr>
            <tr>
                <td>
                    pwd : <%=newUser.getPwd()%>
                </td>
            </tr>
            <tr>
                <td>
                    permission:<%=newUser.getPermission()%>
                </td>
            </tr>
        </table>
        <span><a href="./UpdateInfo.jsp">修改</a> </span>

    </div>

</body>

</html>
