<%@ page import="entity.mysql" %><%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 9/17/2018
  Time: 5:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign up</title>
    <link rel="stylesheet" href="../css/Css_of_Input.css" type="text/css" CHARSET="UTF-8">
    <link rel="stylesheet" href="../css/regerCsszhihuishu.css" type="text/css" CHARSET="UTF-8">
    <script>
        function CheckUserInfo(){
            pwd1 = document.getElementById("pwd").value;
            pwd2 = document.getElementById("pwd2").value;
            Name = document.getElementById("name").value;
            if( Name == "" )
            {
                alert("用户名不能为空");
                return false;
            }
            if( pwd1 == "")
            {
                alert("密码不能为空");
                return false;
            }
            if( pwd1 == pwd2)
            {
                if( pwd1.length<8)
                {
                    alert("密码长度过短");
                    return false;
                }
                return true;
            }
            else {
                alert("两次输入的密码不一致.! 请重新输入 ");
                return false;
            }
            return false
        }
    </script>
</head>
<body>
    <div class="wall-warp">
        <div class="wall-main">
            <div class="switch-nav-wrap">
                <div class="registerNum-wrap new-switch-wall">注册账号</div>
            </div>
            <div class="switch-wrap-signup">
                <form name="form" method="post" action="regerinfo.jsp" onsubmit="return CheckUserInfo()">
                    <input id="j-token" type="hidden" name="csrf" value="1fa95d33-d57f-46d3-a9dc-534a21b1d1b9">
                    <ul class="wall-form-ipt-list">
                        <li>
                            <input type="text" class="Input" name="name" id="name" value="" placeholder="账号">
                        </li>
                        <li class="pw-code-item">
                            <input type="password" class="Input" name="pwd" id="pwd" placeholder="密码" value="">
                        </li>
                        <li>
                            <input type="password" class="Input" name="pwd2" id="pwd2" placeholder="重复密码"value="">
                        </li>
                        <li>
                            <input type="text" class="Input" name="age" placeholder="年龄" id="age">
                        </li>
                    </ul>
                    <span><button type="submit" class="wall-sub-btn wall-sub-btn-signup" name="submit">注册</button></span>
                    <span><button type="reset" class="wall-sub-btn wall-sub-btn-signup" name="reset">重置</button></span>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
