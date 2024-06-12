<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>마이페이지</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/common.css"/>
    <link rel="stylesheet" href="/resources/css/mypage.css"/>
</head>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main">
    <div class="sticker1"></div>
    <div style="width: 100%;">
        <div class="mypage-header">
            <img src="/resources/img/logo_mypage.png">
            <hr>
        </div>
        <div class="mypage">
            <div class="mypage-wrap">
                <%@ include file="/WEB-INF/view/mypage/include/menu.jsp" %>
                <div class="mypage-content">
                    <div class="payment-list">
                        <div class="payment-items">
                            <a href="#">
                                <img src="/resources/img/template/templateGreen.png" alt="템플릿1" class="payment-item-img">
                            </a>
                            <a href="#">
                                <img src="/resources/img/template/templateNavy.png" alt="템플릿1" class="payment-item-img">
                            </a>

                        </div>
                        <div class="payment-info">
                            <p>주문일자: 2024.06.10.</p>
                            <p>금액: 12,345원</p>
                            <a href="#">취소</a>
                        </div>
                    </div>

                    <div class="payment-list">
                        <div class="payment-items">
                            <a href="#">
                                <img src="/resources/img/template/templateGreen.png" alt="템플릿1" class="payment-item-img">
                            </a>
                            <a href="#">
                                <img src="/resources/img/template/templateNavy.png" alt="템플릿1" class="payment-item-img">
                            </a>
                            <a href="#">
                                <img src="/resources/img/template/templateBaseBall.png" alt="템플릿1" class="payment-item-img">
                            </a>
                            <a href="#">
                                <img src="/resources/img/template/templateNavy.png" alt="템플릿1" class="payment-item-img">
                            </a>
                            <a href="#">
                                <img src="/resources/img/template/templateBaseBall.png" alt="템플릿1" class="payment-item-img">
                            </a>
                            <a href="#">
                                <img src="/resources/img/template/templateGreen.png" alt="템플릿1" class="payment-item-img">
                            </a>
                        </div>
                        <div class="payment-info">
                            <p>주문일자: 2024.06.10.</p>
                            <p>금액: 12,345원</p>
                            <a href="#">취소</a>
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