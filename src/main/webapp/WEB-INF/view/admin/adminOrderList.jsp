<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <meta charset="utf-8">
    <title>Admin 축하해요</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">

    <link href="/resources/css/admin/all.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <link href="/resources/css/admin/admin.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>
<body id="page-top">
<main class="main">
    <div id="wrapper">
        <%@ include file="/WEB-INF/view/include/adminSidebar.jsp" %>
        <script>
            document.getElementById("orderList").className = 'nav-item active';
        </script>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <%@ include file="/WEB-INF/view/include/adminTopbar.jsp" %>

            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <!-- <h1 class="h3 mb-2 text-gray-800"> 주문목록</h1> -->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">주문목록</h6>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable">
                                    <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>결제ID</th>
                                        <th>결제금액(원)</th>
                                        <th>주문자명</th>
                                        <th>주문자 이메일</th>
                                        <th>주문일자</th>
                                        <th>주문상태</th>
<%--                                        <th>영수증 URL</th>--%>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="payment" items="${payments}">
                                        <tr>
                                            <td>${payment.payID}</td>
                                            <td>${payment.merchantUid}</td>
                                            <td>
                                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${payment.payAmount}"/>
                                            </td>
                                            <td>${payment.buyerName}</td>
                                            <td>${payment.buyerEmail}</td>
                                            <td>
                                                <fmt:formatDate pattern="yyyy.MM.dd" value="${payment.payDate}"/>
                                            </td>
                                            <c:if test="${payment.canceledAt == 0}">
                                                <td>결제 완료</td>
                                            </c:if>
                                            <c:if test="${payment.canceledAt != 0}">
                                                <td class="canceled-payment">취소 결제</td>
                                            </c:if>
<%--                                            <td>${payment.receiptURL}</td>--%>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <nav aria-label="page-nav" class="pagination-nav">
                            <ul class="pagination">
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="?page=${currentPage - 1}&size=${pageSize}" tabindex="-1">Previous</a>
                                </li>
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <a class="page-link" href="?page=${i}&size=${pageSize}">${i}</a>
                                    </li>
                                </c:forEach>
                                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                    <a class="page-link" href="?page=${currentPage + 1}&size=${pageSize}">Next</a>
                                </li>
                            </ul>
                        </nav>


                    </div>

                </div>
<%--                <!-- /.container-fluid -->--%>

            </div>
            <!-- End of Main Content -->

            <%@ include file="/WEB-INF/view/include/adminFooter.jsp" %>

        </div>
    </div>
    <!-- End of Content Wrapper -->

    <%@ include file="/WEB-INF/view/include/adminLogoutModal.jsp" %>

</main>

<!-- Bootstrap core JavaScript-->
<script src="/resources/js/admin/jquery.js"></script>
<script src="/resources/js/admin/bootstrap.js"></script>

<!-- Core plugin JavaScript-->
<%--<script src="/resources/js/admin/easing.js"></script>--%>

<!-- Custom scripts for all pages-->
<script src="/resources/js/admin/admin.js"></script>

<!-- Page level plugins -->
<script src="/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="/js/demo/chart-area-demo.js"></script>
<script src="/js/demo/chart-pie-demo.js"></script>
<script src="/js/demo/chart-bar-demo.js"></script>
</body>
</html>