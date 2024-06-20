<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>축하해요 1:1문의</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css" />
    <link rel="stylesheet" href="/resources/css/pageFrame/mypage.css" />
    <link rel="stylesheet" href="/resources/css/board/inquiryDetail.css" />
    <link rel="stylesheet" href="/resources/css/pageFrame/reset.css" />
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <script>
        window.onload = function(){
            $(".inquiry-list-button").click(function (e) {

                location.href = '/board/inquiry/list?query=${inquiryVO.query}&querytype=${inquiryVO.querytype}&page=${inquiryVO.page}';


            });



        };

    </script>
</head>

<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main">
    <div class="sticker1"></div>
    <div style="width: 100%;">
        <div class="mypage-header">
            <img src="/resources/img/logo/logo_mypage.png">
            <hr>
        </div>
        <div class="mypage">
            <div class="mypage-wrap">
                <%@ include file="/WEB-INF/view/mypage/include/menu.jsp" %>
                <div class="mypage-content">






















                    <div class="container">
                        <input type="hidden" class="inquiry-id" value="${object.inquiryID}"/>
                        <div class="inquiry-logo">문의내역</div>

                        <div class="inquiry-info">
                            <div class="inquiry-info-title">${object.inquiryQuestionTitle}</div>
                            <div class="inquiry-info-sub">작성자 : ${object.memberName} | 작성일 : <fmt:formatDate value="${object.inquiryPostDate }" pattern="yy/MM/dd HH:mm"/> </div>
                        </div>
                        <div class="inquiry-content">
                            ${object.inquiryQuestion}

                        </div>
                        <c:if test="${object.adminID != 0}">
                            <div class="inquiry-answer">
                                <div class="inquiry-answer-content">
                                    ${object.inquiryAnswer}
                                </div>
                                <div class="inquiry-answer-info">답변자 : 관리자</div>
                            </div>
                        </c:if>


                        <div class="inquiry-list">
                            <div class="inquiry-list-button">목록</div>
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