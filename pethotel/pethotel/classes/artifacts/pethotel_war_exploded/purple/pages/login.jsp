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
  <link rel="stylesheet" href="${pageContext.request.contextPath }/purple/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/purple/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/purple/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath }/purple/images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth">
        <div class="row w-100">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left p-5">
              <div class="brand-logo">
                <%--<img src="${pageContext.request.contextPath }/purple/images/logo.svg">--%>
              </div>
              <h4>欢迎进入犬舍寄养平台管理台</h4>
              <h6 class="font-weight-light">请先登录</h6>
              <form class="pt-3" method="post" action="${pageContext.request.contextPath }/user/login">
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="username" name="username" placeholder="用户名">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="userpassword" name="userpassword" placeholder="密码">
                </div>
                <div class="form-group">
                  <input type="hidden" class="form-control form-control-lg" id="urole" name="urole" value="管理员">
                </div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg hidde" id="weizhi" name="weizhi" placeholder="位置" value="houtai" readonly>
                </div>
                <div class="mt-3">
                  <button type="submit" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">登录</button>
                  <a href="${pageContext.request.contextPath }/qiantai/index.jsp" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">首页</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="${pageContext.request.contextPath }/purple/vendors/js/vendor.bundle.base.js"></script>
  <script src="${pageContext.request.contextPath }/purple/vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="${pageContext.request.contextPath }/purple/js/off-canvas.js"></script>
  <script src="${pageContext.request.contextPath }/purple/js/misc.js"></script>
  <!-- endinject -->
</body>

</html>
