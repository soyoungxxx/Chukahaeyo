<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>404 에러 페이지</title>
    <link rel="icon" href="/resources/img/logo/favicon.png"/>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <style>
        .ErrorPage404-content {
            flex-direction: column;
            display: flex;
            align-items: center;
            margin-top: 100px;
            padding: 20px;
        }

        .ErrorPage404-content img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main">
    <div class="sticker1"></div>
    <div style="width: 100%;">
        <div class="ErrorPage404">
            <div class="ErrorPage404-wrap">
                <div class="ErrorPage404-content">
                    <img src="/resources/img/error/404%20logo.png" alt="404 에러 페이지 이미지" style="width: 50%;"><br><br><br>
                    <img src="/resources/img/error/404%20text.png" alt="404 에러 페이지 이미지" style="width: 40%;"><br><br>
                </div>
            </div>
        </div>
    </div>
    <div class="sticker2"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>