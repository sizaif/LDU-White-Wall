<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 12/26/2018
  Time: 1:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发布新知识点</title>
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/css/HeaderNav.css" rel="stylesheet" type="text/css">
</head>
<body>

        <%
            Object user_name = session.getAttribute("username");
            Object user_nick = session.getAttribute("usernick");
            Object user_permission =  session.getAttribute("permission");
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            String nowTime = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
        %>
        <jsp:include page="/HeaderNav.jsp"></jsp:include>

        <div class="container">
            <div class="row clearfix">

                <div class="col-md-12 column">
                    <div class="row clearfix">
                        <div class="col-md-8 column">
                            <div>
                                <form role="form">
                                    <div class="form-group">
                                        <label for="title">标题</label><input type="text" class="form-control" id="title" />
                                    </div>
                                    <div class="form-group" style="display: none">
                                        <label for="author">作者</label><input type="text" class="form-control"  id="author" value="<%=user_nick%>"/>
                                    </div>
                                    <div class="form-group" style="display: none">
                                        <label for="time">发布时间</label><input type="text" class="form-control"  id="time" value="<%=nowTime%>"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="sort">类别</label>
                                        <select id="sort">
                                            <option value ="拉呱">拉呱</option>
                                            <option value ="教程">教程</option>
                                            <option value="考研">考研</option>
                                            <option value="吐槽">吐槽</option>
                                            <option value="求助">求助</option>
                                            <option value="招聘">招聘</option>
                                            <option value="寻物启事">寻物启事</option>
                                            <option value="失物招领">失物招领</option>

                                        </select>
                                    </div>
                                    <div class="form-group" >
                                        <label for="tag">标签</label>
                                        <textarea type="text" class="form-control"  id="tag" value=""></textarea>
                                    </div>
                                </form>
                                <div>
                                    <textarea type="text" name="contant" id="contant" hidden></textarea>
                                    <div id="editor" class="editorcss">
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-default" onclick="submitAll()">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
<script>
        function submitAll() {
            var title = document.getElementById('title').value;
            var author = document.getElementById('author').value;
            var time = document.getElementById('time').value;
            var tags =  document.getElementById('tag').value;
            var sort = document.getElementById('sort').value;
            var content = editor.txt.html();

            var type ="insert";
            if( title ==null){
                alert("标题不能为空");
                return false;
            }
            if(content ==null) {
                alert("内容不能为空");
                return false;
            }

            console.log(title);
            console.log(author);
            console.log(time);
            console.log(tag);
            console.log(sort);
            console.log(content);
            $.ajax({
                type:"POST",
                url : "/Servlet_Anecdote",
                data: {type:type,title:title,author:author,sort:sort,time:time,content:content,tags:tags},
                dataType:"json",
                success: function (data) {
                    console.log(data);
                    if(data["success"]){
                        alert("发布成功!");
                        window.location.reload();
                        // window.location.href=data["forward"];
                    }else {
                        alert("发布失败!");
                        window.location.reload();
                    }

                },
                error:function (data) {
                    alert("发布失败");
                    window.location.reload();
                }
            })
        }
</script>
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
