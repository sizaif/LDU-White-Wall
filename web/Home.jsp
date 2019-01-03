<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 9/17/2018
  Time: 8:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WelcomeUser</title>
    <%@include file="/HeadTag.jsp"%>
</head>

<body>
        <jsp:include page="HeaderNav.jsp"></jsp:include>

        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="carousel slide" id="carousel-720141">
                        <ol class="carousel-indicators">
                            <li data-slide-to="0" data-target="#carousel-720141">
                            </li>
                            <li data-slide-to="1" data-target="#carousel-720141" class="active">
                            </li>
                            <li data-slide-to="2" data-target="#carousel-720141">
                            </li>
                            <li data-slide-to="3" data-target="#carousel-720141">
                            </li>
                            <li data-slide-to="4" data-target="#carousel-720141">
                            </li>
                            <li data-slide-to="5" data-target="#carousel-720141">
                            </li>
                            <li data-slide-to="6" data-target="#carousel-720141">
                            </li>
                            <li data-slide-to="7" data-target="#carousel-720141">
                            </li>
                            <li data-slide-to="8" data-target="#carousel-720141">
                            </li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item">
                                <img alt="" src="/images/home/wallpaper0265.jpg" />
                                <div class="carousel-caption">
                                    <h4>
                                        沈从文《致张兆和情书》
                                    </h4>
                                    <p>
                                        在青山绿水之间，我想牵着你的手，走过这座桥，桥上是绿叶红花，桥下是流水人家，桥的那头是青丝，桥的这头是白发。
                                    </p>
                                </div>
                            </div>
                            <div class="item active">
                                <img alt="" src="/images/home/wallpaper0229.png" />
                                <div class="carousel-caption">
                                    <h4>

                                    </h4>
                                    <p>
                                        心安茅屋稳，性定菜根香;世事静方见，人情淡始长.
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img alt="" src="/images/home/wallpaper0284.jpg" />
                                <div class="carousel-caption">
                                    <h4>
                                        《三行情书》
                                    </h4>
                                    <p>
                                        飞蛾对灯火说的话
                                        我想对你再说一次
                                        奋不顾身之前，我是知道结局的.
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img alt="" src="/images/home/wallpaper0299.png" />
                                <div class="carousel-caption">
                                    <h4>
                                        《三行情书》
                                    </h4>
                                    <p>
                                        所有的日记都知道我喜欢你
                                        够了
                                        这就是全部了.
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img alt="" src="/images/home/wallpaper0316.jpg" />
                                <div class="carousel-caption">
                                    <h4>
                                        汪曾祺《汪曾祺散文》
                                    </h4>
                                    <p>
                                        我每天醒在鸟声里。我从梦里就听到鸟叫，直到我醒来。我听得出几种极熟悉的叫声，那是每天都叫的，似乎每天都在那个固定的枝头。
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img alt="" src="/images/home/wallpaper0025.jpg" />
                                <div class="carousel-caption">
                                    <h4>
                                        周国平《守望的距离》
                                    </h4>
                                    <p>
                                        我唯愿保持住一份生命的本色，一份能够安静聆听别的生命也使别的生命愿意安静聆听的纯真，此中的快乐远非浮华功名可比。
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img alt="" src="/images/home/wallpaper0367.jpg" />
                                <div class="carousel-caption">
                                    <h4>
                                        林清玄《现在就是最好的时光》
                                    </h4>
                                    <p>
                                        前不看村，后不看店，永远在旅途上，永远向万里无寸草处行去。
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img alt="" src="/images/home/wallpaper0373.jpg" />
                                <div class="carousel-caption">
                                    <h4>
                                        安意如《人生若只如初见》
                                    </h4>
                                    <p>
                                        如果我有来生，我还是会一个人孤单一辈子，因为我爱的人不爱我。
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img alt="" src="/images/home/wallpaper0159.jpg" />
                                <div class="carousel-caption">
                                    <h4>
                                        安意如《人生若只如初见》
                                    </h4>
                                    <p>
                                        原来，需等到风住尘香花已尽， 才可以看到最后的风清月朗，花好月圆。
                                    </p>
                                </div>
                            </div>
                        </div>
                        <a class="left carousel-control" href="#carousel-720141" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-720141" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
</body>
<style>
    .carousel-control .glyphicon-chevron-left, .carousel-control .glyphicon-chevron-right, .carousel-control .icon-next, .carousel-control .icon-prev{
        display: none;
    }
</style>
<script>
    $(function(){
        $('#carousel-720141').carousel({interval:5000});
    })
</script>
</html>
