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

    <script>
        function updateTotal() {
            let total = 0;
            document.querySelectorAll('.card-checkbox:checked').forEach(function (checkbox) {
                total += parseInt(checkbox.value);
            });
            document.getElementById('totalAmount').innerText = total;
        }

        function deleteCard(cardId) {
            if (confirm("정말로 삭제하겠습니까?")) {
                // 서버로 삭제 요청을 보내는 코드 필요
                alert("카드가 삭제되었습니다.");
            }
        }

        document.addEventListener("DOMContentLoaded", function() {
            const cards = document.querySelectorAll('.card');
            if (cards.length % 2 !== 0) { // 카드 개수가 홀수인 경우
                cards[cards.length - 1].classList.add('align-to-left'); // 마지막 카드에 클래스 추가
            }
        });
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
                        <img src="${card.img}" alt="템플릿">
                        <div class="card-overlay">
                            <p>${card.cardname}</p>
                            <p>${card.date}</p>
                        </div>
                        <button class="close-button" onclick="deleteCard(${card.id})">X</button>
                        <div class="card-content">
                            <p class="card-text">${card.receiver}님의 ${card.cardname}</p>
                            <input type="checkbox" class="card-checkbox" value="${card.price}" onclick="updateTotal()">
                        </div>
                    </div>
                </c:forEach>

                <%--                예시 카드 --%>
                <div class="card">
                    <img src="/resources/img/template/template01.png" alt="템플릿1">
                    <div class="card-overlay">
                        <p>카드 이름</p>
                        <p>2024.06.13</p>
                    </div>
                    <button class="close-button" onclick="deleteCard(${card.id})">X</button>
                    <div class="card-content">
                        <p class="card-text">홍길동님의 ${card.cardname}dddddd</p>
                        <input type="checkbox" class="card-checkbox" value="${card.price}" onclick="updateTotal()">
                    </div>
                </div>
                <div class="card">
                    <img src="/resources/img/template/template02.png" alt="템플릿2">
                    <div class="card-overlay">
                        <p>카드 이름2</p>
                        <p>2024.06.03</p>
                    </div>
                    <button class="close-button" onclick="deleteCard(${card.id})">X</button>
                    <div class="card-content">
                        <p class="card-text">${card.receiver}님의 ${card.cardname}</p>
                        <input type="checkbox" class="card-checkbox" value="${card.price}" onclick="updateTotal()">
                    </div>
                </div>
                <div class="card">
                    <img src="/resources/img/template/template03.png" alt="템플릿3">
                    <button class="close-button" onclick="deleteCard(${card.id})">X</button>
                    <div class="card-content">
                        <p class="card-text">${card.receiver}님의 ${card.cardname}</p>
                        <input type="checkbox" class="card-checkbox" value="${card.price}" onclick="updateTotal()">
                    </div>
                </div>
                <div class="card">
                    <img src="/resources/img/template/template01.png" alt="템플릿1">
                    <button class="close-button" onclick="deleteCard(${card.id})">X</button>
                    <div class="card-content">
                        <p class="card-text">${card.receiver}님의 ${card.cardname}ddddddddddddddddd</p>
                        <input type="checkbox" class="card-checkbox" value="${card.price}" onclick="updateTotal()">
                    </div>
                </div>

                <%--                <div class="card">--%>
                <%--                    <img src="/resources/img/cart/template02.png" alt="템플릿2">--%>
                <%--                    <button class="close-button" onclick="deleteCard(${card.id})">X</button>--%>
                <%--                    <div class="card-content">--%>
                <%--                        <p class="card-text">${card.receiver}님의 ${card.cardname}</p>--%>
                <%--                        <input type="checkbox" class="card-checkbox" value="${card.price}" onclick="updateTotal()">--%>
                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                <div class="card">--%>
                <%--                    <img src="/resources/img/cart/template03ex.png" alt="템플릿3">--%>
                <%--                    <button class="close-button" onclick="deleteCard(${card.id})">X</button>--%>
                <%--                    <div class="card-content">--%>
                <%--                        <p class="card-text">${card.receiver}님의 ${card.cardname}</p>--%>
                <%--                        <input type="checkbox" class="card-checkbox" value="${card.price}" onclick="updateTotal()">--%>
                <%--                    </div>--%>
                <%--                </div>--%>

            </div>
            <div class="cart-payment">
                <div class="cart-receipt">
                    <h1>선택 카드 목록</h1>
                    <hr>
                    <div class="cart-list">
                        <c:forEach var="i" begin="1" end="7" step="1">
                            <p><span>${i}번</span> <span style="float: right;">1,000${card.price}원</span></p>
                        </c:forEach>
                    </div>
                    <%--내용--%>
                    <%--                    <c:forEach var="card" begin="0" end="9" step="1" varStatus="a">--%>
                    <%--                        <p class="card-text">${card.receiver}님의 ${card.cardname}</p>1000원--%>
                    <%--                    </c:forEach>--%>
                    <hr>
                    <h2>합계 <span id="totalAmount" style="float: right;">1,000${card.price}원</span></h2>
                </div>
                <input type="button" value="결제하기" />
            </div>
        </div>
    </div>
    <div class="sticker2"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>
