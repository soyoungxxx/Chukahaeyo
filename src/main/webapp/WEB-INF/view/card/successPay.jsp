<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>test</title>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/successpay.css"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.8/clipboard.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main">
    <div class="sticker1"></div>
    <div style="width: 100%; position: relative">
        <div class="sticker3">
            <img src="/resources/img/payment/paySuccessCheck.png" alt="결제 성공 체크 이미지" style="width: 10%;"><br><br>
            <img src="/resources/img/payment/successPayText.png" alt="결제 성공 텍스트 이미지" style="width: 20%;"><br><br><br>
            <div class="url-container">
                카드 URL | <span class="url" id="shortUrl">${param.shortUrl}</span>
            </div>

            <br><br>
            <div class="buttons">
                <div class="button-copy">
                    <button class="button copy" data-clipboard-target="#shortUrl">URL 복사하기</button>
                </div>
                <div class="button-main">
                    <button class="button main2" onclick="goToMain()">메인으로 이동</button>
                </div>
            </div>
        </div>
    </div>
    <div class="sticker2"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>

<script>
    $(document).ready(function() {
        new ClipboardJS('.copy').on('success', function(e) {
            console.log(e.text);
            alert('URL이 복사되었습니다.');
        }).on('error', function(e) {
            console.error('URL 복사 실패: ', e);
            alert('URL 복사에 실패했습니다.');
        });
    });

    function goToMain() {
        window.location.href = '/';
    }
</script>
</body>
</html>
