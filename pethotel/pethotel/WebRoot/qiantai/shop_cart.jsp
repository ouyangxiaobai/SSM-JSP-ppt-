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

<body onload="dototal()">

    <!-- ##### Header Area Start ##### -->
    <%@include file="top.jsp" %>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(${pageContext.request.contextPath }/qiantai/img/bg-img/24.jpg);">
            <h2>购物车</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> 首页</a></li>
                            <li class="breadcrumb-item active" aria-current="page">购物车</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Cart Area Start ##### -->
    <div class="cart-area section-padding-0-100 clearfix">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="cart-table clearfix">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th><h2 style="margin-left: 30px">商品</h2></th>
                                    <th>购买数量</th>
                                    <th>单价</th>
                                    <th>总价</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="business" items="${requestScope.business}" varStatus="status">
                                    <tr>
                                        <td class="cart_product_img">
                                            <a href="#"><img src="${pageContext.request.contextPath }/upload/${business.bphoto}" alt="Product"></a>
                                            <h5>${business.bname}</h5>
                                        </td>
                                        <td class="qty">
                                            <div class="quantity" onclick="dototal()">
                                                <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                                <input type="number" class="qty-text" id="qty" step="1" min="1" max="99" name="quantity" value="1" onchange="dototal()">
                                                <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                            </div>
                                        </td>
                                        <td class="price"><span>￥${business.bprice}</span><input type="hidden" id="oneprice" value="${business.bprice}"></td>
                                        <td class="total_price">￥<span id="totalprice" ></span></td>
                                        <td class="action">
                                            <button type="button" class="btn alazea-btn" id="addbz"
                                                                    onclick="onoteshow()"
                                                                    style="padding-left: 15px;padding-right: 15px;min-width: 50px">添加备注
                                            </button>
                                            <button type="button" class="btn alazea-btn" id="nobz"
                                                    onclick="onoteclose()"
                                                    style="padding-left: 15px;padding-right: 15px;min-width: 50px;display: none">取消备注
                                            </button>
                                        </td>
                                    </tr>
                                <tr id="beizhushow" style="display: none">
                                    <td>备注：</td>
                                    <td colspan="4"><input type="text" id="beizhu" name="beizhu" style="width: 65%"></td>
                                </tr>
                                <div style="display: none;">
                                    <form id="doaddorder" action="${pageContext.request.contextPath }/order/add" method="post" >
                                        <input type="text" id="ouid" name="ouid" value="${sessionScope.userSession.id}">
                                        <input type="text" id="otype" name="otype" value="${business.btype}">
                                        <input type="text" id="obid" name="obid" value="${business.id}">
                                        <input type="text" id="oprice" name="oprice" value="">
                                        <input type="text" id="onote" name="onote" value="">
                                    </form>
                                </div>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="row">

                <!-- Coupon Discount -->
                <div class="col-12 col-lg-6">
                </div>

                <!-- Cart Totals -->
                <div class="col-12 col-lg-6">
                    <div class="cart-totals-area mt-70">
                        <div class="checkout-btn">
                            <a href="#" onclick="toaddorder()" class="btn alazea-btn w-100">结算</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- ##### Cart Area End ##### -->

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
        function dototal() {
            var num = $("#qty").val();
            var price = $("#oneprice").val();
            var totalprice = num*price;
            $("#totalprice").text(totalprice);
            $("#oprice").val(totalprice);
        }

        function toaddorder() {
            $("#onote").val($("#beizhu").val());
//             alert( $("#onote").val());
            // return false;
            var form = document.getElementById('doaddorder');
            form.submit();
        }

        function onoteshow() {
            $("#beizhushow").show();
            $("#addbz").hide();
            $("#nobz").show();
        }

        function onoteclose() {
            $("#beizhushow").hide();
            $("#addbz").show();
            $("#nobz").hide();
            $("#beizhu").val("");
        }
    </script>
</body>

</html>