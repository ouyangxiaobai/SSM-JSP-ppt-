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
            <h2>用户评论</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/qiantai/index.jsp"><i class="fa fa-home"></i> 首页</a></li>
                            <li class="breadcrumb-item active" aria-current="page">评论</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Blog Area Start ##### -->
    <section class="alazea-blog-area mb-100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-12">
                    <form id="sform" method="get" action="${pageContext.request.contextPath }/comment/getCommentList">
                        <input type="hidden" class="form-control" name="pageIndex" id="pageIndex"
                               value="1">

                        <div class="row">
                            <c:forEach var="comment" items="${pageInfo.list}" varStatus="status">
                                <!-- Single Blog Post Area -->
                                <div class="col-12 col-lg-4">
                                    <div class="single-blog-post mb-50">
                                        <div class="post-thumbnail mb-30">
                                            <a href="#"><img src="${pageContext.request.contextPath }/upload/${comment.cbphoto}" alt=""></a>
                                        </div>
                                        <div class="post-content">
                                            <a href="#" class="post-title">
                                                <h5>${comment.cbname}</h5>
                                            </a>
                                            <div class="post-meta">
                                                <a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i>${comment.ctime}</a>
                                                <a href="#"><i class="fa fa-user" aria-hidden="true"></i> ${comment.cuname}</a>
                                            </div>
                                            <p class="post-excerpt">${comment.ccontent}</p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="row">
                            <div class="col-12">
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
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Blog Area End ##### -->

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
    </script>
</body>

</html>