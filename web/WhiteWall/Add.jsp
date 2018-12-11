<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 12/4/2018
  Time: 10:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
        <div>
            <div>
                <form name="form" >
                    <td><textarea type="text" name="contant" id="contant" placeholder="请输入您的表白吧!" style=""></textarea></td>
                </form>
                <span><input type="button" class=""name="submit" value="发布" onclick="javascript:submit()"></span>
                <span><button type="reset" class="" name="reset">重置</button></span>
            </div>
        </div>
</body>
<script>
    function submit() {
        $.ajax({
            type:"POST",
            url : "/Servlet_White",
            data: {type:"insert"},
            success: function () {
                alert("发布成功!");
                window.location.reload();
            },
            error:function () {
                alert("发布失败");
                window.location.reload();
            }

        })
    }
</script>
</html>
