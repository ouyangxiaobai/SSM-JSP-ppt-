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
                    <h4 class="card-title">宠舍表
                        <button type="button" class="btn btn-inverse-info btn-fw" onclick="add()"
                                style="padding: 5px 10px;min-width: 0px;font-size: 1px">增加
                        </button>
                    </h4>

                    <form id="sform" method="get" action="${pageContext.request.contextPath }/business/getBusinessList">
                        <input type="hidden" class="form-control" name="pageIndex" id="pageIndex"
                               value="1" style="width: 100px">
                        <input type="hidden" class="form-control" name="btype" id="btype"
                               value="宠舍类" style="width: 100px">
                        <select class="form-control" name="btroom" id="btroom"
                                style="color: black; width:25%;Float:left">
                            <option value="">所查询宠舍的类别</option>
                            <option value="小型">小型</option>
                            <option value="中型">中型</option>
                            <option value="大型">大型</option>
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
                                <th> 宠舍类别</th>
                                <th> 名称</th>
                                <th> 数量</th>
                                <th> 价格</th>
                                <th> 图片</th>
                                <th> 详情</th>
                                <th width="15%"> 操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="business" items="${pageInfo.list}" varStatus="status">
                                <tr>
                                    <td>${status.count}</td>
                                    <td>${business.id}</td>
                                    <td>${business.btroom}</td>
                                    <td>${business.bname}</td>
                                    <td>${business.bsize}</td>
                                    <td>${business.bprice}</td>
                                    <td><img src="${pageContext.request.contextPath }/upload/${business.bphoto}" style="max-width:60px;"/></td>
                                    <td>${business.bdetails}</td>
                                    <td>
                                        <button type="button" class="btn btn-outline-warning btn-icon-text"
                                                onclick="toupdate('${business.id}')"
                                                style="padding: 10px;border-radius: 10px">
                                            <i class="mdi mdi-upload btn-icon-prepend"></i>
                                            修改
                                        </button>
                                        <button type="button" class="btn btn-outline-danger btn-icon-text"
                                                onclick="todelete('${business.id}')"
                                                style="padding: 10px;border-radius: 10px">
                                            <i class="mdi mdi-alert btn-icon-prepend"></i>
                                            删除
                                        </button>
                                        <button type="button" class="btn btn-outline-info btn-icon-text"
                                                onclick="toupload('${business.id}')"
                                                style="padding: 10px;border-radius: 10px">
                                            <i class="mdi mdi-file-check btn-icon-append"></i>
                                            图片
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
            <form action="${pageContext.request.contextPath }/business/add" method="post" class="forms-sample" enctype="multipart/form-data">
                <div class="modal-content">
                    <div class="modal-header" style="padding-bottom: 0px">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 0px 15px">
                        <div class="card-body" style="padding-bottom: 0px">
                            <h4 class="card-title">新增一个宠舍</h4>

                            <div class="form-group row hidde">
                                <label for="btype" class="col-sm-3 col-form-label">业务类别</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="btype"
                                           value="宠舍类" name="btype">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="btroom" class="col-sm-3 col-form-label">宠舍类别</label>
                                <div class="col-sm-9">
                                    <select class="form-control" name="btroom" id="btroom"
                                            style="color: black">
                                        <option value="小型">小型</option>
                                        <option value="中型">中型</option>
                                        <option value="大型">大型</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="bname" class="col-sm-3 col-form-label">名称</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="bname"
                                           placeholder="名称" name="bname">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="bsize" class="col-sm-3 col-form-label">数量</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="bsize"
                                           placeholder="数量" name="bsize">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="bprice" class="col-sm-3 col-form-label">价格</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="bprice"
                                           placeholder="价格" name="bprice">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="bdetails" class="col-sm-3 col-form-label">详情</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="bdetails"
                                           placeholder="详情" name="bdetails">
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
            <form action="${pageContext.request.contextPath }/business/update" method="post" class="forms-sample">
                <div class="modal-content">
                    <div class="modal-header" style="padding-bottom: 0px">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 0px 15px">
                        <div class="card-body" style="padding-bottom: 0px">
                            <h4 class="card-title">修改宠舍资料</h4>
                            <input type="hidden" class="form-control" name="id" id="id" value="这里是id"
                                   style="width: 100px">
                            <input type="hidden" class="form-control" name="btype" id="btype" value="宠舍类"
                                   style="width: 100px">

                            <div class="form-group row">
                                <label for="bname" class="col-sm-3 col-form-label">名称</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="bname"  name="bname" >
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="bsize" class="col-sm-3 col-form-label">数量</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="bsize" name="bsize" >
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="bprice" class="col-sm-3 col-form-label">价格</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="bprice"  name="bprice" >
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="bdetails" class="col-sm-3 col-form-label">详情</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="bdetails"  name="bdetails" >
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
            <form action="${pageContext.request.contextPath }/business/delete" method="post" class="forms-sample">
                <div class="modal-content">
                    <div class="modal-header" style="padding-bottom: 0px">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 0px 15px">
                        确定删除该宠舍？
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

    <!--上传文件-->
    <div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <form action="${pageContext.request.contextPath }/business/upload" method="post" class="forms-sample"  enctype="multipart/form-data">
                <div class="modal-content">
                    <div class="modal-header" style="padding-bottom: 0px">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 0px 15px">
                        <input type="hidden" class="form-control" name="id" id="id" value="这里是id" style="width: 100px">
                        <div class="form-group row">
                            <label for="photo" class="col-sm-3 col-form-label">图片</label>
                            <div class="col-sm-9">
                                <input type="file" class="form-control" id="photo"  name="photo" >
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" style="padding-top: 0px">
                        <button type="button" class="btn btn-light" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-danger mr-2">上传</button>
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
        $.getJSON("${pageContext.request.contextPath }/business/toupdate/"+id, function (data) {
            $("#updateModal #id").val(id);
            $("#updateModal #btype").val(data.btype);
            $("#updateModal #btroom").val(data.btroom);
            $("#updateModal #bname").val(data.bname);
            $("#updateModal #bsize").val(data.bsize);
            $("#updateModal #bprice").val(data.bprice);
            $("#updateModal #bdetails").val(data.bdetails);
            $("#updateModal").modal("show");
        });
    }

    function todelete(id) {
        $("#deleteModal #id").val(id);
        $("#deleteModal").modal("show");
    }

    function toupload(id) {
        $("#uploadModal #id").val(id);
        $("#uploadModal").modal("show");
    }

    function goPage(page) {
        $("#pageIndex").val(page);
        $("#sform").submit();
    }
</script>
</body>

</html>
