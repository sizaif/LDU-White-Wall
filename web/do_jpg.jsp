<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/12/25
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/HeadTag.jsp"%>
</head>
<body>
    <div class="container">
        <jsp:include page="/HeaderNav.jsp"></jsp:include>
        <div class="col-md-2 do_jpg_another1">
            <h2 id="title_jpg"></h2>
        </div>
        <div class="col-md-12 do_jpg_another2">
            <div class="ppr_col" id="ppr_col_1">
                <div class="ppr_row" id="ppr_row_1">
                    <div class="ppr_row_images">
                        <img src="/images/dopicture/1.jpg" class="ppr_row_images_1">
                    </div>
                    <div class="ppr_row_do">
                        <a href="#" role="button" class="ppr_row_do_1">我选你</a>
                    </div>
                </div>
                <div class="ppr_row">
                    <div class="ppr_row_images">
                        <img src="/images/dopicture/2.jpg" class="ppr_row_images_1">
                    </div>
                    <div class="ppr_row_do">
                        <a href="#" role="button" class="ppr_row_do_1">我选你</a>
                    </div>
                </div>
                <div class="ppr_row">
                    <div class="ppr_row_images">
                        <img src="/images/dopicture/3.jpg" class="ppr_row_images_1">
                    </div>
                    <div class="ppr_row_do">
                        <a href="#" role="button" class="ppr_row_do_1">我选你</a>
                    </div>
                </div>
                <div class="ppr_row" id="ppr_row_4">
                    <div class="ppr_row_images">
                        <img src="/images/dopicture/4.jpg" class="ppr_row_images_1">
                    </div>
                    <div class="ppr_row_do">
                        <a href="#" role="button" class="ppr_row_do_1">我选你</a>
                    </div>
                </div>
            </div>
            <div class="ppr_col">
                <div class="ppr_row">
                    <div class="ppr_row_images">
                        <img src="/images/dopicture/5.jpg" class="ppr_row_images_1">
                    </div>
                    <div class="ppr_row_do">
                        <a href="#" role="button" class="ppr_row_do_1">我选你</a>
                    </div>
                </div>
                <div class="ppr_row">
                    <div class="ppr_row_images">
                        <img src="/images/dopicture/6.jpg" class="ppr_row_images_1">
                    </div>
                    <div class="ppr_row_do">
                        <a href="#" role="button" class="ppr_row_do_1">我选你</a>
                    </div>
                </div>
                <div class="ppr_row">
                    <div class="ppr_row_images">
                        <img src="/images/dopicture/7.jpg" class="ppr_row_images_1">
                    </div>
                    <div class="ppr_row_do">
                        <a href="#" role="button" class="ppr_row_do_1">我选你</a>
                    </div>
                </div>
                <div class="ppr_row">
                    <div class="ppr_row_images">
                        <img src="/images/dopicture/8.jpg" class="ppr_row_images_1">
                    </div>
                    <div class="ppr_row_do">
                        <a href="#" role="button" class="ppr_row_do_1">我选你</a>
                    </div>
                </div>
            </div>
            <div class="ppr_col">
                <div class="ppr_row">
                    <div class="ppr_row_images">
                        <img src="/images/dopicture/9.jpg" class="ppr_row_images_1">
                    </div>
                    <div class="ppr_row_do">
                        <a href="#" role="button" class="ppr_row_do_1">我选你</a>
                    </div>
                </div>
                <div class="ppr_row">
                    <div class="ppr_row_images">
                        <img src="/images/dopicture/10.jpg" class="ppr_row_images_1">
                    </div>
                    <div class="ppr_row_do">
                        <a href="#" role="button" class="ppr_row_do_1">我选你</a>
                    </div>
                </div>
                <div class="ppr_row">
                    <div class="ppr_row_images">
                        <img src="/images/dopicture/11.jpg" class="ppr_row_images_1">
                    </div>
                    <div class="ppr_row_do">
                        <a href="#" role="button" class="ppr_row_do_1">我选你</a>
                    </div>
                </div>
                <div class="ppr_row">
                    <div class="ppr_row_images">
                        <img src="/images/dopicture/12.jpg" class="ppr_row_images_1">
                    </div>
                    <div class="ppr_row_do">
                        <a href="#" role="button" class="ppr_row_do_1">我选你</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/footer.jsp"></jsp:include>
</body>
<style>
    #title_jpg{
        color: yellow;
        font-weight: bold;
        font-family: 华文行楷;
        font-size: 50px;
        margin: 0px;
        text-align: center;
    }
    .do_jpg_another1{
        text-align: left;
        padding: 0px;
        margin-bottom: 20px;
        width: 100%;
    }
    .do_jpg_another2{
        height: 150%;
        margin-bottom: 30px;
        background-color: white;
        padding: 0px;
        border-radius: 25px;
    }
    .ppr_col{
        height: 31%;
        margin-bottom: 19px;
    }
    .ppr_row{
        width: 25%;
        height: 100%;
        border: 1px solid #eeeeee;
        float: left;
        padding: 1%;
    }
    .ppr_row:hover{
        background-color: #eeeeee;
    }
    .ppr_row_images{
        height: 87%;
        border-top-left-radius: 4px;
        border-top-right-radius: 4px;

    }
    .ppr_row_do{
        height: 13%;
        border: 1px solid #eeeeee;
        text-align: center;

    }
    .ppr_row_images_1{
        width: 100%;
        height: 100%;
    }
    .ppr_row_do a
    {
        display: block;
        text-decoration: none;
        padding-top: 2px;
        color: black;
    }
    .ppr_row_do:hover{
        background-color: slategrey;
    }
    .ppr_row_do_1{
        font-size: 20px;
        font-family: 宋体;
        font-weight: bold;
        color: black;
        vertical-align: middle;
    }
    #ppr_row_1{
        border-top-left-radius: 25px;
    }
    #ppr_row_4{
        border-top-right-radius: 25px;
    }
    #ppr_col_1{
        border-top-left-radius: 25px;
        border-top-right-radius: 25px;
    }
</style>
</html>
