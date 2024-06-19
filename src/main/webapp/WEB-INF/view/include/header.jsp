<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/resources/css/include/header.css"/>
<link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>

<script>
    window.addEventListener('load', function() {
        <c:if test="${not empty sessionScope.login}">
        $(".gallery-community-bar").mouseover(function (e) {
            $(".gallery-community-menu").slideDown()

        });

        $(".gallery-community-menu").mouseleave(function (e) {
            $(".gallery-community-menu").slideUp()

        });
        $(".gallery-community-menu").mouseover(function (e) {
            $(".gallery-community-menu").slideDown()

        });


        </c:if>
    });

</script>
<div class="header">
    <a href="/">
        <div class="logo"></div>
    </a>
    <nav class="nav1">
        <div class="my-birth-card"><a href="/card/edit/myCard">생일 카드</a></div>
        <div class="pet-birth-card"><a href="/card/edit/myPet">반려동물 생일 카드</a></div>
        <div class="party-invite-card"><a href="/card/edit/invitation">파티 초대 카드</a></div>
        <div class="gallery"><a class="gallery-community" href="/gallery">&nbsp;&nbsp;&nbsp;&nbsp;명예의 전당</a></div>
        <div class="community">
            <a class="gallery-community gallery-community-bar" href="/board/community/list">커뮤니티</a>
            <div class="gallery-community-menu">
                <div class="gallery-community-menu-one"><a href="/board/community/list?query=${memberName}&querytype=writer">내가 쓴 글</a></div>
                <hr>
                <div class="gallery-community-menu-two"><a href="/board/community/list">커뮤니티</a></div>
            </div>
        </div>
    </nav>
    <nav class="nav2">
        <c:if test="${empty sessionScope.login}">
            <a href="/member/login">로그인</a>
            |
            <a href="/member/register">회원가입</a>
        </c:if>
        <c:if test="${not empty sessionScope.login}">
            <a href="/logout">로그아웃</a>
            |
            <a href="/mypage/myCard"><img src="${pageContext.request.contextPath}/resources/img/header/myinfo.png"></a>
            |
            <a href="/cart"><img src="${pageContext.request.contextPath}/resources/img/header/cart.png"></a>
        </c:if>
    </nav>
</div>