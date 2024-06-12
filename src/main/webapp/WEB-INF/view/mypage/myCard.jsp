<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>마이페이지</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/img/common.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/mypage.css"/>
<%--    <link rel="stylesheet" href="/resources/css/cart.css"/>--%>
    <link rel="stylesheet" href="/resources/css/mypage/mycard.css"/>
</head>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main" style="margin-bottom: -150px">
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
                    <div class="card-grid">
                        <%--                        <c:forEach var="card" items="${cardList}">--%>
                        <%--                            <div class="card">--%>
                        <%--                                <img src="${card.img}" alt="템플릿">--%>
                        <%--                                <div class="card-overlay">--%>
                        <%--                                    <p>${card.cardname}</p>--%>
                        <%--                                    <p>${card.date}</p>--%>
                        <%--                                </div>--%>
                        <%--                                <button class="close-button" onclick="deleteCard(${card.id})">X</button>--%>
                        <%--                                <div class="card-content">--%>
                        <%--                                    <p class="card-text">${card.cardReceiver}님의 ${card.cardname}</p>--%>
                        <%--                                    <input type="checkbox" class="card-checkbox" value="${card.price}"--%>
                        <%--                                           onclick="updateTotal()">--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </c:forEach>--%>

                        <%--                예시 카드 --%>
                        <div class="card">
                            <img src="/resources/img/template/templateGreen.png" alt="템플릿1">
                            <div class="card-overlay">
                                <p>카드 이름</p>
                                <p>2024.06.13</p>
                            </div>
                        </div>
                        <div class="card">
                            <img src="/resources/img/template/templateNavy.png" alt="템플릿2">
                            <div class="card-overlay">
                                <p>카드 이름2</p>
                                <p>2024.06.03</p>
                            </div>
                        </div>
                        <div class="card">
                            <img src="/resources/img/template/templateBaseBall.png" alt="템플릿3">
                        </div>

                        <div class="card">
                            <img src="/resources/img/template/templateGreen.png" alt="템플릿1">
                            <div class="card-overlay">
                                <p>카드 이름</p>
                                <p>2024.06.13</p>
                            </div>
                        </div>
                        <div class="card">
                            <img src="/resources/img/template/templateNavy.png" alt="템플릿2">
                            <div class="card-overlay">
                                <p>카드 이름2</p>
                                <p>2024.06.03</p>
                            </div>
                        </div>
                        <div class="card">
                            <img src="/resources/img/template/templateBaseBall.png" alt="템플릿3">
                        </div>
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