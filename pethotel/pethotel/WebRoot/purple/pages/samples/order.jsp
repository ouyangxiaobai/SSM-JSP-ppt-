<%@ page import="cn.util.Const" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>犬舍寄养平台</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/purple/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/purple/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/purple/css/style.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/purple/images/favicon.png"/>

    <style>
        tr {
            text-align: center;
        }

        tbody tr:nth-child(1) {
            background-color: #bfdef7;
        }

        tbody tr:nth-child(2) {
            background-color: #fff0a4;
        }

        tbody tr:nth-child(3) {
            background-color: #ffdae2;
        }

        tbody tr:nth-child(4) {
            background-color: #bff2ea;
        }

        tbody tr:nth-child(5) {
            background-color: #ebd6ff;
        }
    </style>

</head>

<body>
<%--top--%>
<%@include file="../top.jsp" %>
<%--top--%>

<!-- 中间 partial -->
<div class="main-panel">
    <div class="content-wrapper">
        <div class="col-lg-12 stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">订单表
                        <%--<button type="button" class="btn btn-inverse-info btn-fw" onclick="add()"--%>
                                <%--style="padding: 5px 10px;min-width: 0px;font-size: 1px">增加--%>
                        <%--</button>--%>
                    </h4>

                    <form id="sform" method="get" action="${pageContext.request.contextPath }/order/getOrderOuidList">
                        <input type="hidden" class="form-control" name="pageIndex" id="pageIndex"
                               value="1" style="width: 100px">
                        <input type="text" class="form-control" id="ouid"
                               placeholder="所查询订单的会员ID" name="ouid"
                               style="width: 25%;Float:left;margin-right: 25px">
                        <select class="form-control" name="otype" id="otype"
                                style="color: black;width: 25%;Float:left;height: 43px">
                            <option value="">所查询订单的类别</option>
                            <option value="宠舍类">宠舍类</option>
                            <option value="主粮类">主粮类</option>
                            <option value="零食类">零食类</option>
                            <option value="服务类">服务类</option>
                        </select>
                        <button type="submit" class="btn btn-inverse-info btn-fw"
                                style="Float:right;padding: 13px 20px;min-width: 0px;font-size: 1rem">
                            搜索
                        </button>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th> #</th>
                                <th> ID</th>
                                <th> 会员ID</th>
                                <th> 订单类别</th>
                                <th> 下单日期</th>
                                <th> 订单价格</th>
                                <th> 订单备注</th>
                                <th> 订单状态</th>
                                <th> 完成日期</th>
                                <th width="15%"> 操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="order" items="${pageInfo.list}" varStatus="status">
                                <tr>
                                    <td></td>
                                    <td>${order.id}</td>
                                    <td>${order.ouid}</td>
                                    <td>${order.otype}</td>
                                    <td>${order.octime}</td>
                                    <td>${order.oprice}</td>
                                    <td>${order.onote}</td>
                                    <td>${order.ostate}</td>
                                    <td>${order.oftime}</td>
                                    <td>
                                        <c:if test="${order.ostate == '未发货'}">
                                            <button type="button" class="btn btn-outline-warning btn-icon-text"
                                                    onclick="godelivery('${order.id}')"
                                                    style="padding: 10px;border-radius: 10px">
                                                <i class="mdi mdi-upload btn-icon-prepend"></i>
                                                发货
                                            </button>
                                        </c:if>
                                        <c:if test="${order.ostate == '未完成'}">
                                            <button type="button" class="btn btn-outline-warning btn-icon-text"
                                                    onclick="gocomplete('${order.id}')"
                                                    style="padding: 10px;border-radius: 10px">
                                                <i class="mdi mdi-upload btn-icon-prepend"></i>
                                                完成
                                            </button>
                                        </c:if>
                                        <button type="button" class="btn btn-outline-danger btn-icon-text"
                                                onclick="todelete('${order.id}')"
                                                style="padding: 10px;border-radius: 10px">
                                            <i class="mdi mdi-alert btn-icon-prepend"></i>
                                            删除
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </form>

                    <div class="btn-group " role="group" aria-label="Basic example" style="float: left">
                        <ul style="padding-left: 0px">
                            <li class="btn btn-link btn-fw" style="padding: 5px 10px;min-width: 0px;font-size: 1px">
                                第${pageInfo.pageNum}页
                            </li>
                        </ul>
                    </div>
                    <div class="btn-group " role="group" aria-label="Basic example" style="float: right">
                        <ul>
                            <c:if test="${pageInfo.pageNum != 1}">
                                <li class="btn btn-primary" style="padding: 5px 10px;min-width: 0px;font-size: 1px;">
                                    <a href="javascript:goPage('1')"
                                       style="color: white">首页</a>
                                </li>
                                <li class="btn btn-primary" style="padding: 5px 10px;min-width: 0px;font-size: 1px">
                                    <a href="javascript:goPage('${pageInfo.prePage}')"
                                       style="color: white">上一页</a>
                                </li>
                            </c:if>
                            <c:if test="${pageInfo.pageNum != pageInfo.pages}">
                                <li class="btn btn-primary" style="padding: 5px 10px;min-width: 0px;font-size: 1px">
                                    <a href="javascript:goPage('${pageInfo.nextPage}')"
                                       style="color: white">下一页</a>
                                </li>
                                <li class="btn btn-primary" style="padding: 5px 10px;min-width: 0px;font-size: 1px">
                                    <a href="javascript:goPage('${pageInfo.pages}')"
                                       style="color: white">末页</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>

    <!-- 模态框 -->
    <!-- 新增 -->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <form action="${pageContext.request.contextPath }/order/add" method="post" class="forms-sample">
                <div class="modal-content">
                    <div class="modal-header" style="padding-bottom: 0px">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 0px 15px">
                        <div class="card-body" style="padding-bottom: 0px">
                            <h4 class="card-title">新增一个订单</h4>

                            <div class="form-group row">
                                <label for="ouid" class="col-sm-3 col-form-label">会员ID</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="ouid"
                                           placeholder="会员ID" name="ouid">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="otype" class="col-sm-3 col-form-label">订单类别</label>
                                <div class="col-sm-9">
                                    <select class="form-control" name="otype" id="otype"
                                            style="color: black">
                                        <option value="宠舍类">宠舍类</option>
                                        <option value="主粮类">主粮类</option>
                                        <option value="零食类">零食类</option>
                                        <option value="服务类">服务类</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="oprice" class="col-sm-3 col-form-label">订单价格</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="oprice"
                                           placeholder="订单价格" name="oprice">
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="onote" class="col-sm-3 col-form-label">订单备注</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="onote"
                                           placeholder="订单备注" name="onote">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer" style="padding-top: 0px">
                        <button type="button" class="btn btn-light" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-gradient-primary mr-2">提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!--修改-->
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <form action="${pageContext.request.contextPath }/order/update" method="post" class="forms-sample">
                <div class="modal-content">
                    <div class="modal-header" style="padding-bottom: 0px">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 0px 15px">
                        <div class="card-body" style="padding-bottom: 0px">
                            <h4 class="card-title">修改订单资料</h4>
                            <input type="hidden" class="form-control" name="id" id="id" value="这里是id"
                                   style="width: 100px">

                            <div class="form-group row">
                                <label for="ouid" class="col-sm-3 col-form-label">会员ID</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="ouid" name="ouid" >
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="otype" class="col-sm-3 col-form-label">订单类别</label>
                                <div class="col-sm-9">
                                    <select class="form-control" id="exampleFormControlSelect1" name="otype" id="otype"
                                            style="color: black">
                                        <option value="宠舍类">宠舍类</option>
                                        <option value="主粮类">主粮类</option>
                                        <option value="零食类">零食类</option>
                                        <option value="服务类">服务类</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="oprice" class="col-sm-3 col-form-label">订单价格</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="oprice"  name="oprice" >
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="onote" class="col-sm-3 col-form-label">订单备注</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="onote" name="onote">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer" style="padding-top: 0px">
                        <button type="button" class="btn btn-light" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-gradient-primary mr-2">保存</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!--删除-->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <form action="${pageContext.request.contextPath }/order/deleted" method="post" class="forms-sample">
                <div class="modal-content">
                    <div class="modal-header" style="padding-bottom: 0px">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 0px 15px">
                        <div class="card-body" style="padding-bottom: 0px">
                            <h4 class="card-title">确定删除该订单？</h4>
                            <input type="hidden" class="form-control" name="id" id="id" value="这里是id"
                                   style="width: 100px">
                        </div>
                    </div>
                    <div class="modal-footer" style="padding-top: 0px">
                        <button type="button" class="btn btn-light" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-danger mr-2">删除</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!--发货-->
    <div class="modal fade" id="deliveryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <form action="${pageContext.request.contextPath }/order/doupdate" method="post" class="forms-sample">
                <div class="modal-content">
                    <div class="modal-header" style="padding-bottom: 0px">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 0px 15px">
                        <div class="card-body" style="padding-bottom: 0px">
                            <h4 class="card-title">请输入快递单号</h4>
                            <input type="hidden" class="form-control" name="id" id="id" value="这里是id"
                                   style="width: 100px">
                            <div class="form-group row">
                                <label for="onote" class="col-sm-3 col-form-label">快递单号</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="onote" name="onote">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" style="padding-top: 0px">
                        <button type="button" class="btn btn-light" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-danger mr-2">提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!--完成-->
    <div class="modal fade" id="completeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <form action="${pageContext.request.contextPath }/order/doupdate" method="post" class="forms-sample">
                <div class="modal-content">
                    <div class="modal-header" style="padding-bottom: 0px">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 0px 15px">
                        <div class="card-body" style="padding-bottom: 0px">
                            <h4 class="card-title">确定已完成该订单？</h4>
                            <input type="hidden" class="form-control" name="id" id="id" value="这里是id"
                                   style="width: 100px">
                        </div>
                    </div>
                    <div class="modal-footer" style="padding-top: 0px">
                        <button type="button" class="btn btn-light" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-danger mr-2">确定</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- 中间 content-wrapper ends -->


    <!-- partial:../../partials/_footer.jsp -->
    <footer class="footer">
        <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2022. </span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">名称
              <i class="mdi mdi-heart text-danger"></i> - 犬舍寄养系统 </span>
        </div>
    </footer>
    <!-- partial -->
</div>
<!-- main-panel ends -->
</div>
<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="${pageContext.request.contextPath }/purple/vendors/js/vendor.bundle.base.js"></script>
<script src="${pageContext.request.contextPath }/purple/vendors/js/vendor.bundle.addons.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="${pageContext.request.contextPath }/purple/js/off-canvas.js"></script>
<script src="${pageContext.request.contextPath }/purple/js/misc.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<!-- End custom js for this page-->
<script>
    function add() {
        $("#addModal #otime").val("");
        $("#addModal").modal("show");
    }

    function toupdate(id) {
        $.getJSON("${pageContext.request.contextPath }/order/toupdate", {"id": id}, function (data) {
            $("#updateModal #id").val(id);
            $("#updateModal #ouid").val(data.ouid);
            $("#updateModal #otype").val(data.otype);
            $("#updateModal #oprice").val(data.oprice);
            $("#updateModal #onote").val(data.onote);
            $("#updateModal").modal("show");
        });
    }

    function godelivery(id) {
        $("#deliveryModal #id").val(id);
        $("#deliveryModal").modal("show");
    }

    function gocomplete(id) {
        $("#completeModal #id").val(id);
        $("#completeModal").modal("show");
    }

    function todelete(id) {
        $("#deleteModal #id").val(id);
        $("#deleteModal").modal("show");
    }

    function goPage(page) {
        $("#pageIndex").val(page);
        $("#sform").submit();
    }
</script>
</body>

</html>
