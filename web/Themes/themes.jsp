<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 10/22/2018
  Time: 4:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../login_check_control.jsp"%>
<html>
<head>
    <title>Themes</title>
    <script>
        function Checktheme() {
            if( document.themeadd.themename.value=="")
            {
                alert("添加内容不可为空");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

    <div>
         <a class="thems_add">
            添加主题
            <form name="themeadd" method="post" action="themes_control.jsp" onsubmit="return Checktheme()">
                <table border="0">
                    <tr>
                        <td>主题名称:</td>
                        <td><input type="text" name="themename" id ="themename"value=""></td>
                    </tr>
                </table>
                <table border="0">
                    <tr>
                        <td>
                            <button type="submit" name="submit">提交</button>
                            <button type="reset" name="reset">重置</button>
                        </td>
                    </tr>
                </table>
            </form>
        </a>
    </div>
</body>
</html>
