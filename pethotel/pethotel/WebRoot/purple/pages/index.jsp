<%@ page import="cn.util.Const" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>犬舍寄养平台</title>
    <!-- plugins:css -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/purple/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/purple/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- inject:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/purple/css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/purple/images/favicon.png"/>
    <script>

    </script>
</head>
<body>
<%--top--%>
<%@include file="top.jsp" %>
<%--top--%>
<!-- partial -->
<div class="main-panel">
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">
              <span class="page-title-icon bg-gradient-primary text-white mr-2">
                <i class="mdi mdi-home"></i>
              </span>
                主页
            </h3>
        </div>
        <div class="row" style="clear: both">
            <div class="col-md-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">您的主页</h4>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>任务Id</th>
                                    <th>任务名称</th>
                                    <th>任务内容</th>
                                    <th>任务规划</th>
                                    <th>
                                        <s:if test="#session.user.role=='员工'">
                                            领导回复
                                        </s:if>
                                        <s:else>
                                            员工建议
                                        </s:else>
                                    </th>
                                    <th>查看详情</th>
                                </tr>
                                </thead>
                                <tbody>
                                <s:iterator value="list" status="st">
                                    <tr>
                                        <td>
                                            ${user.id}
                                        </td>
                                        <td>
                                            <s:property value="misname"/>
                                        </td>
                                        <td>
                                            <s:property value="miscontent"/>
                                        </td>
                                        <td>
                                            <s:property value="misplan"/>
                                        </td>
                                        <td>
                                            <s:if test="#session.user.role=='员工'">
                                                <s:property value="reply"/>
                                            </s:if>
                                            <s:else>
                                                <s:property value="advice"/>
                                            </s:else>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-outline-warning btn-icon-text"
                                                    onclick="toupdate('${user.id}')"
                                                    style="padding: 10px;border-radius: 10px">
                                                <i class="mdi mdi-upload btn-icon-prepend"></i>
                                                查看
                                            </button>
                                        </td>
                                    </tr>
                                </s:iterator>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 模态框 -->
        <!-- 查看 -->
        <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <form action="${pageContext.request.contextPath }/mission_update" method="post" class="forms-sample">
                    <div class="modal-content">
                        <div class="modal-header" style="padding-bottom: 0px">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" style="padding: 0px 15px">
                            <div class="card-body" style="padding-bottom: 0px">
                                <h4 class="card-title">修改任务资料</h4>
                                <input type="hidden" class="form-control" name="id" id="id" value="这里是id"
                                       style="width: 100px">
                                <s:if test="#session.user.role=='领导'">
                                    <div class="form-group row">
                                        <label for="misname" class="col-sm-3 col-form-label">任务名</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="misname" name="misname" readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="miscontent" class="col-sm-3 col-form-label">内容</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="miscontent" name="miscontent" readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="misleader" class="col-sm-3 col-form-label">所属领导</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="misleader" name="misleader"
                                                   readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="misstaff" class="col-sm-3 col-form-label">所属员工</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="misstaff" name="misstaff"
                                                   readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="misplan" class="col-sm-3 col-form-label">任务计划</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="misplan" name="misplan"
                                                   readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="misone" class="col-sm-3 col-form-label">第一天进度</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="misone" name="misone"
                                                   readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="evaone" class="col-sm-3 col-form-label">第一天评价</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="evaone" name="evaone">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="mistwo" class="col-sm-3 col-form-label">第二天进度</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="mistwo" name="mistwo"
                                                   readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="evatwo" class="col-sm-3 col-form-label">第二天评价</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="evatwo" name="evatwo">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="misthree" class="col-sm-3 col-form-label">第三天进度</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="misthree" name="misthree"
                                                   readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="evathree" class="col-sm-3 col-form-label">第三天评价</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="evathree" name="evathree">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="misfour" class="col-sm-3 col-form-label">第四天进度</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="misfour" name="misfour"
                                                   readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="evafour" class="col-sm-3 col-form-label">第四天评价</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="evafour" name="evafour">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="misfire" class="col-sm-3 col-form-label">第五天进度</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="misfire" name="misfire"
                                                   readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="evafire" class="col-sm-3 col-form-label">第五天评价</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="evafire" name="evafire">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="advice" class="col-sm-3 col-form-label">员工建议</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="advice" name="advice"
                                                   readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="reply" class="col-sm-3 col-form-label">领导回复</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="reply" name="reply">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="pagewhe" class="col-sm-3 col-form-label"></label>
                                        <div class="col-sm-9">
                                            <input type="hidden" class="form-control" id="pagewhe" name="pagewhe" value="index">
                                        </div>
                                    </div>
                                </s:if>
                                <s:elseif test="#session.user.role=='员工'">
                                    <div class="form-group row">
                                        <label for="misname" class="col-sm-3 col-form-label">任务名</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="misname" name="misname" readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="miscontent" class="col-sm-3 col-form-label">内容</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="miscontent" name="miscontent" readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="misleader" class="col-sm-3 col-form-label">所属领导</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="misleader" name="misleader"
                                                   readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="misstaff" class="col-sm-3 col-form-label">所属员工</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="misstaff" name="misstaff"
                                                   readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="misplan" class="col-sm-3 col-form-label">任务计划</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="misplan" name="misplan">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="misone" class="col-sm-3 col-form-label">第一天进度</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="misone" name="misone">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="evaone" class="col-sm-3 col-form-label">第一天评价</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="evaone" name="evaone" readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="mistwo" class="col-sm-3 col-form-label">第二天进度</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="mistwo" name="mistwo">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="evatwo" class="col-sm-3 col-form-label">第二天评价</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="evatwo" name="evatwo" readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="misthree" class="col-sm-3 col-form-label">第三天进度</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="misthree" name="misthree">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="evathree" class="col-sm-3 col-form-label">第三天评价</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="evathree" name="evathree" readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="misfour" class="col-sm-3 col-form-label">第四天进度</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="misfour" name="misfour">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="evafour" class="col-sm-3 col-form-label">第四天评价</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="evafour" name="evafour" readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="misfire" class="col-sm-3 col-form-label">第五天进度</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="misfire" name="misfire">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="evafire" class="col-sm-3 col-form-label">第五天评价</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="evafire" name="evafire" readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="advice" class="col-sm-3 col-form-label">员工建议</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="advice" name="advice">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="reply" class="col-sm-3 col-form-label">领导回复</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="reply" name="reply" readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="pagewhe" class="col-sm-3 col-form-label"></label>
                                        <div class="col-sm-9">
                                            <input type="hidden" class="form-control" id="pagewhe" name="pagewhe" value="index">
                                        </div>
                                    </div>
                                </s:elseif>
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
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
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
<script src="${pageContext.request.contextPath }/purple/js/dashboard.js"></script>
<!-- End custom js for this page-->
</body>
<script>
    function add() {
        $.getJSON("${pageContext.request.contextPath }/tratype_JsonList", function (data) {
            for (var i = 0; i < data.length; i++) {
                $("#addModal #exampleFormControlSelect1").append("<option value=" + data[i].id + ">" + data[i].type + "</option>")
            }
            $("#addModal").modal("show");
        });
    }

    function toupdate(id) {
        $.getJSON("${pageContext.request.contextPath }/mission_toupdate", {"id": id}, function (data) {
            $("#updateModal #id").val(id);
            $("#updateModal #misname").val(data.misname);
            $("#updateModal #miscontent").val(data.miscontent);
            $("#updateModal #misleader").val(data.misleader);
            $("#updateModal #misstaff").val(data.misstaff);
            $("#updateModal #misplan").val(data.misplan);
            $("#updateModal #misone").val(data.misone);
            $("#updateModal #evaone").val(data.evaone);
            $("#updateModal #mistwo").val(data.mistwo);
            $("#updateModal #evatwo").val(data.evatwo);
            $("#updateModal #misthree").val(data.misthree);
            $("#updateModal #evathree").val(data.evathree);
            $("#updateModal #misfour").val(data.misfour);
            $("#updateModal #evafour").val(data.evafour);
            $("#updateModal #misfire").val(data.misfire);
            $("#updateModal #evafire").val(data.evafire);
            $("#updateModal #advice").val(data.advice);
            $("#updateModal #reply").val(data.reply);
            $("#updateModal").modal("show");
        });
    }
</script>
</html>
