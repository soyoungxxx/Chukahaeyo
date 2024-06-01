<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<style>
    a{
        text-decoration: none;
    }
    .header{
        width: 100%;
        min-width: 1400px;
        display: flex;
        flex-direction: row;
        align-items: end;
        border-bottom: 1px solid black;
        justify-content: center;
    }
    .logo {
        width: 180px;
        height: 65px;
        background-image: url("/resources/img/logo.png");
        background-size: contain;
        background-repeat: no-repeat;
        cursor : pointer;
    }

    /*nav1*/
    .nav1{
        display: flex;
        flex-direction: row;
        font-family: "Jua", sans-serif;
        font-size: 24px;
    }
    .nav1 a {
        color: #ACACAC;
    }
    .nav1 .gallery-community{
        color: #949FFF;
    }
    .nav1 .my-birth-card {
        width: 110px;
        height: 20px;
        margin-bottom: 10px;
        margin-left: 25px;
    }
    .nav1 .pet-birth-card {
        width: 160px;
        height: 20px;
        margin-bottom: 10px;
        margin-left: 25px;
    }
    .nav1 .party-invite-card{
        width: 125px;
        height: 20px;
        margin-bottom: 10px;
        margin-left: 25px;
    }
    .nav1 .gallery{
        width: 100px;
        height: 20px;
        margin-bottom: 10px;
        margin-left: 70px;
    }
    .nav1 .community{
        width: 105px;
        height: 20px;
        margin-bottom: 10px;
        margin-left: 25px;
    }

    /*nav2*/
    .nav2 {
        display: flex;
        flex-direction: row;
        align-items: center;
    }
    .nav2 a {
        color: black;
        margin: 10px;
    }
</style>


<header class="header">
    <div class="logo"></div>
    <nav class="nav1">
        <div class="my-birth-card"><a href="#">내 생일 카드</a></div>
        <div class="pet-birth-card"><a href="#">반려동물 생일 카드</a></div>
        <div class="party-invite-card"><a href="#">파티 초대 카드</a></div>
        <div class="gallery"><a class="gallery-community" href="#">명예의 전당</a></div>
        <div class="community"><a class="gallery-community" href="#">커뮤니티</a></div>
    </nav>
    <nav class="nav2">
        <a href="#">로그인</a>
        |
        <a href="#">회원가입</a>
        |
        <a href="#">로그아웃</a>
        |
        <a href="#"><img src="${pageContext.request.contextPath}/resources/img/myinfo.png"></a>
        |
        <a href="#"><img src="${pageContext.request.contextPath}/resources/img/cart.png"></a>
    </nav>
</header>