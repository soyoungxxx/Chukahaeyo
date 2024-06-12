<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.choikang.chukahaeyo.card.gallery.CardTest" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>축하해요</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/main.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main">
    <div class="sticker1"></div>
    <div style="width: 100%;">
        <div class="container">
<%--            <div style="width: 100%; height: 100%;">--%>
                <!-- 이미지 슬라이드 영역 -->
                <div class="slideshow-container">
                    <div class="slides fade">
                        <img src="resources/img/main/mainad01.png" alt="" style="width:100%">
                    </div>
                    <div class="slides fade">
                        <img src="resources/img/main/mainad01ex.png" alt="" style="width:100%">
                    </div>
                    <div class="slides fade">
                        <img src="resources/img/main/mainad01.png" alt="" style="width:100%">
                    </div>
                    <a class="prev-slide" onclick="plusSlides(-1)">&#10094;</a>
                    <a class="next-slide" onclick="plusSlides(1)">&#10095;</a>
                </div>
<%--            </div>--%>

            <div class="navigator">
                <!-- 내생일, 반려동물 생일, 단체 행사 링크 -->
                <a href="EditPage/내생일템플릿">
                    <img src="resources/img/main/mainbear1.png" alt="" class="mainBear">
                </a>
                <a href="EditPage/반려동물생일템플릿">
                    <img src="resources/img/main/mainbear2.png" alt="" class="mainBear">
                </a>
                <a href="EditPage/단체행사템플릿">
                    <img src="resources/img/main/mainbear3.png" alt="" class="mainBear">
                </a>
            </div>

            <div class="show-gallery">
                더 많은 카드가 궁금하다면? >
                <a href="gallery"><input type="button" class="move-gallery" value="명예의 전당 이동"/></a>
            </div>
            <div class="card-gallery">
                <%
                    // 예시 데이터
                    List<CardTest> cards = new ArrayList<>();
                    cards.add(new CardTest("홍길동<br>생일카드", "2023-06-01", 1, "", "template01"));
                    cards.add(new CardTest("초코<br>생일카드", "2023-05-15", 20, "", "template02"));
                    cards.add(new CardTest("야구장<br>초대카드", "2023-04-30", 5, "", "template03"));
                    if (cards != null) {
                        for (CardTest card : cards) {
                %>
                <div class="card" data-template="<%= card.getTemplate() %>" data-likes="<%= card.getLikes() %>"
                     data-date="<%= card.getDate() %>">
                    <div class="card-image">
                        <img src="/resources/img/template/<%=card.getTemplate()%>.png" alt="Card Image">
                        <div class="overlay">
                            <div class="text"><%= card.getName() %>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </div>
    <div class="sticker2"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>

<!-- 슬라이드 쇼 스크립트 -->
<script>
    var slideIndex = 0;
    showSlides();

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function showSlides() {
        var i;
        var slides = document.getElementsByClassName("slides");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {
            slideIndex = 1
        }
        slides[slideIndex - 1].style.display = "block";
        setTimeout(showSlides, 6000); // 6초마다 슬라이드 전환
    }
</script>
</body>
</html>
