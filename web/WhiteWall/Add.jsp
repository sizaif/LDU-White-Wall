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
    <%@include file="/HeadTag.jsp"%>
    <script src="/js/jquery-3.3.1.min.js"></script>
</head>
<body>

        <div class="container">
            <jsp:include page="../HeaderNav.jsp"></jsp:include>
            <div class="row clearfix">
                <%--菜单栏--%>
                <div class="col-md-2 column">
                    <jsp:include page="../MenuList.jsp"></jsp:include>
                </div>
                <div class="col-md-10 column">
                    <div>
                    <form  role="form1" name="form1" enctype="multipart/form-data" ="">
                        <div class="form-group">
                            <textarea type="text" name="contant" id="contant" placeholder="请输入您的表白吧!" style=""class="form-control"></textarea>
                        </div>

                        <div class="form-group">
                            <label for="photofile">图片</label>
                            <input type="file" class="btn btn-default" name="photofile" id="photofile" >
                        </div>
                        <span><button type="reset" class="btn btn-default" name="reset">重置</button></span>
                        <span><input type="button" class="btn btn-default" name="submit" value="发布" onclick="javascript:submit()"></span>
                    </form>
                    </div>
                </div>
                <div id="result"></div>
            </div>
        </div>
</body>
<script>
    function submit() {
        var fileimg = document.getElementById("photofile").value;
        var textArea = document.getElementById("contant").value;
        alert(fileimg);

        if( fileimg == null || fileimg =="") {
            return false;
        }
        if(!/\.(?:png|jpg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(fileimg))
        {
            alert("类型必须是图片(.png|jpg|bmp|gif|PNG|JPG|BMP|GIF)");
            return false;
        }
        var data = new FormData();

        //添加标头
        data.append('type',"insert");
        //添加表白内容
        data.append('textWhile',textArea);
        //添加图片
        data.append('fileimg', $('#photofile')[0].files[0]); //文件对象
        $.ajax({
            type:"POST",
            url : "/Servlet_White",
            data: data,
            dataType:"json",
            cache: false,
            processData: false,// 告诉jQuery不要去处理发送的数据
            contentType: false,   // 告诉jQuery不要去设置Content-Type请求头
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
<style>
    .btn{border-radius: 25px;}
</style>
</html>
