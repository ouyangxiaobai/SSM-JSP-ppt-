<%@ page import="cn.util.Const" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header-area">

    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-circle"></div>
        <div class="preloader-img">
            <img src="${pageContext.request.contextPath }/qiantai/img/core-img/leaf.png" alt="">
        </div>
    </div>
    <!-- ***** Top Header Area ***** -->
    <div class="top-header-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="top-header-content d-flex align-items-center justify-content-between">
                        <!-- Top Header Content -->
                        <div class="top-header-meta">
                            <c:if test="${sessionScope.userSession != null}">
                                <a href="#" onclick="yourself()" data-toggle="tooltip" data-placement="bottom" title=""><i class="fa fa-envelope-o" aria-hidden="true"></i> <span>个人主页</span></a>
                                <form id="yourorder" style="display: none;"  action="${pageContext.request.contextPath }/order/getOrderOuidList" method="post">
                                    <input type="hidden" id="ouid" name="ouid" value="${sessionScope.userSession.id}">
                                </form>
                            </c:if>
                            <a href="#" data-toggle="tooltip" data-placement="bottom" title="+1 234 122 122"><i class="fa fa-phone" aria-hidden="true"></i> <span>联系电话: +1 234 122 122</span></a>
                        </div>

                        <!-- Top Header Content -->
                        <div class="top-header-meta d-flex">
                            <!-- Language Dropdown -->
                            <div class="language-dropdown">
                                <div class="dropdown">

                                </div>
                            </div>
                            <!-- Login -->
                            <div class="login">
                                <c:if test="${sessionScope.userSession == null}">
                                    <a href="${pageContext.request.contextPath }/qiantai/index.jsp#LoginSection" onclick="tologin()"><i class="fa fa-user" aria-hidden="true"></i> <span>登录</span></a>
                                </c:if>
                                <c:if test="${sessionScope.userSession != null}">
                                    <a href="#" onclick="dologout()"><i class="fa fa-user" aria-hidden="true"></i> <span>退出</span></a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ***** Navbar Area ***** -->
    <div class="alazea-main-menu">
        <div class="classy-nav-container breakpoint-off">
            <div class="container">
                <!-- Menu -->
                <nav class="classy-navbar justify-content-between" id="alazeaNav">

                    <!-- Nav Brand -->
                    <a class="nav-brand"><img src="${pageContext.request.contextPath }/qiantai/img/core-img/logo.png" alt=""></a>

                    <!-- Navbar Toggler -->
                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler"><span></span><span></span><span></span></span>
                    </div>

                    <!-- Menu -->
                    <div class="classy-menu">

                        <!-- Close Button -->
                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>

                        <!-- Navbar Start -->
                        <div class="classynav">
                            <ul>
                                <li><a href="${pageContext.request.contextPath }/qiantai/index.jsp">首页</a></li>
                                <li><a href="${pageContext.request.contextPath }/qiantai/index.jsp#BusinessSection">关于</a></li>
                                <li><a href="${pageContext.request.contextPath }/qiantai/index.jsp#NewsSection">公告</a></li>
                                <li><a href="#Footerfooter">其他</a></li>
                                <li><a href="${pageContext.request.contextPath }/comment/getCommentList">评论</a></li>
                                <c:if test="${sessionScope.userSession != null}">
                                    <li>
                                        <a href="#">业务</a>
                                        <ul class="dropdown">
                                            <li><a href="#">宠舍</a>
                                                <ul class="dropdown">
                                                    <li><a href="${pageContext.request.contextPath }/business/getBusinessList?btype=宠舍类&btroom=小型">小型</a>
                                                    </li>
                                                    <li><a href="${pageContext.request.contextPath }/business/getBusinessList?btype=宠舍类&btroom=中型">中型</a>
                                                    </li>
                                                    <li><a href="${pageContext.request.contextPath }/business/getBusinessList?btype=宠舍类&btroom=大型">大型</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li><a href="${pageContext.request.contextPath }/business/getBusinessList?btype=主粮类">主粮</a>
                                            </li>
                                            <li><a href="${pageContext.request.contextPath }/business/getBusinessList?btype=零食类">零食</a>
                                            </li>
                                            <li><a href="#">服务</a>
                                                <ul class="dropdown">
                                                    <li><a href="${pageContext.request.contextPath }/business/getBusinessList?btype=服务类&btroom=宠物洗护">宠物洗护</a>
                                                    </li>
                                                    <li><a href="${pageContext.request.contextPath }/business/getBusinessList?btype=服务类&btroom=宠物美容">宠物美容</a>
                                                    </li>
                                                    <li><a href="${pageContext.request.contextPath }/business/getBusinessList?btype=服务类&btroom=宠物护理">宠物护理</a>
                                                    </li>
                                                    <li><a href="${pageContext.request.contextPath }/business/getBusinessList?btype=服务类&btroom=宠物摄影">宠物摄影</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                        <!-- Navbar End -->
                    </div>
                </nav>

                <!-- Search Form -->
                <div class="search-form">
                    <form action="#" method="get">
                        <input type="search" name="search" id="search" placeholder="Type keywords &amp; press enter...">
                        <button type="submit" class="d-none"></button>
                    </form>
                    <!-- Close Icon -->
                    <div class="closeIcon"><i class="fa fa-times" aria-hidden="true"></i></div>
                </div>
            </div>
        </div>
    </div>
</header>
<script>
    function yourself() {
        var form = document.getElementById('yourorder');
        form.submit();
    }

    function dologout() {
        location = "${pageContext.request.contextPath }/user/logout";
    }
</script>