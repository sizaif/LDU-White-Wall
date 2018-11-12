<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 10/22/2018
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--<link rel="stylesheet" href="../css/Admin_leftCSS.css" type="text/css" charset="UTF-8">--%>
</head>
<body>

    <div class="main-menu">
        <ul class="wp-menu">
            <li class="menu-item i1" onmouseover="display(this)" onmouseout="hide(this)">
                <a href="../Themes/themes.jsp" target="mainFrame" class="menu-link "> 添加主题</a>
                <ul class="sub-menu">
                    <li  class="sub-item i1-1 " ><a href="../Themes/themeList1.jsp" target="mainFrame" class="sub-link "> 显示所有主题</a></li>
                </ul>
            </li>
            <li class="menu-item i2" onmouseover="display(this)" onmouseout="hide(this)">
                <a href="../News/news_add.jsp" target="mainFrame" class="menu-link "> 添加新闻</a>
                <ul class="sub-menu">
                    <li class="sub-item i2-1 "><a href="../News/news_list.jsp" target="mainFrame" class="sub-link "> 显示所有新闻</a></li>
                </ul>
            </li>
        </ul>
    </div>
</body>
    <script src="../js/menu-display.js"></script>
</html>
