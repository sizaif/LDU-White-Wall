<%@ page import="entity.mysql" %><%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 10/15/2018
  Time: 7:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update_themes2</title>

</head>
<body>

    <%
        /*
          *  实现功能:  修改
          *  页面逻辑:
          *     从themeList1.jsp传过来 tid 和 tname  , tname 显示在input 里
          *     from 表格 将 tid 和 新输入的 name  传到  themes_contro2.jsp  里 进行 update  更新
          *     并返回到 themeList1.jsp中显示
          *
         */
        request.setCharacterEncoding("UTF-8");
        String Tid = request.getParameter("tid");
        String Tname = request.getParameter("tname");
    %>
    <div>
        <form name="update" method="post" action="themes_contro2.jsp?tid=<%=Tid%>" >
            <table border="0">
                <tr>
                    <td>主题名称:</td>
                    <td><input type="text" name="themename" id ="themename"value=<%=Tname%>></td>
                </tr>
            </table>
            <table border="0">
                <tr>
                    <td>
                        <button type="submit" name="submit">修改</button>
                        <button type="reset" name="reset">重置</button>
                    </td>
                    <%--<% request.getRequestDispatcher("themes_contro2.jsp").forward(request,response);%>--%>
                    <%--javascrtpt:window.location.href='themes_contro2.jsp?tid=<%=Tid%>'--%>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
