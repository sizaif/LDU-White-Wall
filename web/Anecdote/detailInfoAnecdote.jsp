<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 12/26/2018
  Time: 1:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>${Anecdote}.id</title>

    <%@include file="/HeaderExtend.jsp"%>

    <link href="/css/HeaderNav.css" rel="stylesheet" type="text/css">

    <script src="//cdn1.lncld.net/static/js/3.0.4/av-min.js"></script>
    <!--Valine 的核心代码库-->
    <script src="/extend/Valine/dist/Valine.min.js"></script>
    <link href="/extend/Valine/style.css" type="text/css" rel="stylesheet">
</head>
<body>
    <header>
        <jsp:include page="../HeaderNav.jsp"></jsp:include>
    </header>
    <header class="am-g my-head">
        <div class="am-u-sm-12 am-article">
            <h1>
                ${Anecdote.title}
            </h1>
            <p class="am-article-meta">${Anecdote.author}</p>
        </div>
    </header>
    <hr class="am-article-divider"/>
    <div class="am-g am-g-fixed">
        <div class="am-u-md-9 am-u-md-push-3">
            <div class="am-g">
                <div class="am-u-sm-centered">
                    <div class="am-cf am-article">
                        <p>
                            ${Anecdote.content}
                        </p>
                    </div>
                    <hr/>
                    <div class="am-comments-list">
                        <div class="comm">
                            <div class="comment"></div>
                            <script>
                                new Valine({
                                    // AV 对象来自上面引入av-min.js(老司机们不要开车➳♡゛扎心了老铁)
                                    av: AV,
                                    el: '.comment',
                                    emoticon_url: 'https://cloud.panjunwen.com/alu',
                                    emoticon_list: ["吐.png","期待.png","高兴.png","吐血倒地.png","哭泣.png","欢呼.png"],
                                    app_id: 'Vlooh9q6R927PPdN4jGX6U4l-gzGzoHsz', // 这里填写上面得到的APP ID
                                    app_key: 'o73oAuC0SAe6FctB6XjsUYJY', // 这里填写上面得到的APP KEY
                                    placeholder: '请留下你的足迹' // [v1.0.7 new]留言框占位提示文字
                                });
                            </script>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="am-u-md-3 am-u-md-pull-9 my-sidebar">
            <div class="am-offcanvas" id="sidebar">
                <div class="am-offcanvas-bar">
                    <ul class="am-nav">
                        <li class="am-nav-header">Detail</li>
                        <li><a href="#">Detail</a></li>

                        <li><a href="#">Created By ${Anecdote.author}</a></li>
                        <li><a href="#">发布时间: ${Anecdote.time}</a></li>
                        <li><a href="#">访问量: ${Anecdote.visit}</a></li>
                        <li><a href="#">热度: ${Anecdote.star}</a></li>
                    </ul>
                </div>
            </div>
        </div>

    </div>

<footer class="my-footer">
    <jsp:include page="../footer.jsp"></jsp:include>
</footer>

</body>
<style>
    .my-head {
        margin-top: 40px;
        text-align: center;
    }
    .my-sidebar {
        padding-right: 0;
        border-right: 1px solid #eeeeee;
    }
    @media only screen and (min-width: 641px) {
        .am-offcanvas {
            display: block;
            position: static;
            background: none;
        }

        .am-offcanvas-bar {
            position: static;
            width: auto;
            background: none;
            -webkit-transform: translate3d(0, 0, 0);
            -ms-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
        }
        .am-offcanvas-bar:after {
            content: none;
        }

    }

    @media only screen and (max-width: 640px) {
        .am-offcanvas-bar .am-nav>li>a {
            color:#ccc;
            border-radius: 0;
            border-top: 1px solid rgba(0,0,0,.3);
            box-shadow: inset 0 1px 0 rgba(255,255,255,.05)
        }

        .am-offcanvas-bar .am-nav>li>a:hover {
            background: #404040;
            color: #fff
        }

        .am-offcanvas-bar .am-nav>li.am-nav-header {
            color: #777;
            background: #404040;
            box-shadow: inset 0 1px 0 rgba(255,255,255,.05);
            text-shadow: 0 1px 0 rgba(0,0,0,.5);
            border-top: 1px solid rgba(0,0,0,.3);
            font-weight: 400;
            font-size: 75%
        }

        .am-offcanvas-bar .am-nav>li.am-active>a {
            background: #1a1a1a;
            color: #fff;
            box-shadow: inset 0 1px 3px rgba(0,0,0,.3)
        }

        .am-offcanvas-bar .am-nav>li+li {
            margin-top: 0;
        }
    }
</style>

</html>
