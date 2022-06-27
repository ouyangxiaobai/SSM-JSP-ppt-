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

    <link rel="stylesheet" href="${pageContext.request.contextPath }/purple/css/style.css">

    <style>
        .WidthCenter {
            width: 10%;
            text-align: center;
        }
    </style>

</head>

<body onload="mesShow()">
<!-- ##### Header Area Start ##### -->
<%@include file="top.jsp" %>
<!-- ##### Header Area End ##### -->

<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
    <!-- Top Breadcrumb Area -->
    <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
         style="background-image: url(${pageContext.request.contextPath }/qiantai//img/bg-img/24.jpg);">
        <h2>个人主页</h2>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> 首页</a></li>
                        <li class="breadcrumb-item active" aria-current="page">个人主页</li>
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
                            <th style="width: 10%;text-align: center">编号</th>
                            <th style="width: 10%;text-align: center">订单类别</th>
                            <th style="width: 10%;text-align: center">下单时间</th>
                            <th style="width: 10%;text-align: center">订单总账</th>
                            <th style="width: 10%;text-align: center">完成时间</th>
                            <th style="width: 10%;text-align: center">订单状态</th>
                            <th style="width: 10%;text-align: center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="order" items="${requestScope.qiantaiorder}" varStatus="status">
                            <tr>
                                <td style="width: 10%;text-align: center">${order.id}</td>
                                <td style="width: 10%;text-align: center">${order.otype}</td>
                                <td style="width: 10%;text-align: center">${order.octime}</td>
                                <td style="width: 10%;text-align: center">${order.oprice}</td>
                                <td style="width: 10%;text-align: center">${order.oftime}</td>
                                <td style="width: 10%;text-align: center">${order.ostate}</td>
                                <td style="width: 10%;text-align: center">
                                    <button type="button" class="btn alazea-btn" value=""
                                            onclick="gopingjia('${order.obid}')"
                                            style="padding-left: 15px;padding-right: 15px;min-width: 50px">评价
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td >备注</td>
                                <td style="font-weight: lighter" colspan="6">${order.onote}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Cart Totals -->
        <div class="col-12 col-lg-6">
            <div class="cart-totals-area mt-70">
                <h4 class="title--">
                    您的个人资料
                    <c:if test="${sessionScope.userSession.uphoto == null || sessionScope.userSession.uphoto == ''}">
                        (请上传您的头像)
                    </c:if>
                    <c:if test="${sessionScope.userSession.uphoto != null && sessionScope.userSession.uphoto != ''}">
                        <img src="${pageContext.request.contextPath }/upload/${sessionScope.userSession.uphoto}"
                             style="max-width:60px;float: right"/>
                    </c:if>
                </h4>
                <div class="shipping d-flex justify-content-between">
                    <div class="shipping-address">
                        <form id="ziliao" action="${pageContext.request.contextPath }/user/update" method="post">
                            <input type="hidden" name="id" id="id" placeholder="id"
                                   value="${sessionScope.userSession.id}">
                            <input type="hidden" name="uphoto" id="uphoto" placeholder="头像"
                                   value="${sessionScope.userSession.uphoto}">

                            <label for="username">用户名</label>
                            <input type="text" name="username" id="username" placeholder="用户名"
                                   value="${sessionScope.userSession.username}">

                            <label for="username">密码</label>
                            <input type="password" name="userpassword" id="userpassword" placeholder="密码"
                                   value="${sessionScope.userSession.userpassword}">

                            <label for="username">姓名</label>
                            <input type="text" name="uname" id="uname" placeholder="姓名"
                                   value="${sessionScope.userSession.uname}">

                            <label for="username">性别</label>
                            <input type="text" name="usex" id="usex" placeholder="性别"
                                   value="${sessionScope.userSession.usex}">

                            <label for="username">电话</label>
                            <input type="text" name="uphone" id="uphone" placeholder="电话"
                                   value="${sessionScope.userSession.uphone}">

                            <label for="username">地址</label>
                            <input type="text" name="uaddress" id="uaddress" placeholder="地址"
                                   value="${sessionScope.userSession.uaddress}">

                            <button type="submit">更新个人资料</button>
                        </form>
                        <button type="button" id="uphotoshow" onclick="uphotoshow()">上传新的头像</button>
                        <form id="touxiang" class="hidde" action="${pageContext.request.contextPath }/user/upload" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="id" id="id" placeholder="id"
                                   value="${sessionScope.userSession.id}">

                            <label for="photo">头像</label>
                            <input type="file" name="photo" id="photo">

                            <button type="submit">上传</button>
                        </form>
                        <button type="button" onclick="messageModalShow()">查看或咨询问题</button>
                    </div>
                </div>
                <%--<div class="checkout-btn">--%>
                <%--<a href="#" class="btn alazea-btn w-100">PROCEED TO CHECKOUT</a>--%>
                <%--</div>--%>
            </div>
        </div>

        <%-- 询问框 --%>
        <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <form action="${pageContext.request.contextPath }/message/add" method="post" class="forms-sample">
                    <div class="modal-content">
                        <div class="modal-header" style="padding-bottom: 0px">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" style="padding: 0px 15px">
                            <h4 class="headline">您的咨询</h4>
                            <div class="cart-area clearfix">
                                <div class="container">
                                    <div class="comment_area clearfix">
                                        <ol id="messageShow">
                                            <li class="single_comment_area">
                                                <div class="comment-wrapper d-flex">
                                                    <div class="comment-content">
                                                        <div class="d-flex align-items-center justify-content-between">
                                                            <h5>询问</h5>
                                                            <span class="comment-date" id="mutime">时间</span>
                                                        </div>
                                                        <p id="muquestion">问题</p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="single_comment_area">
                                                <div class="comment-wrapper d-flex">
                                                    <div class="comment-content">
                                                        <div class="d-flex align-items-center justify-content-between">
                                                            <h5>回复</h5>
                                                            <span class="comment-date" id="matime">时间</span>
                                                        </div>
                                                        <p id="maanswer">回答</p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li style="text-align: center;">
                                                ————————————————————
                                            </li>
                                        </ol>
                                        <div class="coupon-discount" style="float: right">
                                            <input type="hidden" name="muid" id="muid" placeholder="id"
                                                   value="${sessionScope.userSession.id}">
                                            <input type="text" class="form-control" style="width: 350px"
                                                   name="muquestion" id="muquestion" placeholder="输入你需要询问的内容">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer" style="padding-top: 0px">
                                <button type="button" class="btn btn-light" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-gradient-primary mr-2">询问</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <%-- 评价框 --%>
        <div class="modal fade" id="pingjiaModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <form action="${pageContext.request.contextPath }/comment/add" method="post" class="forms-sample">
                    <div class="modal-content">
                        <div class="modal-header" style="padding-bottom: 0px">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" style="padding: 0px 15px">
                            <div class="card-body" style="padding-bottom: 0px">
                                <h4 class="card-title">订单评价</h4>
                                <input type="hidden" class="form-control" name="cbid" id="cbid"
                                       style="width: 100px">
                                <div class="form-group row">
                                    <input type="text" class="form-control" id="ccontent" name="ccontent">
                                </div>
                            </div>
                            <div class="modal-footer" style="padding-top: 0px">
                                <button type="button" class="btn btn-light" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-gradient-primary mr-2">提交</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
<!-- ##### Cart Area End ##### -->

<%--<li class="single_comment_area"><div class="comment-wrapper d-flex"><div class="comment-content"><div class="d-flex align-items-center justify-content-between"><h5>询问</h5><span class="comment-date" id="mutime">时间</span></div><p id="muquestion">问题</p></div></div><li class="single_comment_area"><div class="comment-wrapper d-flex"><div class="comment-content"><div class="d-flex align-items-center justify-content-between"><h5>回复</h5><span class="comment-date" id="matime">时间</span></div><p id="maanswer">回答</p></div></div></li></li>--%>
















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
    function uphotoshow() {
        $("#uphotoshow").hide();
        $("#touxiang").show();
    }
    
    function mesShow() {
        var id2 = ${sessionScope.userSession.id};

        $.getJSON("${pageContext.request.contextPath }/message/getIndexMessageList?id=" + id2, function (data) {
            for (var i = 0; i < data.length; i++) {
                if (data[i].mstate == "询问") {
                    $("#messageShow").append("<li class='single_comment_area'><div class='comment-wrapper d-flex'><div class='comment-content'><div class='d-flex align-items-center justify-content-between'><h5>询问</h5><span class='comment-date' id='mutime'>"+data[i].mutime+"</span></div><p id='muquestion'>"+data[i].muquestion+"</p></div></div></li><li class='single_comment_area'><div class='comment-wrapper d-flex'><div class='comment-content'><div class='d-flex align-items-center justify-content-between'><h5 style='color: red'>管理员尚未回复！</h5></li>")
                } else if (data[i].mstate == "回复") {
                    $("#messageShow").append("<li class='single_comment_area'><div class='comment-wrapper d-flex'><div class='comment-content'><div class='d-flex align-items-center justify-content-between'><h5>询问</h5><span class='comment-date' id='mutime'>"+data[i].mutime+"</span></div><p id='muquestion'>"+data[i].muquestion+"</p></div></div></li><li class='single_comment_area'><div class='comment-wrapper d-flex'><div class='comment-content'><div class='d-flex align-items-center justify-content-between'><h5>回复</h5><span class='comment-date' id='matime'>"+data[i].matime+"</span></div><p id='maanswer'>"+data[i].maanswer+"</p></div></div></li>")
                }


            }
        });
    }

    function messageModalShow() {
        $("#messageModal").modal("show");
    }

    function gopingjia(id) {
        $("#pingjiaModal #cbid").val(id);
        $("#pingjiaModal").modal("show");
    }
</script>
</body>

</html>