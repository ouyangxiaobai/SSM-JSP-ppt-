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
              <h4>新来的？</h4>
              <h6 class="font-weight-light">注册很简单，只需要短短的几步</h6>
              <form class="pt-3" action="${pageContext.request.contextPath }/user_reg" method="post">
                <div class="form-group" style="display: none">
                  <input type="text" class="form-control form-control-lg" id="role" name="role" value="员工">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="username" name="username" placeholder="用户名">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="password" name="password" placeholder="密码">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="name" name="name" placeholder="姓名">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="sex" name="sex" placeholder="性别">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="phone" name="phone" placeholder="电话">
                </div>
                <div class="form-group">
                  <select class="form-control form-control-lg" id="exampleFormControlSelect1" name="depname" id="depname"  style="color: black">
                    <option disabled selected hidden>请选择您的部门</option>
                  </select>
                </div>
                <div class="mt-3">
                  <button type="submit" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">
                    确认注册
                  </button>
                </div>
                <div class="text-center mt-4 font-weight-light">
                  已经拥有账号？ <a href="${pageContext.request.contextPath }/purple/pages/login.jsp" class="text-primary">去登陆</a>
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


  <script>
      $(function(){
          $.getJSON("${pageContext.request.contextPath }/department_JsonList", function (data) {
              for (var i = 0; i < data.length; i++) {
                  $("#exampleFormControlSelect1").append("<option value=" + data[i].depname + ">" + data[i].depname + "</option>")
              }
          });
      });
  </script>
</body>

</html>
