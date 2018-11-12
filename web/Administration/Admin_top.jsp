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

    <link rel="stylesheet" href="./css/Admin_topcss.css" type="text/css" />
    <script type="text/javascript">

        var time = 3000;
        var numofitems = 7;

        //menu constructor
        function menu(allitems,thisitem,startstate){
            callname= "gl"+thisitem;
            divname="subglobal"+thisitem;
            this.numberofmenuitems = allitems;
            this.caller = document.getElementById(callname);
            this.thediv = document.getElementById(divname);
            this.thediv.style.visibility = startstate;
        }

        //menu methods
        function ehandler(event,theobj){
            for (var i=1; i<= theobj.numberofmenuitems; i++){
                var shutdiv =eval( "menuitem"+i+".thediv");
                shutdiv.style.visibility="hidden";
            }
            theobj.thediv.style.visibility="visible";
        }

        function closesubnav(event){
            if ( (event.clientY <48)||(event.clientY > 107) ){
                for (var i=1; i<= numofitems; i++){
                    var shutdiv =eval('menuitem'+i+'.thediv');
                    shutdiv.style.visibility='hidden';
                }
            }
        }
    </script>
</head>
<body>
    <div>
        <%-- 导航栏--%>
            <div id="masthead">
                <div id="globalNav">
                    <div id="globalLink">
                        <a href="#" id="gl1" class="glink" onmouseover="ehandler(event,menuitem1);">表白墙</a>
                        <a href="#" id="gl2" class="glink" onmouseover="ehandler(event,menuitem2);">趣闻轶事</a>
                        <a href="#" id="gl3" class="glink" onmouseover="ehandler(event,menuitem3);">寻人</a>
                        <a href="#" id="gl4" class="glink" onmouseover="ehandler(event,menuitem4);">留坑</a>
                        <a href="#" id="gl5" class="glink" onmouseover="ehandler(event,menuitem5);">留坑</a>
                        <a href="#" id="gl6" class="glink" onmouseover="ehandler(event,menuitem6);">留坑</a>
                        <a href="#" id="gl7" class="glink" onmouseover="ehandler(event,menuitem7);">关于我们</a>
                    </div>
                    <!--end globalLinks-->
                    <%--<form id="search" action="">--%>
                        <%--<input name="searchFor" type="text" size="10" />--%>
                        <%--<a href="">search</a>--%>
                    <%--</form>--%>
                </div>
                <!-- end globalNav -->
                <div id="subglobal1" class="subglobalNav">
                    <ul><li><a href="#">subglobal1 link</a></li><li><a href="#">subglobal1 link</a></li></ul>
                </div>
                <div id="subglobal2" class="subglobalNav"> <a href="#">subglobal2 link</a> | <a href="#">subglobal2 link</a>  </div>
                <div id="subglobal4" class="subglobalNav"> <a href="#">subglobal4 link</a> | <a href="#">subglobal4 link</a>  </div>
                <div id="subglobal5" class="subglobalNav"> <a href="#">subglobal5 link</a> | <a href="#">subglobal5 link</a>  </div>
                <div id="subglobal6" class="subglobalNav"> <a href="#">subglobal6 link</a> | <a href="#">subglobal6 link</a>  </div>
                <div id="subglobal3" class="subglobalNav"> <a href="#">subglobal3 link</a> | <a href="#">subglobal3 link</a>  </div>
                <div id="subglobal7" class="subglobalNav"> <a href="#">subglobal7 link</a> | <a href="#">subglobal7 link</a>  </div>
                <div id="subglobal8" class="subglobalNav"> <a href="#">subglobal8 link</a> | <a href="#">subglobal8 link</a>  </div>
            </div>
            <div class="right">
                <ul>
                    <li></li>
                    <li></li>
                    <li class="userLogin">
                        <div class="loginCenter">
                            <a href="#">账号信息</a>
                        </div>
                        <div class="usercontrol"></div>
                    </li>

                </ul>
                <%-- log/--%>

            </div>
    </div>
    <div>
        <%
            Object user_name = session.getAttribute("user_name");
            Object user_permission =  session.getAttribute("user_permission");
            out.print("<div>session : 信息 : "+user_name+"  SSSS  权限: "+user_permission+"  </div>");
            String name = user_name.toString();
        %>
        <h1 align="center">
            Weclome ! <%=name%>
        </h1>
    </div>
    <script type="text/javascript">
        <!--
        var menuitem1 = new menu(7,1,"hidden");
        var menuitem2 = new menu(7,2,"hidden");
        var menuitem3 = new menu(7,3,"hidden");
        var menuitem4 = new menu(7,4,"hidden");
        var menuitem5 = new menu(7,5,"hidden");
        var menuitem6 = new menu(7,6,"hidden");
        var menuitem7 = new menu(7,7,"hidden");
        // -->
    </script>
</body>
</html>
