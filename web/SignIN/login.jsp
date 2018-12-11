<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 9/17/2018
  Time: 6:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign in</title>
    <%--<link rel="stylesheet" href="css/Css_of_Input.css" type="text/css" charset="UTF-8">--%>
    <link rel="stylesheet" href="../css/logCsszhihu.css" type="text/css" charset="UTF-8">
</head>
<body>
    <div>
        <main role="main" class="App-main">
            <div class="SignFlowHomepage">
                <div class="SignFlowHomepage-content">
                    <div class="Card SignContainer-content">
                        <div class="SignFlowHeader" style="padding-bottom:5px">
                            <div class="SignFlowHeader-slogen"><h2 text-align="center">登陆界面</h2></div>
                            <div class="SignFlowHeader-slogen">通往新世界的大门</div>
                        </div>
                        <div class="SignContainer-inner">
                            <div class="Login-content">
                                <form  id="form" name="form"  class="SignFlow" method="post" action="/Servlet_Login"  >
                                    <div class="SignFlow-account">
                                        <div class="SignFlow-supportedCountriesSelectContainer"></div>
                                        <div class="SignFlowInput SignFlow-accountInputContainer">
                                            <div class="SignFlow-accountInput Input-wrapper">
                                                <input class="Input" type="text" name="username" id="username" placeholder="用户名"value="">
                                            </div>
                                            <div class="SignFlowInput-errorMask SignFlowInput-errorMask--hidden"></div>
                                        </div>
                                    </div>
                                    <div class="SignFlow-password">
                                        <div class="SignFlowInput">
                                            <div class="SignFlow-passwordInput Input-wrapper">
                                                <input class="Input" type="password" name="password" id="password" value="">
                                            </div>
                                            <div class="SignFlowInput-errorMask SignFlowInput-errorMask--hidden"></div>
                                        </div>
                                        <button tabindex="-1" type="button" class="Button SignFlow-switchPassword Button--plain"></button>
                                    </div>
                                    <span><button type="submit" class="Button SignFlow-submitButton Button--primary Button--blue"  name="submit" >登陆</button></span>
                                </form>
                            </div>
                            <div class="SignContainer-switch">
                                无账号?
                                <span>
                                    <button type="button" onclick="javascrtpt:window.location.href='../SignUP/reger.jsp'" >注册一个</button>
                                </span>
                            </div>
                            <div class="SignFlowHomepage-qrImage SignFlowHomepage-qrImageHidden">
                                <div></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

</body>

</html>
