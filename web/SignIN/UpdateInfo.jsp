<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 12/7/2018
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UpdateInfo</title>
</head>
<body>
    <form name="form" id="from"  enctype="multipart/form-data">
        <input id="j-token" type="hidden" name="csrf" value="1fa95d33-d57f-46d3-a9dc-534a21b1d1b9">
        <ul class="wall-form-ipt-list">
            <li>
                <input type="text" class="Input" name="name" id="name" value="" placeholder="账号">
            </li>
            <li>
                <input type="text" class="Input" name="nick" id="nick" value="" placeholder="昵称">
            </li>
            <li class="pw-code-item">
                <input type="password" class="Input" name="pwd" id="pwd" placeholder="密码" value="">
            </li>
            <li>
                <input type="password" class="Input" name="pwd2" id="pwd2" placeholder="重复密码"value="">
            </li>
            <%--<li>--%>
            <%--<input type="text" class="Input" name="age" placeholder="年龄" id="age">--%>
            <%--</li>--%>
        </ul>
    </form>
    <span><input type="button" value="提交" onclick="change()"></span>
</body>
<script src="/Jsp1.1/web/js/jquery-3.3.1.min.js"></script>
<script>
    function change() {
        pwd1 = document.getElementById("pwd").value ;
        pwd2 = document.getElementById("pwd2").value;
        Name = document.getElementById("name").value;
        Nick = document.getElementById("nick").value;
        var ok = true;
        if( Name == "" )
        {
            alert("用户名不能为空");
            ok = false;
        }
        if( pwd1 == "")
        {
            alert("密码不能为空");
            ok = false;
        }
        if( pwd1 == pwd2)
        {
            if( pwd1.length<8)
            {
                alert("密码长度过短");
                ok = false;
            }
        }
        else {
            alert("两次输入的密码不一致.! 请重新输入 ");
            ok = false;
        }
        if( ok == true)
        {
            $.ajax({
                type:"POST",
                url : "/Servlet_Users",
                data: {type:"change",username:Name,password: pwd1,usernick:Nick},
                dataType:"json",
                success: function (data) {
                    var urll = data["forward"];
                    alert("修改成功!");
                    window.location.href= urll;
                },
                error:function (data) {
                    var urll = data["forward"];
                    alert("修改失败!");
                    window.location.href= urll;
                }
            })
        }
        else
        {
            window.location.reload();
        }

    }
</script>
</html>
