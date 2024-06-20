<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>축하해요 커뮤니티</title>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <script src="/resources/js/common/xDB.js"></script>
    <script src="/resources/js/board/board-detail.js"></script>
    <script src="/resources/js/common/momment.js"></script>
    <link rel="stylesheet" href="/resources/css/pageFrame/reset.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/board/board-detail.css"/>

    <!--font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100..900&display=swap"
          rel="stylesheet">

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>

    <!--summernote-->
    <link href="/resources/summernote/summernote-lite.css" rel="stylesheet">
    <script src="/resources/summernote/summernote-ko-KR.js"></script>
    <script src="/resources/summernote/summernote-lite.js"></script>
</head>

<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main">
    <div class="sticker1"></div>
    <div style="width: 100%; display: flex; flex-direction: row; justify-content: center;">
        <!-- //여기에 태그 만들면됨 -->
        <!-- //여기에 태그 만들면됨 -->
        <div class="container">

            <div class="community-logo"></div>
            <input type="hidden" class="board-id" value="${object.commID}"/>
            <input type="hidden" class="my-member-id" value="${communityVO.memberID}"/>
            <input type="hidden" class="my-member-name" value="${communityVO.memberName}"/>
            <div class="writer-container">
                <div class="writer-text">${object.memberName}</div>
                <div class="writer-date">
                    <fmt:formatDate value="${object.commPostDate}" pattern="yy/MM/dd HH:mm"/>
                </div>
            </div>

            <div class="title-container">
                <div class="title">${object.commTitle}</div>
                <c:if test="${not empty memberID}">
                    <c:if test="${object.isRed == 1}">
                        <div class="like heartred"></div>
                        <div class="like heartblack" style="display: none;"></div>
                    </c:if>
                    <c:if test="${object.isRed != 1}">
                        <div class="like heartblack"></div>
                        <div class="like heartred" style="display: none;"></div>
                    </c:if>
                </c:if>
            </div>

            <div class="content">
                ${object.commContents}
            </div>

            <div class="button-container">
                <input type="hidden" class="query" value="${communityVO.query}"/>
                <input type="hidden" class="querytype" value="${communityVO.querytype}"/>
                <input type="hidden" class="page" value="${communityVO.page}"/>
                <input type="hidden" class="sort" value="${communityVO.sort}"/>
                <div class="list">목록</div>
                <c:if test="${object.memberID == memberID}">
                    <div class="edit"><a href="/board/community/update?commID=${object.commID}">수정</a></div>
                    <div class="delete">삭제</div>
                </c:if>
            </div>

            <div class="likecommentdisply-container">
                <div class="like-display">좋아요 :</div>
                <div class="like-display-data">${object.boardLike}</div>
                <div class="comment-display">댓글 :</div>
                <div class="comment-display-data">${object.replyCount}</div>
            </div>

            <div class="comment-container">

            </div>
        </div>
    </div>
    <div class="sticker2"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>
