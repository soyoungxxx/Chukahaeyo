<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.util.List" %>
<%@ page import="com.choikang.chukahaeyo.card.gallery.CardTest" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/common.css"/>
    <link rel="stylesheet" href="/resources/css/gallery.css"/>

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
                    sortedCards.sort((a, b) => new Date(b.dataset.date) - new Date(a.dataset.date));
                } else if (sortOrder === 'popular') {
                    sortedCards.sort((a, b) => b.dataset.likes - a.dataset.likes);
                }

                sortedCards.forEach(card => {
                    if (selectedCategory === "all" || card.dataset.template === selectedCategory) {
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
                <%--                <label for="category">카테고리:</label>--%>
                <div class="select-wrapper">
                    <select id="category">
                        <option value="all">카테고리 선택</option>
                        <option value="template01">Template 01</option>
                        <option value="template02">Template 02</option>
                        <option value="template03">Template 03</option>
                    </select>
                </div>
                <div class="category-wrapper">
<%--                    <label>정렬:</label>--%>
                    <input type="radio" id="popular" name="sortOrder" value="popular" checked> 인기순
                    <input type="radio" id="latest" name="sortOrder" value="latest"> 최신순
                </div>
            </div>
        </div>

        <div class="card-gallery">
            <%
                // 예시 데이터, 실제로는 데이터베이스에서 가져와야 합니다.
                List<CardTest> cards = (List<CardTest>) request.getAttribute("cards");

                if (cards != null) {
                    for (CardTest card : cards) {
            %>
            <div class="card" data-template="<%= card.getTemplate() %>" data-likes="<%= card.getLikes() %>"
                 data-date="<%= card.getDate() %>">
                <div class="card-image">
                    <img src="/resources/img/template/<%=card.getTemplate()%>.png" alt="Card Image">
                    <%--                    <img src="<%= card.getImageUrl() %>" alt="Card Image">--%>
                    <%--                    <div class="overlay">--%>
                    <%--                        <div class="text"><%= card.getName() %> - <%= card.getDate() %>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                </div>
                <div class="card-info">
                    <h3><%= card.getName() %>
                    </h3>
                    <p><%= card.getDate() %>
                    </p>
                    <p>👍 Like <%= card.getLikes() %>
                    </p>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>

    </div>
    <div class="sticker2"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>