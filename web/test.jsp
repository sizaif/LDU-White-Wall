<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 12/11/2018
  Time: 4:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>

    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <link href="/css/bootstrap.min.css" type="text/css" rel="stylesheet">
</head>
<body>

<%--data-toggle="modal" data-target="#myModal"--%>
    <button class="btn btn-primary btn-lg" id="butto" >开始</button>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">标题</h4>
                </div>
                <div class="modal-body">
                    <p>这里是弹窗的具体内容......&hellip;</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary">保存</button>
                </div>
            </div>
        </div>
    </div>

<script>
    $(function () {
        $('#myModal').modal('hide');
        $('#butto').click(function () {
            alert("show");
            $('#myModal').modal('show');
        });
        $('#myModal').on('hide.bs.modal',function () {
            alert("helllo!");
        })
    })

</script>

</body>
</html>




