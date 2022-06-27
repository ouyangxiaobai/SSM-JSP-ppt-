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
                    <h4 class="card-title">新闻表
                        <button type="button" class="btn btn-inverse-info btn-fw" onclick="add()"
                                style="padding: 5px 10px;min-width: 0px;font-size: 1px">增加
                        </button>
                    </h4>

                    <form id="sform" method="get" action="${pageContext.request.contextPath }/news/getNewsList">
                        <input type="hidden" class="form-control" name="pageIndex" id="pageIndex"
                               value="1" style="width: 100px">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th> #</th>
                                <th> ID</th>
                                <th> 标题</th>
                                <th> 内容</th>
                                <th> 时间</th>
                                <th width="15%"> 操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="news" items="${pageInfo.list}" varStatus="status">
                                <tr>
                                    <td>${status.count}</td>
                                    <td>${news.id}</td>
                                    <td>${news.ntitle}</td>
                                    <td>${news.ndetails}</td>
                                    <td>${news.ntime}</td>
                                    <td>
                                        <button type="button" class="btn btn-outline-warning btn-icon-text"
                                                onclick="toupdate('${news.id}')"
                                                style="padding: 10px;border-radius: 10px">
                                            <i class="mdi mdi-upload btn-icon-prepend"></i>
                                            修改
                                        </button>
                                        <button type="button" class="btn btn-outline-danger btn-icon-text"
                                                onclick="todelete('${news.id}')"
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
            <form action="${pageContext.request.contextPath }/news/add" method="post" class="forms-sample">
                <div class="modal-content">
                    <div class="modal-header" style="padding-bottom: 0px">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 0px 15px">
                        <div class="card-body" style="padding-bottom: 0px">
                            <h4 class="card-title">新增一个新闻</h4>

                            <div class="form-group row">
                                <label for="ntitle" class="col-sm-3 col-form-label">标题</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="ntitle"
                                           placeholder="标题" name="ntitle">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="ndetails" class="col-sm-3 col-form-label">内容</label>
                                <div class="col-sm-9">
                                    <textarea type="text" class="form-control" id="ndetails" placeholder="内容" name="ndetails" rows="4">
                                    </textarea>
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
            <form action="${pageContext.request.contextPath }/news/update" method="post" class="forms-sample">
                <div class="modal-content">
                    <div class="modal-header" style="padding-bottom: 0px">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 0px 15px">
                        <div class="card-body" style="padding-bottom: 0px">
                            <h4 class="card-title">修改新闻资料</h4>
                            <input type="hidden" class="form-control" name="id" id="id" value="这里是id"
                                   style="width: 100px">

                            <div class="form-group row">
                                <label for="ntitle" class="col-sm-3 col-form-label">标题</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="ntitle" name="ntitle" >
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="ndetails" class="col-sm-3 col-form-label">内容</label>
                                <div class="col-sm-9">
                                    <textarea type="text" class="form-control" id="ndetails" name="ndetails" rows="4">
                                    </textarea>
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
            <form action="${pageContext.request.contextPath }/news/delete" method="post" class="forms-sample">
                <div class="modal-content">
                    <div class="modal-header" style="padding-bottom: 0px">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 0px 15px">
                        确定删除该新闻？
                        <input type="hidden" class="form-control" name="id" id="id" value="这里是id" style="width: 100px">
                    </div>
                    <div class="modal-footer" style="padding-top: 0px">
                        <button type="button" class="btn btn-light" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-danger mr-2">删除</button>
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
        $("#addModal").modal("show");
    }

    function toupdate(id) {
        $.getJSON("${pageContext.request.contextPath }/news/toupdate/"+id, function (data) {
            $("#updateModal #id").val(id);
            $("#updateModal #ntitle").val(data.ntitle);
            $("#updateModal #ndetails").val(data.ndetails);
            $("#updateModal").modal("show");
        });
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
