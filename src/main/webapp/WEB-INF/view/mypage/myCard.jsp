<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>마이페이지</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/mypage.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/mycard.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                        <c:forEach var="card" items="${cardList}">
                            <div class="card">
                                <a href="/card/completedCard/${card.cardID}">
                                    <div class="card-image">
                                        <img src="${card.templateThumbnail}" alt="Card Image">
                                        <div class="card-overlay">
                                            <p>${card.cardName}</p>
                                            <p>
                                                <c:choose>
                                                    <c:when test="${not empty card.cardEndDate}">
                                                        ${card.cardStartDate} - ${card.cardEndDate}
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${card.cardStartDate}
                                                    </c:otherwise>
                                                </c:choose>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="card-info">
                                        <div class="like">
                                            👍 Like ${card.cardLikeCnt}
                                        </div>
                                        <button class="button copy" onclick="copyUrl()">URL 복사</button>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>


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