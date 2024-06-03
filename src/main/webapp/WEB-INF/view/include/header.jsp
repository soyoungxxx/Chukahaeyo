<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/resources/css/header.css"/>
<link rel="stylesheet" href="/resources/img/common.css"/>

<div class="header">
    <div class="logo"></div>
    <nav class="nav1">
        <div class="my-birth-card"><a href="#">내 생일 카드</a></div>
        <div class="pet-birth-card"><a href="#">반려동물 생일 카드</a></div>
        <div class="party-invite-card"><a href="#">파티 초대 카드</a></div>
        <div class="gallery"><a class="gallery-community" href="#">명예의 전당</a></div>
        <div class="community"><a class="gallery-community" href="#">커뮤니티</a></div>
    </nav>
    <nav class="nav2">
        <c:if test="${empty login}">
            <a href="#">로그인</a>
            |
            <a href="#">회원가입</a>
        </c:if>
        <c:if test="${not empty login}">
            <a href="#">로그아웃</a>
            |
            <a href="#"><img src="${pageContext.request.contextPath}/resources/img/myinfo.png"></a>
            |
            <a href="#"><img src="${pageContext.request.contextPath}/resources/img/cart.png"></a>
        </c:if>
    </nav>
</div>

