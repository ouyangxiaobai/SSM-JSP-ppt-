<%@ page import="cn.util.Const" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container-scroller">
    <!-- partial:partials/_navbar.jsp -->
    <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
            <%--<a class="navbar-brand brand-logo"--%>
               <%--href="${pageContext.request.contextPath }/purple/pages/samples/index.jsp"><img--%>
                    <%--src="${pageContext.request.contextPath }/purple/images/logo.svg" alt="logo"/></a>--%>
            <a class="navbar-brand brand-logo-mini" href="${pageContext.request.contextPath }/samples/index.jsp"><img
                    src="${pageContext.request.contextPath }/purple/images/logo-mini.svg" alt="logo"/></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
            <div class="search-field d-none d-md-block">
                <form class="d-flex align-items-center h-100" action="#">
                    <div class="input-group">
                        <div class="input-group-prepend bg-transparent">
                            <%--<i class="input-group-text border-0 mdi mdi-magnify"></i>--%>
                        </div>
                        <%--<input type="text" class="form-control bg-transparent border-0" placeholder="搜索">--%>
                    </div>
                </form>
            </div>
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link">
                        <div class="nav-profile-img">
                            <img src="${pageContext.request.contextPath }/purple/images/myimg/giligili.gif" alt="image">
                            <span class="availability-status online"></span>
                        </div>
                        <div class="nav-profile-text">
                            <p class="mb-1 text-black">欢迎您尊敬的管理员</p>
                        </div>
                    </a>
                </li>
                <li class="nav-item d-none d-lg-block full-screen-link">
                    <a class="nav-link">
                        <i class="mdi mdi-fullscreen" id="fullscreen-button"></i>
                    </a>
                </li>
                <li class="nav-item nav-logout d-none d-lg-block">
                    <a class="nav-link" href="${pageContext.request.contextPath }/user/logout">
                        <i class="mdi mdi-power"></i>
                    </a>
                </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                    data-toggle="offcanvas">
                <span class="mdi mdi-menu"></span>
            </button>
        </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.jsp -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <ul class="nav">

                <%--<li class="nav-item">--%>
                    <%--<a class="nav-link" href="${pageContext.request.contextPath }/mission_Missionlist">--%>
                        <%--<span class="menu-title">主页</span>--%>
                        <%--<i class="mdi mdi-home menu-icon"></i>--%>
                    <%--</a>--%>
                <%--</li>--%>

                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#general-pages" aria-expanded="false"
                       aria-controls="general-pages">
                        <span class="menu-title">管理列表</span>
                        <i class="menu-arrow"></i>
                        <i class="mdi mdi-contacts menu-icon"></i>
                    </a>
                    <div class="collapse" id="general-pages">
                        <ul class="nav flex-column sub-menu">
                            <%--<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/user/getUserList"> 所有用户列表 </a></li>--%>
                            <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/user/getUserList?role=会员"> 会员管理 </a></li>
                            <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/user/getUserList?role=管理员"> 管理员管理 </a></li>
                            <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/business/getBusinessList?btype=宠舍类"> 宠舍管理 </a></li>
                            <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/business/getBusinessList?btype=服务类"> 服务管理 </a></li>
                            <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/business/getBusinessList?btype=主粮类"> 主粮管理 </a></li>
                            <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/business/getBusinessList?btype=零食类"> 零食管理 </a></li>
                            <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/order/getOrderOuidList"> 订单管理 </a></li>
                            <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/message/getMessageList"> 信息管理 </a></li>
                            <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/news/getNewsList"> 新闻管理 </a></li>
                            <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/comment/getCommentList"> 评论管理 </a></li>
                        </ul>
                    </div>
                </li>

            </ul>
        </nav>