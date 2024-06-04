<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>test</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/common.css"/>
    <style>


        .horizontal-line {
            width: 1565px;
            height: 0;
            left: -71px;
            top: 117px;
            position: absolute;
            border: 1px black solid;
        }

        .image-1, .image-2, .image-3, .image-4, .image-5, .image-6, .image-8, .image-9, .image-10, .image-11 {
            position: absolute;
        }

        .image-1 {
            width: 32.32px;
            height: 35.23px;
            left: 1362.50px;
            top: 422px;
            transform: rotate(10.63deg);
            transform-origin: 0 0;
        }

        .logout {
            width: 148px;
            height: 30px;
            left: 1164px;
            top: 51px;
            position: absolute;
            color: black;
            font-size: 15px;
            font-family: Kantumruy;
            font-weight: 400;
            word-wrap: break-word;
        }

        .image-2 {
            width: 55px;
            height: 53px;
            left: 1237px;
            top: 37px;
        }

        .image-3 {
            width: 58px;
            height: 58px;
            left: 1312px;
            top: 37px;
        }

        .image-4 {
            width: 36.73px;
            height: 49.18px;
            left: 1260px;
            top: 457.87px;
            transform: rotate(-25.93deg);
            transform-origin: 0 0;
        }

        .image-5 {
            width: 48px;
            height: 50px;
            left: 1286px;
            top: 778px;
        }

        .image-6 {
            width: 48px;
            height: 50px;
            left: 1366px;
            top: 523px;
        }

        .left-images {
            width: 154px;
            height: 406px;
            left: 14px;
            top: 285px;
            position: absolute;
        }

        .left-image-1, .left-image-2, .left-image-3, .left-image-4 {
            position: absolute;
        }

        .left-image-1 {
            width: 32.32px;
            height: 35.23px;
            left: 102.50px;
            top: 0;
            transform: rotate(10.63deg);
            transform-origin: 0 0;
        }

        .left-image-2 {
            width: 36.73px;
            height: 49.18px;
            left: 0;
            top: 35.87px;
            transform: rotate(-25.93deg);
            transform-origin: 0 0;
        }

        .left-image-3 {
            width: 48px;
            height: 50px;
            left: 26px;
            top: 356px;
        }

        .left-image-4 {
            width: 48px;
            height: 50px;
            left: 106px;
            top: 101px;
        }

        .image-7 {
            width: 48px;
            height: 48px;
            left: 1315px;
            top: 631px;
            position: absolute;
        }


    </style>
</head>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main">
    <div class="sticker1"></div>
    <div style="width: 100%;">
        <img src="/resources/img/paySuccessCheck.png" alt="결제 성공 체크 이미지"><br>
        <img src="/resources/img/successPayText.png" alt="결제 성공 텍스트 이미지">
    </div>
    <div class="sticker2"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>