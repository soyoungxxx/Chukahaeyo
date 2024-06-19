<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/cart.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="/resources/js/card/cart.js"></script>
</head>

<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main" style="height: 95%">
    <div class="sticker1"></div>
    <div style="width: 100%;">
        <img src="/resources/img/logo/cart_logo.png" alt="장바구니 logo" class="cart-logo">
        <div class="container">
            <div class="cart-grid">
                <c:forEach var="card" items="${cardList}">
                    <div class="card" data-id="${card.cardID}">
                        <img src="${card.templateThumbnail}" alt="템플릿">
                        <div class="card-overlay">
                            <p>${card.cardName}</p>
                            <p>${card.cardStartDate}</p>
                        </div>
                        <button class="close-button" onclick="deleteCard(${card.cardID}, event)">X</button>
                        <div class="card-content">
                            <p class="card-text">${card.cardName}</p>
                            <input type="checkbox" class="card-checkbox" value="${card.cardPrice}"
                                   onclick="event.stopPropagation(); updateTotal(); updateReceipt();">
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="cart-payment">
                <div class="cart-receipt">
                    <h1>선택 카드 목록</h1>
                    <hr>
                    <div class="cart-list"></div>
                    <hr>
                    <h2>합계 <span id="totalAmount" style="float: right;">0원</span></h2>
                </div>
                <input type="button" value="결제하기" onclick="proceedToPayment()">
            </div>
        </div>
    </div>
    <div class="sticker2"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>
