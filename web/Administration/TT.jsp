<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 11/7/2018
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- DW6 -->
<head>
    <!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>Untitled Document</title>
    <link rel="stylesheet" href="./css/emx_nav_right.css" type="text/css" />
    <script type="text/javascript">
        <!--
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
            if ((event.clientY <48)||(event.clientY > 107)){
                for (var i=1; i<= numofitems; i++){
                    var shutdiv =eval('menuitem'+i+'.thediv');
                    shutdiv.style.visibility='hidden';
                }
            }
        }
        // -->
    </script>
</head>
<body onmousemove="closesubnav(event);">
<table width="100%" border="0" cellspacing="0" cellpadding="4" bgcolor="#CCCCCC">
    <tr>
        <td>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed

            diam nonumy eirmod tempor invidunt ut labore et dolore magna

            aliquyam erat, sed diam voluptua. At vero eos et accusam et

            justo duo dolores et ea rebum. Stet clita kasd gubergren, no

            sea takimata sanctus est Lorem ipsum dolor sit amet.</td>
    </tr>
</table>
<table border=0 cellspacing=0 cellpadding=0>
    <tr>
        <td width=20>&nbsp;</td>
        <td width="100" align="center" bgcolor="#999999">Lorem</td>
        <td width="20">&nbsp;</td>
        <td align="center" width="100"><a href="#">Ipsum</a></td>
        <td width="20">&nbsp;</td>
        <td align="center" width="100"><a href="#">Dolar</a></td>
        <td width="20">&nbsp;</td>
        <td align="center" width="100"><a href="#">Amit</a></td>
        <td width="20">&nbsp;</td>
    </tr>
    <tr>
        <td height="1" colspan="10" bgcolor="#CCCCCC"><table height="1" width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td></td>
            </tr>
        </table></td>
    </tr>
</table>

<div class="skipLinks">skip to:
    <a href="#content">page content</a>
    <a href="#pageNav">links on this page</a>
    <a href="#globalNav">site navigation</a>
    <a href="#siteInfo">footer (site information)</a>
</div>
<div id="masthead">
    <%--<h1 id="siteName">Site Name</h1>--%>
    <%--<div id="utility"> <a href="#">Utility Link</a> | <a href="#">Utility Link</a> | <a href="#">Utility Link</a> </div>--%>
    <div id="globalNav">
        <img alt="" src="gblnav_left.gif" height="32" width="4" id="gnl" />
        <img alt="" src="glbnav_right.gif" height="32" width="4" id="gnr" />
        <div id="globalLink">
            <a href="#" id="gl1" class="glink" onmouseover="ehandler(event,menuitem1);">global link</a>
            <a href="#" id="gl2" class="glink" onmouseover="ehandler(event,menuitem2);">global link</a>
            <a href="#" id="gl3" class="glink" onmouseover="ehandler(event,menuitem3);">global link</a>
            <a href="#" id="gl4" class="glink" onmouseover="ehandler(event,menuitem4);">global link</a>
            <a href="#" id="gl5" class="glink" onmouseover="ehandler(event,menuitem5);">global link</a>
            <a href="#" id="gl6" class="glink" onmouseover="ehandler(event,menuitem6);">global link</a>
            <a href="#" id="gl7" class="glink" onmouseover="ehandler(event,menuitem7);">global link</a>
        </div>
        <!--end globalLinks-->
        <%--<form id="search" action="">--%>
            <%--<input name="searchFor" type="text" size="10" />--%>
            <%--<a href="">search</a>--%>
        <%--</form>--%>
    </div>
    <!-- end globalNav -->
    <div id="subglobal1" class="subglobalNav"> | <a href="#">subglobal1 link</a> | <a href="#">subglobal1 link</a> | <a href="#">subglobal1 link</a> | <a href="#">subglobal1 link</a> | <a href="#">subglobal1 link</a> </div>
    <div id="subglobal2" class="subglobalNav"> <a href="#">subglobal2 link</a> | <a href="#">subglobal2 link</a> | <a href="#">subglobal2 link</a> | <a href="#">subglobal2 link</a> | <a href="#">subglobal2 link</a> | <a href="#">subglobal2 link</a> | <a href="#">subglobal2 link</a> </div>
    <div id="subglobal3" class="subglobalNav"> <a href="#">subglobal3 link</a> | <a href="#">subglobal3 link</a> | <a href="#">subglobal3 link</a> | <a href="#">subglobal3 link</a> | <a href="#">subglobal3 link</a> | <a href="#">subglobal3 link</a> | <a href="#">subglobal3 link</a> </div>
    <div id="subglobal4" class="subglobalNav"> <a href="#">subglobal4 link</a> | <a href="#">subglobal4 link</a> | <a href="#">subglobal4 link</a> | <a href="#">subglobal4 link</a> | <a href="#">subglobal4 link</a> | <a href="#">subglobal4 link</a> | <a href="#">subglobal4 link</a> </div>
    <div id="subglobal5" class="subglobalNav"> <a href="#">subglobal5 link</a> | <a href="#">subglobal5 link</a> | <a href="#">subglobal5 link</a> | <a href="#">subglobal5 link</a> | <a href="#">subglobal5 link</a> | <a href="#">subglobal5 link</a> | <a href="#">subglobal5 link</a> </div>
    <div id="subglobal6" class="subglobalNav"> <a href="#">subglobal6 link</a> | <a href="#">subglobal6 link</a> | <a href="#">subglobal6 link</a> | <a href="#">subglobal6 link</a> | <a href="#">subglobal6 link</a> | <a href="#">subglobal6 link</a> | <a href="#">subglobal6 link</a> </div>
    <div id="subglobal7" class="subglobalNav"> <a href="#">subglobal7 link</a> | <a href="#">subglobal7 link</a> | <a href="#">subglobal7 link</a> | <a href="#">subglobal7 link</a> | <a href="#">subglobal7 link</a> | <a href="#">subglobal7 link</a> | <a href="#">subglobal7 link</a> </div>
    <div id="subglobal8" class="subglobalNav"> <a href="#">subglobal8 link</a> | <a href="#">subglobal8 link</a> | <a href="#">subglobal8 link</a> | <a href="#">subglobal8 link</a> | <a href="#">subglobal8 link</a> | <a href="#">subglobal8 link</a> | <a href="#">subglobal8 link</a> </div>
</div>
<!-- end masthead -->
<%--<div id="pagecell1">--%>
    <%--<!--pagecell1-->--%>
    <%--<img alt="" src="tl_curve_white.gif" height="6" width="6" id="tl" /> <img alt="" src="tr_curve_white.gif" height="6" width="6" id="tr" />--%>
    <%--<div id="breadCrumb"> <a href="#">Breadcrumb</a> / <a href="#">Breadcrumb</a> / <a href="#">Breadcrumb</a> / </div>--%>
    <%--<div id="pageName">--%>
        <%--<h2>Page Name</h2>--%>
        <%--<img alt="small logo" src="" height="59" width="66"/> </div>--%>
    <%--<div id="pageNav">--%>
        <%--<div id="sectionLinks"> <a href="#">Section Link</a> <a href="#">Section Link</a> <a href="#">Section Link</a> <a href="#">Section Link</a> <a href="#">Section Link</a> <a href="#">Section Link</a> </div>--%>
        <%--<div class="relatedLinks">--%>
            <%--<h3>Related Link Category</h3>--%>
            <%--<a href="#">Related Link</a> <a href="#">Related Link</a> <a href="#">Related Link</a> <a href="#">Related Link</a> <a href="#">Related Link</a> <a href="#">Related Link</a> </div>--%>
        <%--<div class="relatedLinks">--%>
            <%--<h3>Related Link Category</h3>--%>
            <%--<a href="#">Related Link</a> <a href="#">Related Link</a> <a href="#">Related Link</a> <a href="#">Related Link</a> <a href="#">Related Link</a> <a href="#">Related Link</a> </div>--%>
        <%--<div id="advert"> <img src="" alt="" width="107" height="66" /> Advertisement copy goes here. Advertisement copy goes here. </div>--%>
    <%--</div>--%>
    <%--<div id="content">--%>
        <%--<div class="feature"> <img src="" alt="" width="280" height="200" />--%>
            <%--<h3>Feature Title</h3>--%>
            <%--<p> Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec molestie. Sed aliquam sem ut arcu. Phasellus sollicitudin. Vestibulum condimentum facilisis nulla. In hac habitasse platea dictumst. Nulla nonummy. Cras quis libero. Cras venenatis. Aliquam posuere lobortis pede. Nullam fringilla urna id leo. Praesent aliquet pretium erat. Praesent non odio. Pellentesque a magna a mauris vulputate lacinia. Aenean viverra. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Aliquam lacus. Mauris magna eros, semper a, tempor et, rutrum et, tortor. </p>--%>
        <%--</div>--%>
        <%--<div class="story">--%>
            <%--<h3>Story Title</h3>--%>
            <%--<p> Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec molestie. Sed aliquam sem ut arcu. Phasellus sollicitudin. Vestibulum condimentum facilisis nulla. In hac habitasse platea dictumst. Nulla nonummy. Cras quis libero. Cras venenatis. Aliquam posuere lobortis pede. Nullam fringilla urna id leo. Praesent aliquet pretium erat. Praesent non odio. Pellentesque a magna a mauris vulputate lacinia. Aenean viverra. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Aliquam lacus. Mauris magna eros, semper a, tempor et, rutrum et, tortor. </p>--%>
            <%--<p> Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec molestie. Sed aliquam sem ut arcu. Phasellus sollicitudin. Vestibulum condimentum facilisis nulla. In hac habitasse platea dictumst. Nulla nonummy. Cras quis libero. Cras venenatis. Aliquam posuere lobortis pede. Nullam fringilla urna id leo. Praesent aliquet pretium erat. Praesent non odio. Pellentesque a magna a mauris vulputate lacinia. Aenean viverra. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Aliquam lacus. Mauris magna eros, semper a, tempor et, rutrum et, tortor. </p>--%>
        <%--</div>--%>
        <%--<div class="story">--%>
            <%--<table width="100%" cellpadding="0" cellspacing="0" summary="">--%>
                <%--<tr valign="top">--%>
                    <%--<td class="storyLeft">--%>
                        <%--<p> <a href="#" class="capsule">Capsule Story</a> Cras enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut eu augue. Integer risus wisi, semper eu, congue quis, lobortis ut, massa. Vestibulum auctor vestibulum lectus. Vivamus neque. Cras lobortis. Aenean ut turpis eu libero volutpat euismod. <a href="#">Donec</a> eget lectus vitae ligula ornare tempor. Vivamus scelerisque lorem a elit. Sed id mauris. </p>          </td>--%>
                    <%--<td>--%>
                        <%--<p> <a href="#" class="capsule">Capsule Story</a> Cras enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut eu augue. Integer risus wisi, semper eu, congue quis, lobortis ut, massa. Vestibulum auctor vestibulum lectus. Vivamus neque. Cras lobortis. Aenean ut turpis eu libero volutpat euismod. <a href="#">Donec</a> eget lectus vitae ligula ornare tempor. Vivamus scelerisque lorem a elit. Sed id mauris. </p>          </td>--%>
                <%--</tr>--%>
                <%--<tr valign="top">--%>
                    <%--<td class="storyLeft">--%>
                        <%--<p> <a href="#" class="capsule">Capsule Story</a> Cras enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut eu augue. Integer risus wisi, semper eu, congue quis, lobortis ut, massa. Vestibulum auctor vestibulum lectus. Vivamus neque. Cras lobortis. Aenean ut turpis eu libero volutpat euismod. <a href="#">Donec</a> eget lectus vitae ligula ornare tempor. Vivamus scelerisque lorem a elit. Sed id mauris. </p>          </td>--%>
                    <%--<td>--%>
                        <%--<p> <a href="#" class="capsule">Capsule Story</a> Cras enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut eu augue. Integer risus wisi, semper eu, congue quis, lobortis ut, massa. Vestibulum auctor vestibulum lectus. Vivamus neque. Cras lobortis. Aenean ut turpis eu libero volutpat euismod. <a href="#">Donec</a> eget lectus vitae ligula ornare tempor. Vivamus scelerisque lorem a elit. Sed id mauris. </p>          </td>--%>
                <%--</tr>--%>
                <%--<tr valign="top">--%>
                    <%--<td class="storyLeft">--%>
                        <%--<p> <a href="#" class="capsule">Capsule Story</a> Cras enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut eu augue. Integer risus wisi, semper eu, congue quis, lobortis ut, massa. Vestibulum auctor vestibulum lectus. Vivamus neque. Cras lobortis. Aenean ut turpis eu libero volutpat euismod. <a href="#">Donec</a> eget lectus vitae ligula ornare tempor. Vivamus scelerisque lorem a elit. Sed id mauris. </p>          </td>--%>
                    <%--<td>--%>
                        <%--<p> <a href="#" class="capsule">Capsule Story</a> Cras enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut eu augue. Integer risus wisi, semper eu, congue quis, lobortis ut, massa. Vestibulum auctor vestibulum lectus. Vivamus neque. Cras lobortis. Aenean ut turpis eu libero volutpat euismod. <a href="#">Donec</a> eget lectus vitae ligula ornare tempor. Vivamus scelerisque lorem a elit. Sed id mauris. </p>          </td>--%>
                <%--</tr>--%>
            <%--</table>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<!--end content -->--%>
    <%--<div id="siteInfo"> <img src="" width="44" height="22" /><a href="#">About Us</a> | <a href="#">Site Map</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003 Company Name </div>--%>
<%--</div>--%>
<!--end pagecell1-->
<br/>
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
