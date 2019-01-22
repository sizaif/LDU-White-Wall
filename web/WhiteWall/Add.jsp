<%@ page import="com.mysql.cj.util.StringUtils" %><%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 12/4/2018
  Time: 10:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加</title>
    <%@include file="/HeadTag.jsp"%>
    <%--<script src="/js/jquery-3.3.1.min.js"></script>--%>

</head>
<body>
        <%
            Object userID = session.getAttribute("userid");
            try {
                userID.toString();
            }catch(NullPointerException e){
                response.sendRedirect("/Home.jsp");
            }
        %>

        <div class="container">
            <jsp:include page="../HeaderNav.jsp"></jsp:include>
            <div class="row clearfix">
                <%--菜单栏--%>
                <div class="col-md-2 column">
                    <jsp:include page="../MenuList.jsp"></jsp:include>
                </div>
                <div class="col-md-10 column">

                    <div style="background: #ffffff;">
                        <textarea type="text" name="contant" id="contant" hidden></textarea>
                        <div id="editor" class="editorcss">
                        </div>
                    </div>
                    <div>
                    <form  role="form1" name="form1" enctype="multipart/form-data" >
                        <input type="text" id="userID" value="<%=userID%>" hidden>
                        <div class="form-group">
                            <label for="photofile">图片</label>
                            <div  width="10%" onclick="$('#photofile').click()">
                                <img width="20%" id="showphoto"  style="border-radius: 4%" src="/upload/addphoto.jpg" alt="">
                            </div>
                            <input  class="addphoto" type="file" name="photofile" id="photofile" onchange="uploadimg()" >
                        </div>
                    </form>
                        <span><button id="submitbtn" class="btn btn-default"  onclick="submit()">发布</button></span>
                    </div>
                </div>
                <div id="result"></div>
            </div>
        </div>
</body>
<script>

    function submit() {
        var textArea = editor.txt.html();
        var filepath = document.getElementById('showphoto').src;
        var userID = $('input[id=userID]').val();
        // alert(userID);
        var type ="insert";
        // alert(textArea);
        if(textArea=="<p><br></p>")
        {
            alert("内容不能为空哦!")
            return false;
        }
        $.ajax({
            type:"POST",
            url : "/Servlet_White",
            data: {type:type,textArea:textArea,filepath:filepath,userID:userID},
            dataType:"json",
            success: function (data) {
                console.log(data);
                if(data["success"]=="success"){
                    alert("发布成功!");
                    window.location.href=data.forward;
                }else {
                    alert("发布失败!");
                    window.location.href=data.forward;
                }

            },
            error:function (data) {
                alert("发布失败");
                window.location.reload();
            }
        })
    }
    function uploadimg() {
        var fileimg = document.getElementById("photofile").value;
        var data = new FormData();

        if( fileimg == null || fileimg =="") {
            return false;
        }
        if(!/\.(?:png|jpg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(fileimg))
        {
            alert("类型必须是图片(.png|jpg|bmp|gif|PNG|JPG|BMP|GIF)");
            return false;
        }
        data.append('fileimg', $('#photofile')[0].files[0]); //文件对象
        $.ajax({
            type:"POST",
            url : "/Servlet_Upload",
            data: data,
            dataType:"json",
            cache: false,
            processData: false,// 告诉jQuery不要去处理发送的数据
            contentType: false,   // 告诉jQuery不要去设置Content-Type请求头
            success: function (data) {
                console.log(data);

                if(data['success']){
                    document.getElementById('showphoto').src=data['filePath'];
                }
                else{
                    alert("添加图片失败");
                }
            },
            error:function (data) {
                alert("添加图片失败");
            }
        })
    }

</script>
<style>
    .btn{border-radius: 25px;}
    .editorcss{
        border-top-right-radius: 3%;
        border-top-left-radius: 3%;
        border-bottom-left-radius: 3%;
        border-bottom-right-radius: 3%;
    }
    input[type=file]{
        display: none;
    }
    .addphoto{
        display: none;
    }
</style>
<script type="text/javascript" src="/extend/wangEditor/wangEditor.min.js"></script>
<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#editor')
    // 或者 var editor = new E( document.getElementById('editor') )
    editor.customConfig.uploadImgHeaders='multipart/form-data';
    editor.customConfig.uploadImgServer = '/Servlet_Upload';
    editor.customConfig.uploadImgMaxSize=10*1024*1024;
    editor.customConfig.uploadImgHooks = {
        before: function (xhr, editor, files) {
            console.log("准备上传")
        },
        success: function (xhr, editor, result) {
            console.log("上传成功"+result);
        },
        fail: function (xhr, editor, result) {
            alert("上传失败"+result);
        },
        error: function (xhr, editor) {
            alert("上传出错"+result);
        },
        timeout: function (xhr, editor) {
            alert("上传超时"+result);
        },
        customInsert: function (insertImg, result, editor) {
            console.log("回传图片地址"+result);
            console.log(result)
            insertImg(result.filePath)
        }
    }
    editor.customConfig.colors = [
        '#000000',
        '#eeece0',
        '#1c487f',
        '#4d80bf',
        '#c24f4a',
        '#8baa4a',
        '#7b5ba1',
        '#46acc8',
        '#f9963b',
        '#ffffff'
    ]

    editor.create()


</script>
</html>
