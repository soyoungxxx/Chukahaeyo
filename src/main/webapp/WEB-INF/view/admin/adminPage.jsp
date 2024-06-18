<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>Admin 축하해요</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/admin.css"/>
</head>
<body>
<main class="main">
    <div style="width: 100%;">
        <div class="admin-header">
            <a href="/admin/adminPage" class="logo">관리자페이지</a>
            <a href="/logout" class="logout">로그아웃</a>
        </div>
        <hr>
        <div class="admin">
            <div class="admin-wrap">
                <div class="menu">
                    <div class="admin-menu">
                        <ul>
                            <li id="orderList">주문 목록</li>
                            <li id="inquiryList">1:1 문의 관리</li>
                        </ul>
                    </div>
                </div>
                <div class="v-line"></div>

                <div class="admin-content">
                    <div>전체 달성 금액: </div>
                    <c:forEach var="payment" items="${paymentList}">
                        <div class="payment-list">
                            <div class="payment-item">
                                <a href="#">
                                    <img src="" class="payment-item-img">
                                </a>
                            </div>

                            <div class="payment-info">
                                <p>결제 번호: ${payment.merchantUid}</p>
                                    <%--                           ㄴ 가맹점 번호--%>
                                <p>주문자 이메일: ${payment.memberID}</p>
                                <p>주문일자: <fmt:formatDate pattern="yyyy.MM.dd" value="${payment.payDate}"/></p>
                                <p>금액: <fmt:formatNumber type="number" maxFractionDigits="3"
                                                         value="${payment.payAmount}"/>원</p><br>
                                <a href="#">상세 보기</a>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>