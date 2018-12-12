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
    <script src="/js/jquery-3.3.1.min.js"></script>
</head>
<body>
        <div>
            <div>
                <form name="form" enctype="multipart/form-data">
                    <ul>
                        <li>
                            <td><textarea type="text" name="contant" id="contant" placeholder="请输入您的表白吧!" style=""></textarea></td>
                        </li>
                        <li>
                            <span><button type="reset" class="" name="reset">重置</button></span>
                        </li>
                    </ul>
                </form>
                <span><input type="button" class=""name="submit" value="发布" onclick="javascript:submit()"></span>
            </div>
        </div>
</body>
<script>
    function submit() {
        var textArea = document.getElementById("contant").value;
        $.ajax({
            type:"POST",
            url : "/Servlet_White",
            data: {type:"insert",textWhile:textArea},
            dataType:"json",
            success: function (data) {
                alert("发布成功!");
                window.location.reload();
            },
            error:function (data) {
                alert("发布失败");
                window.location.reload();
            }
        })
    }
</script>
</html>
