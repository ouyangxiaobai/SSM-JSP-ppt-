<%@ page import="cn.util.Const" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="cn">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>犬舍寄养系统</title>

    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/qiantai/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/qiantai/style.css">

</head>

<body onload="news()">
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-circle"></div>
        <div class="preloader-img">
            <img src="img/core-img/leaf.png" alt="">
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <%@include file="top.jsp" %>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Hero Area Start ##### -->
    <section class="hero-area">
        <div class="hero-post-slides owl-carousel">

            <!-- Single Hero Post -->
            <div class="single-hero-post bg-overlay">
                <!-- Post Image -->
                <div class="slide-img bg-img" style="background-image: url(${pageContext.request.contextPath}/qiantai/img/myself/index/7.jpg);"></div>
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <!-- Post Content -->
                            <div class="hero-slides-content text-center">
                                <h2>欢迎光临爱宠之家</h2>
                                <p>在这里，我们将为您打造一个令您放心、宠物舒心的犬舍寄养平台</p>
                                <div class="welcome-btn-group">
                                    <c:if test="${sessionScope.userSession == null}">
                                        <a href="#LoginSection" class="btn alazea-btn mr-30" onclick="tologin()">去登陆</a>
                                        <a href="#RegisterSection" class="btn alazea-btn active" onclick="toregistered()">加入我们</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- ##### Hero Area End ##### -->

    <!-- ##### Service Area Start ##### -->
    <section class="our-services-area bg-gray section-padding-100-0" id="BusinessSection">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center">
                        <h2>我们的服务</h2>
                        <p>我们将提供以下服务给您</p>
                    </div>
                </div>
            </div>

            <div class="row justify-content-between">
                <div class="col-12 col-lg-5">
                    <div class="alazea-service-area mb-100">

                        <!-- Single Service Area -->
                        <div class="single-service-area d-flex align-items-center wow fadeInUp" data-wow-delay="100ms">
                            <!-- Icon -->
                            <div class="service-icon mr-30">
                                <img src="${pageContext.request.contextPath}/qiantai/img/core-img/s1.png" alt="">
                            </div>
                            <!-- Content -->
                            <div class="service-content">
                                <h5>宠舍</h5>
                                <p>为您的爱宠打造外观精致、环境优美、布置合理的宠物宿舍</p>
                            </div>
                        </div>

                        <!-- Single Service Area -->
                        <div class="single-service-area d-flex align-items-center wow fadeInUp" data-wow-delay="300ms">
                            <!-- Icon -->
                            <div class="service-icon mr-30">
                                <img src="${pageContext.request.contextPath}/qiantai/img/core-img/s3.png" alt="">
                            </div>
                            <!-- Content -->
                            <div class="service-content">
                                <h5>宠粮</h5>
                                <p>为您的爱宠提供或出售营养丰富、口味独特的主粮及零食</p>
                            </div>
                        </div>

                        <!-- Single Service Area -->
                        <div class="single-service-area d-flex align-items-center wow fadeInUp" data-wow-delay="500ms">
                            <!-- Icon -->
                            <div class="service-icon mr-30">
                                <img src="${pageContext.request.contextPath}/qiantai/img/core-img/s2.png" alt="">
                            </div>
                            <!-- Content -->
                            <div class="service-content">
                                <h5>宠物服务</h5>
                                <p>为您的爱宠进行美容、美发、护理、摄影等服务</p>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-12 col-lg-6">
                    <div class=" mb-100">
                        <img src="${pageContext.request.contextPath}/qiantai/img/myself/index/1.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Portfolio Area End ##### -->

    <!-- ##### Blog Area Start ##### -->
    <section class="alazea-blog-area section-padding-100-0" id="NewsSection">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center">
                        <h2>公告栏</h2>
                        <p>关于宠物之家的通告或帮助将发布在这里哦~</p>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center" id="NewsDiv">

                <!-- Single Blog Post Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-blog-post mb-100">
                        <div class="post-thumbnail mb-30">
                            <a href="#"><img src="${pageContext.request.contextPath}/qiantai/img/myself/index/4.jpg" alt=""></a>
                        </div>
                    </div>
                </div>

                <!-- Single Blog Post Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-blog-post mb-100">
                        <div class="post-thumbnail mb-30">
                            <a href="#"><img src="${pageContext.request.contextPath}/qiantai/img/myself/index/5.jpg" alt=""></a>
                        </div>
                    </div>
                </div>

                <!-- Single Blog Post Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-blog-post mb-100">
                        <div class="post-thumbnail mb-30">
                            <a href="#"><img src="${pageContext.request.contextPath}/qiantai/img/myself/index/6.jpg" alt=""></a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- ##### Blog Area End ##### -->

    <!-- ##### Contact Area Start ##### -->
    <%-- Login --%>
    <section id="LoginSection" class="contact-area section-padding-100-0" style="display: none">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-12 col-lg-5">
                    <!-- Section Heading -->
                    <div class="section-heading">
                        <h2>欢迎您亲爱的会员~</h2>
                        <p>请输入您的用户名和密码以登录</p>
                    </div>
                    <!-- Contact Form Area -->
                    <div class="contact-form-area mb-100">
                        <form action="${pageContext.request.contextPath}/user/login" method="post">
                            <div class="row">
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="username" name="username" placeholder="用户名">
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="userpassword" name="userpassword" placeholder="密码">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input type="hidden" class="form-control" id="urole" name="urole" value="会员">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn alazea-btn mt-15">登录</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <!-- Google Maps -->
                    <div class="map-area mb-100">

                    </div>
                </div>
            </div>
        </div>
    </section>

    <%-- Register --%>
    <section id="RegisterSection" class="contact-area section-padding-100-0" style="display: none">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-12 col-lg-5">
                    <!-- Section Heading -->
                    <div class="section-heading">
                        <h2>欢迎加入我们，亲爱的~</h2>
                        <p>请输入您的注册信息</p>
                    </div>
                    <!-- Contact Form Area -->
                    <div class="contact-form-area mb-100">
                        <form action="${pageContext.request.contextPath}/user/add" method="post">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <input type="hidden" class="form-control" id="urole" name="urole" value="会员">
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="username" name="username" placeholder="用户名" required>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="userpassword" name="userpassword" placeholder="密码" required>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="uname" name="uname" placeholder="姓名" required>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="usex" name="usex" placeholder="性别" required>
                                    </div>
                                </div>
                                <%--<div class="col-12">--%>
                                    <%--<div class="form-group">--%>
                                        <%--<input type="text" class="form-control" id="uphoto" name="uphoto" placeholder="头像">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="uphone" name="uphone" placeholder="电话" required>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea class="form-control" name="uaddress" id="uaddress" cols="30" rows="10" placeholder="地址" required></textarea>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn alazea-btn mt-15">注册</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <!-- Google Maps -->
                    <div class="map-area mb-100">

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <%@include file="footer.jsp" %>
    <!-- ##### Footer Area End ##### -->

    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="${pageContext.request.contextPath}/qiantai/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${pageContext.request.contextPath}/qiantai/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath}/qiantai/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="${pageContext.request.contextPath}/qiantai/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${pageContext.request.contextPath}/qiantai/js/active.js"></script>

    <script>
        function news() {
            $.getJSON("${pageContext.request.contextPath}/news/getIndexNewsList", function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#NewsDiv").append("<div class=\"col-12 col-md-6 col-lg-4\">" +
                        "<div class=\"single-blog-post mb-100\">" +
                        "<div class=\"post-content\">" +
                        "<a href=\"single-post.html\" class=\"post-title\"><h5>"+data[i].ntitle+"</h5></a> " +
                        "<div class=\"post-meta\"> " +
                        "<a href=\"#\"><i class=\"fa fa-clock-o\" aria-hidden=\"true\"></i> "+data[i].ntime+"</a> " +
                        "<a href=\"#\"><i class=\"fa fa-user\" aria-hidden=\"true\"></i> Admin</a>" +
                        " </div> <p class=\"post-excerpt\">"+data[i].ndetails+"</p> " +
                        "</div> </div> </div>")
                }
                $("#addModal").modal("show");
            });
        }
        function tologin() {
            $("#LoginSection").show();
            $("#RegisterSection").hide();
        }
        function toregistered() {
            $("#RegisterSection").show();
            $("#LoginSection").hide();
        }
    </script>
</body>

</html>