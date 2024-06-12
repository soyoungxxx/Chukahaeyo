<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <script src="/resources/js/board/board-detail.js"></script>
    <link rel="stylesheet" href="/resources/css/reset.css" />
    <link rel="stylesheet" href="/resources/css/common.css" />
    <link rel="stylesheet" href="/resources/css/board/board-detail.css" />

    <!--font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100..900&display=swap"
          rel="stylesheet">
    <!--font-->

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <!--jQuery-->



    <!--summernote-->
    <link href="/resources/summernote/summernote-lite.css" rel="stylesheet">
    <script src="/resources/summernote/summernote-ko-KR.js"></script>
    <script src="/resources/summernote/summernote-lite.js"></script>
    <!--summernote-->
</head>

<body class="body">
<%@ include file="/WEB-INF/view/include/header.jsp" %>


<main class="main">
    <div class="sticker1"></div>


    <div style="width: 100%; display: flex; flex-direction: row; justify-content: center;">
        <!-- //여기에 태그 만들면됨 -->
        <!-- //여기에 태그 만들면됨 -->
        <div class="container">

            <div class="community-logo"></div>

            <input type="hidden" class="board-id" value="${object.commId}"/>
            <div class="writer-container">
                <div class="writer-text">${object.memberName}</div>
                <div class="writer-date"><fmt:formatDate value="${object.commPostDate }" pattern="yy/MM/dd hh:mm"/></div>
            </div>


            <div class="title-container">
                <div class="title">${object.commTitle}</div>
                <div class="like heartblack"></div>
                <!--<div class="like heartbred"></div>-->
            </div>

            <div class="content">

                ${object.commContents}

            </div>

            <div class="button-container">
                <div class="list">목록</div>
                <div class="edit">수정</div>
                <div class="delete">삭제</div>
            </div>

            <div class="likecommentdisply-container">
                <div class="like-display">좋아요 : </div>
                <div class="like-display-data">3</div>
                <div class="comment-display">댓글 : </div>
                <div class="comment-display-data">21</div>
            </div>

            <div class="comment-container">
                <div class="no-comment">댓글이 없습니다.</div>

                <div class="main-data-comment">
                    <div class="main-data-comment-writer">박대기</div>
                    <div class="main-data-comment-content">댓글 입니다 !!~~~~~</div>
                    <div class="main-data-comment-date">08/21 19:00 <a class="main-data-comment-replyshow">대댓글 달기</a></div>
                    <input type="text" class="main-data-comment-replytext" > <input value="등록" type="button" class="main-data-comment-replybutton" >
                </div>



                <div class="sub-data-comment">
                    <img class="sub-data-comment-img" src="/resources/img/re-comment.png" >
                    <div class="sub-data-comment-inner">
                        <div class="sub-data-comment-inner-writer">김정화</div>
                        <div class="sub-data-comment-inner-content">대댓글 입니다~~~~</div>
                        <div class="sub-data-comment-inner-date">09/22 19:01</div>
                    </div>

                </div>








                <div class="main-comment-write">
                    <input class="main-comment-write-text" type="text" > <input class="main-comment-write-button" type="button" value="등록">

                </div>





            </div>

        </div>





    </div>


    <div class="sticker2"></div>


</main>

<%@ include file="/WEB-INF/view/include/footer.jsp" %>




</body>

</html>
