<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>나의 카드</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/mypage.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/mycard.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.8/clipboard.min.js"></script>

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
                            <div class="card" data-card-id="${card.cardID}">
                                <a href="#" class="card-link">
                                    <div class="card-image">
                                        <img src="${card.templateThumbnail}" alt="Card Image">
                                        <div class="card-overlay">
                                            <p>${card.cardName}</p>
                                            <p>
                                                <c:choose>
                                                    <c:when test="${not empty card.cardEndDate}">
                                                        ${card.cardStartDate}<br> - ${card.cardEndDate}
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${card.cardStartDate}
                                                    </c:otherwise>
                                                </c:choose>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                                <div class="card-info">
                                    <div class="like">
                                        👍 Like ${card.cardLikeCnt}
                                    </div>
                                    <button class="button copy-button" data-card-id="${card.cardID}" data-clipboard-text="">
                                        URL 복사
                                    </button>
                                </div>
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
<script>
    $(document).ready(function() {
        $('.card').each(function() {
            const cardElement = $(this);
            const cardId = cardElement.data('card-id');
            getShortUrl(cardId, function(shortUrl) {
                cardElement.find('.card-link').attr('href', shortUrl);
                cardElement.find('.copy-button').attr('data-clipboard-text', shortUrl);
            });
        });

        // Clipboard.js 초기화
        new ClipboardJS('.copy-button').on('success', function(e) {
            console.log(e.text);
            alert('URL이 복사되었습니다.');
        }).on('error', function(e) {
            console.error('URL 복사 실패: ', e);
            alert('URL 복사에 실패했습니다.');
        });
    });

    function getShortUrl(cardId, callback) {
        $.ajax({
            url: '/url/shorts',
            type: 'GET',
            data: {cardID: cardId},
            success: function(shortUrl) {
                callback(shortUrl);
            },
            error: function(err) {
                console.error('짧은 URL 가져오기 실패: ', err);
                alert('짧은 URL 가져오기에 실패했습니다.');
            }
        });
    }
</script>
</body>
</html>
