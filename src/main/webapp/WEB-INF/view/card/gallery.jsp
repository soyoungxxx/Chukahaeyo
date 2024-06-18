<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>명예의 전당</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/gallery.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const sortOrderRadios = document.getElementsByName('sortOrder');
            const categorySelect = document.getElementById('category');
            const cards = document.querySelectorAll('.card');

            sortOrderRadios.forEach(radio => {
                radio.addEventListener('change', filterAndSortCards);
            });

            categorySelect.addEventListener('change', filterAndSortCards);

            function filterAndSortCards() {
                const sortOrder = document.querySelector('input[name="sortOrder"]:checked').value;
                const selectedCategory = categorySelect.value;
                let sortedCards = Array.from(cards);

                if (sortOrder === 'latest') {
                    sortedCards.sort((a, b) => new Date(a.dataset.date) - new Date(b.dataset.date));
                } else if (sortOrder === 'popular') {
                    sortedCards.sort((a, b) => b.dataset.likes - a.dataset.likes);
                }

                sortedCards.forEach(card => {
                    if (selectedCategory === "all" || card.dataset.category == selectedCategory) {
                        card.style.display = "block";
                    } else {
                        card.style.display = "none";
                    }
                });

                const gallery = document.querySelector('.card-gallery');
                gallery.innerHTML = "";
                sortedCards.forEach(card => gallery.appendChild(card));
            }
            filterAndSortCards();
        });
    </script>
</head>

<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main" style="height: 95%">
    <div class="sticker1"></div>
    <div style="width: 100%;">
        <div class="top-bar">
            <img src="/resources/img/logo/gallery_logo.png" alt="갤러리 로고" class="gallery-logo">
            <div class="filters">
                <div class="select-wrapper">
                    <select id="category">
                        <option value="all">카테고리 선택</option>
                        <option value="1">카테고리 1</option>
                        <option value="2">카테고리 2</option>
                        <option value="3">카테고리 3</option>
                    </select>
                </div>
                <div class="category-wrapper">
                    <input type="radio" id="popular" name="sortOrder" value="popular" checked> 인기순
                    <input type="radio" id="latest" name="sortOrder" value="latest"> 최신순
                </div>
            </div>
        </div>

        <div class="card-gallery">
            <c:forEach var="card" items="${cards}">
                <div class="card" data-category="${card.categoryID}" data-date="${card.cardStartDate}" data-likes="${card.cardLikeCnt}">
                <a href="card/completedCard/${card.cardID}">
                        <div class="card-image">
                            <img src="${card.templateThumbnail}" alt="Card${card.cardID} Thumbnail">
                            <div class="card-overlay">
                                <p>${card.cardName}</p>
                                <p>${card.cardStartDate}</p>
                            </div>
                        </div>
                        <div class="card-info">
                            <h3>${card.cardName}</h3>
                            <p><c:choose>
                                <c:when test="${not empty card.cardEndDate}">
                                    ${card.cardStartDate} - ${card.cardEndDate}
                                </c:when>
                                <c:otherwise>
                                    ${card.cardStartDate}
                                </c:otherwise>
                            </c:choose></p>
                            <p>👍 Like ${card.cardLikeCnt}</p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="sticker2"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>