<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 11/17/2018
  Time: 9:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>寻人</title>
    <%--导入富文本编辑 需要的js--%>
    <meta http-equiv="CONTENT-TYPE" content="text/html;charest=utf-8">
    <script type="text/javascript" charset="utf-8" src="../ueditor2/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor2/ueditor.all.js"></script>
    <link href="../ueditor2/themes/default/css/ueditor.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8" src="../ueditor2/lang/zh-cn/zh-cn.js"></script>

</head>
<body>
        <%--header--%>
        <jsp:include page="../HeaderNav.jsp"></jsp:include>

        <%--title--%>
        <div>
            <h1>
               发布寻人通缉令
            </h1>
        </div>
        <div style=" position: center;margin: auto">
            <textarea id="editor" name="content" type="text/plain" style="width: 1000px ; height: 500px">

            </textarea>
        </div>
</body>
<script type="text/javascript">
    UE.getEditor('editor');
</script>
</html>
