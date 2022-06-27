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
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(${pageContext.request.contextPath }/qiantai/img/myself/index/1.jpg);">
            <h2>宠舍</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/qiantai/index.jsp"><i class="fa fa-home"></i> 首页</a></li>
                            <li class="breadcrumb-item active" aria-current="page">商品</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Shop Area Start ##### -->
    <section class="shop-page section-padding-0-100">
        <div class="container">
            <div class="row">
                <!-- Shop Sorting Data -->
                <div class="col-12">
                    <div class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
                        <!-- Shop Page Count -->
                        <div class="shop-page-count">
                            <p>宠物主粮</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Sidebar Area -->
                <div class="col-12 col-md-4 col-lg-3">
                    <div class="shop-sidebar-area">

                        <!-- Shop Widget -->
                        <div class="shop-widget catagory mb-50">
                            <h4 class="widget-title">宠物主粮</h4>
                            <div class="widget-desc">
                                <!-- Single Checkbox -->
                                <c:forEach var="business" items="${pageInfo.list}" varStatus="status">
                                    <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                        <span class="text-muted">${business.bname}</span>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- All Products Area -->
                <div class="col-12 col-md-8 col-lg-9">
                    <div class="shop-products-area">
                        <form id="sform" method="get" action="${pageContext.request.contextPath }/business/getBusinessList">
                            <input type="hidden" class="form-control" name="pageIndex" id="pageIndex"
                                   value="1">
                            <input type="hidden" class="form-control" name="btype" id="btype"
                                   value="宠舍类">
                            <div class="row">

                                <c:forEach var="business" items="${pageInfo.list}" varStatus="status">
                                    <!-- Single Product Area -->
                                    <div class="col-12 col-sm-6 col-lg-4">
                                        <div class="single-product-area mb-50">
                                            <!-- Product Image -->
                                            <div class="product-img">
                                                <a onclick="javascript:godetails('${business.id}')"><img src="${pageContext.request.contextPath }/upload/${business.bphoto}" alt=""></a>
                                                <div class="product-meta d-flex">
                                                    <a onclick="javascript:gobuy('${business.id}')" class="add-to-cart-btn">立即购买</a>
                                                    <a class="compare-btn">${business.bsize}</a>
                                                </div>
                                            </div>
                                            <!-- Product Info -->
                                            <div class="product-info mt-15 text-center">
                                                <a href="shop-details.html">
                                                    <p>${business.bname}</p>
                                                </a>
                                                <h6>￥${business.bprice}</h6>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <!-- Pagination -->
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <c:if test="${pageInfo.pageNum != 1}">
                                        <li class="page-item"><a class="page-link" href="javascript:goPage('1')">1</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:goPage('${pageInfo.prePage}')"><i class="fa fa-angle-left"></i></a></li>
                                    </c:if>
                                    <li class="page-item"><a class="page-link">${pageInfo.pageNum}</a></li>
                                    <c:if test="${pageInfo.pageNum != pageInfo.pages}">
                                        <li class="page-item"><a class="page-link" href="javascript:goPage('${pageInfo.nextPage}')"><i class="fa fa-angle-right"></i></a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:goPage('${pageInfo.pages}')">${pageInfo.pages}</a></li>
                                    </c:if>
                                </ul>
                            </nav>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Shop Area End ##### -->

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
        function goPage(page) {
            $("#pageNo").val(page);
            $("#sform").submit();
        }

        function godetails(id) {
            location = "${pageContext.request.contextPath }/business/getBusinessListById/?id="+id+"&weizhi=shop_details";
        }

        function gobuy(id) {
            location = "${pageContext.request.contextPath }/business/getBusinessListById/?id="+id+"&weizhi=shop_cart";
        }
    </script>
</body>

</html>