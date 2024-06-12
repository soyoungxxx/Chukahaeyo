<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>404 에러 페이지</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/mypage.css"/>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
        }
        .main {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            text-align: center;
        }
        .404ErrorPage-content {
                max-width: 600px;
                padding: 20px;
            }
        .404ErrorPage-content img {
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
        <div class="404ErrorPage">
            <div class="404ErrorPage-wrap">
                <div class="404ErrorPage-content">
                    <img src="/resources/img/error/404%20logo.png" alt="404 에러 페이지 이미지" style="width: 50%;"><br><br></ㅠㄱ><br>
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