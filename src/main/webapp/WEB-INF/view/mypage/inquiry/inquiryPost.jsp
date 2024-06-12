<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>1:1문의 등록</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <!--jQuery-->
    <!--summernote-->
    <link href="/resources/summernote/summernote-lite.css" rel="stylesheet">
    <script src="/resources/summernote/summernote-ko-KR.js"></script>
    <script src="/resources/summernote/summernote-lite.js"></script>
    <!--summernote-->

    <link rel="stylesheet" href="/resources/css/pageFrame/common.css" />
    <link rel="stylesheet" href="/resources/css/pageFrame/mypage.css" />
    <link rel="stylesheet" href="/resources/css/board/inquiryPost.css" />
    <link rel="stylesheet" href="/resources/css/pageFrame/reset.css" />
    <script src="/resources/js/board/inquiryPost.js"></script>

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

                        <div class="inquiry-logo">문의내역</div>


                        <div class="title-container">
                            <div class="title-title">제목</div>
                            <input class="title-text" type="text" placeholder="제목을 입력하세요." />
                        </div>

                        <div class="data-container">
                            <div class="data-title">내용</div>
                            <form method="post">
                                <textarea class="data-text" id="summernote" name="editordata"></textarea>
                            </form>

                        </div>

                        <div class="write-button">
                            글쓰기
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