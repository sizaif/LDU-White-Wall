<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 10/9/2018
  Time: 4:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>addnews</title>
    <link rel="stylesheet" href="../css/Css_of_Input.css" type="text/css" charset="utf-8">
    <script>
        function CheckTextInfo() {
            var s1 = document.getElementById(ntitle).value;
            var s2 = document.getElementById(theme).value;
            var s3 = document.getElementById(nnews).value;
            if( s1==null || s2 == null || s3 == null)
                return false;
            return true;
        }
    </script>
</head>
<body>

    <div class="fxkc" id="fxkc" style="width: 674px;">
        <form name="addnews" method="post" action="news_add_back.jsp" onsubmit=" CheckTextInfo()">
            <table border="0">
                <tr>
                    <td>新闻题目</td>
                    <td><input type="text" name="ntitle" id="ntitle" value=""></td>
                </tr>
                <tr>
                    <td>新闻主题</td>
                    <td><input type="text" name="ntheme" id="theme" value=""></td>
                </tr>
                <tr>
                    <td>新闻内容</td>
                    <td><textarea type="text" name="nnews" id="nnews" value="" style="width: 400px; height: 300px"></textarea></td>
                </tr>
                <tr>
                    <td>
                        <button type="submit" name="submit" >提交</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
