<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/common.css"/>
    <link rel="stylesheet" href="/resources/css/cart.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function updateTotal() {
            let total = 0;
            document.querySelectorAll('.card-checkbox:checked').forEach(function (checkbox) {
                total += parseInt(checkbox.value);
            });
            document.getElementById('totalAmount').innerText = total.toLocaleString() + '원';
        }

        function deleteCard(cardId, event) {
            if (confirm("정말로 삭제하겠습니까?")) {
                $.ajax({
                    url: '/deleteCard',
                    type: 'POST',
                    data: {cardId: cardId},
                    success: function(response) {
                        if(response.status === 'success') {
                            alert("카드가 삭제되었습니다.");
                            $(event.target).closest('.card').remove(); // Remove card from DOM
                            updateTotal(); // Recalculate total after deletion
                        } else {
                            alert("삭제 실패: " + response.message);
                        }
                    }
                });
            }
        }

        document.addEventListener("DOMContentLoaded", function() {
            const cards = document.querySelectorAll('.card');
            if (cards.length % 2 !== 0) {
                cards[cards.length - 1].classList.add('align-to-left'); // 마지막 카드에 클래스 추가
            }
        });

        function proceedToPayment() {
            if (confirm("결제하시겠습니까?")) {
                // 여기에 결제 로직 추가
                alert("결제가 완료되었습니다.");
            }
        }
    </script>
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
                    <div class="card">
                        <img src="${card.templateThumbnail}" alt="템플릿">
                        <div class="card-overlay">
                            <p>${card.cardName}</p>
                            <p>${card.cardStartDate}</p>
                        </div>
                        <button class="close-button" onclick="deleteCard(${card.cardId}, event)">X</button>
                        <div class="card-content">
                            <p class="card-text">${card.cardReceiver}님의 ${card.cardName}</p>
                            <input type="checkbox" class="card-checkbox" value="${card.cardPrice}" onclick="updateTotal()">
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="cart-payment">
                <div class="cart-receipt">
                    <h1>선택 카드 목록</h1>
                    <hr>
                    <div class="cart-list">
                        <c:forEach var="card" items="${cardList}" varStatus="status">
                            <p><span>${status.index + 1}번</span> <span style="float: right;">${card.cardPrice}원</span></p>
                        </c:forEach>
                    </div>
                    <hr>
                    <h2>합계 <span id="totalAmount" style="float: right;">0${card.cardPrice}원</span></h2>
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
