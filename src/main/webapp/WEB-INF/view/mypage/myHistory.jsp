<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>마이페이지</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/mypage.css"/>
    <link rel="stylesheet" href="/resources/css/admin/admin.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

    <script>
        function cancelPayment(payID, payNo) {
            console.log("결제 번호 " + payNo + "가 취소되었습니다.");
            $.ajax({
                url: '/payments/cancel',
                data: {
                    payID: payID,
                    payNo: payNo
                },
                type: 'POST',
                async: false,
                dataType: 'text',
                success: function (res) {
                    console.log(res);
                    alert(res);
                    document.location.reload();
                },
                error: function (res, status, error) {
                    // console.error("AJAX: ", status, error);
                    alert("결제 취소 중 오류가 발생하였습니다. \n오류가 계속될 시 문의바랍니다.")
                }
            })
        }

        function submitPageForm(page) {
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = '/mypage/myHistory';
            form.style.display = "none";

            var pageInput = document.createElement("input");
            pageInput.type = "hidden";
            pageInput.name = "page";
            pageInput.value = page;
            form.appendChild(pageInput);

            var sizeInput = document.createElement("input");
            sizeInput.type = "hidden";
            sizeInput.name = "size";
            sizeInput.value = "3";
            form.appendChild(sizeInput);

            document.body.appendChild(form);
            form.submit();
        }
    </script>
</head>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main">
    <%@ page import="java.util.Date" %>
    <div class="sticker1"></div>
    <div style="width: 100%;">
        <div class="mypage-header">
            <img src="/resources/img/logo/logo_mypage.png">
            <hr>
        </div>
        <div class="mypage">
            <div class="mypage-wrap">
                <%@ include file="/WEB-INF/view/mypage/include/menu.jsp" %>
                <div class="mypage-content">

                    <c:if test="${paymentList}==null">
                        <div class="payment-null">
                            <p>결제 내역이 존재하지 않습니다.</p>
                        </div>
                    </c:if>

                    <div class="payment-list-wrap">
                        <c:forEach var="payment" items="${paymentList}">
                            <div class="payment-list">
                                <div class="payment-items">

                                    <c:forEach var="card" items="${cardList}">
                                        <c:if test="${card.payID == payment.payID}">
                                            <a href="#">
                                                <img src="${card.templateThumbnail}" class="payment-item-img">
                                            </a>
                                        </c:if>
                                    </c:forEach>

                                </div>

                                <div class="payment-info">
                                    <p>주문일자: <fmt:formatDate pattern="yyyy.MM.dd" value="${payment.payDate}"/></p>
                                    <p>금액: <fmt:formatNumber type="number" maxFractionDigits="3"
                                                             value="${payment.payAmount}"/>원</p><br>
                                    <c:if test="${payment.canceledAt != 0 && payment.canceledAt != null}">
                                        <p class="cancel-info">취소된 상품입니다.</p>
                                    </c:if>
                                    <c:if test="${payment.isWithinTwoDays == '1' && payment.canceledAt == 0}">
                                        <a href="#"
                                           onclick="cancelPayment('${payment.payID}', '${payment.payNo}');">취소</a>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>

                        <%-- 페이징 네비게이션 --%>
                        <nav aria-label="page-nav" class="pagination-nav payment-list-nav">
                            <ul class="pagination">
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="#" onclick="submitPageForm(${currentPage - 1})"
                                       tabindex="-1">Previous</a>
                                </li>

                                <c:set var="startPage" value="${currentPage - (currentPage mod 10) + 1}"/>
                                <c:set var="endPage"
                                       value="${startPage + 9 <= totalPages ? startPage + 9 : totalPages}"/>
                                <script>
                                    console.log(${startPage});
                                    console.log(${endPage});
                                </script>

                                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <a class="page-link" href="#" onclick="submitPageForm(${i})">${i}</a>
                                    </li>
                                </c:forEach>

                                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                    <a class="page-link" href="#" onclick="submitPageForm(${currentPage +1})">Next</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="sticker2"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>

