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
    <link rel="icon" href="${pageContext.request.contextPath }/qiantai/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/qiantai/style.css">

</head>

<body>

    <!-- ##### Header Area Start ##### -->
    <%@include file="top.jsp" %>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(${pageContext.request.contextPath }/qiantai/img/bg-img/24.jpg);">
            <h2>商品详情</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> 首页</a></li>
                            <li class="breadcrumb-item"><a href="#">商品</a></li>
                            <li class="breadcrumb-item active" aria-current="page">商品详情</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Single Product Details Area Start ##### -->
    <section class="single_product_details_area mb-50">
        <div class="produts-details--content mb-50">
            <div class="container">
                <c:forEach var="business" items="${requestScope.business}" varStatus="status">
                    <div class="row justify-content-between">

                        <div class="col-12 col-md-6 col-lg-5">
                            <div class="single_product_thumb">
                                <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <a class="product-img" href="${pageContext.request.contextPath }/upload/${business.bphoto}" title="Product Image">
                                                <img class="d-block w-100" src="${pageContext.request.contextPath }/upload/${business.bphoto}">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <div class="single_product_desc">
                                <h4 class="title"><td>${business.bname}</td></h4>
                                <h4 class="price">￥<td>${business.bprice}</td></h4>
                                <div class="short_overview">
                                    <c:if test="${business.btype != '服务类'}">
                                        <p><span>库存：</span> <span><td>${business.bsize}</td></span></p>
                                    </c:if>
                                </div>
                                <div class="cart--area d-flex flex-wrap align-items-center">
                                    <!-- Add to Cart Form -->
                                    <button type="button" name="addtocart" class="btn alazea-btn ml-15" onclick="gobuy('${business.id}')">立即购买</button>
                                </div>
                                <div class="products--meta">
                                    <p><h5>详情：</h5> <span><p>${business.bdetails}</p></span></p>
                                </div>
                            </div>
                        </div>

                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- ##### Single Product Details Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <%@include file="footer.jsp" %>
    <!-- ##### Footer Area End ##### -->

    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="${pageContext.request.contextPath }/qiantai/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${pageContext.request.contextPath }/qiantai/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath }/qiantai/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="${pageContext.request.contextPath }/qiantai/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${pageContext.request.contextPath }/qiantai/js/active.js"></script>

    <script>
        function gobuy(id) {
            location = "${pageContext.request.contextPath }/business/getBusinessListById/?id="+id+"&weizhi=shop_cart";
        }
    </script>
</body>

</html>