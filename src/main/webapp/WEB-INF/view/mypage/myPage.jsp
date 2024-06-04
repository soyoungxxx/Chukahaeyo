<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>마이페이지</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/img/common.css"/>
    <style>
        .mypage{
            width: 100%;
            min-width: 1200px;
            display: flex;
            flex-direction: row;
            align-items: end;
            justify-content: center;
        }

        .mypage-header{
            width: 100%;
            margin: auto;
        }

        .mypage-header > img{
            width: 160px;
            margin: 35px 10px 15px 140px;
        }

        .mypage-header > hr{
            margin: 0 auto;
            width: 85%;
            border: #B5B5B5 solid 1px;
        }

        .mypage-wrap{
            display: flex;
            width: 85%;
            margin: 0 auto;
            justify-content: flex-start;
        }

        .mypage-content{
            width: 80%;
        }

        .menu{
            width: 20%;
        }
    </style>
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
                    본문 들어갈 자리
                    여기에 내용 작성하면 됨
                </div>
            </div>
        </div>
    </div>
    <div class="sticker2"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>