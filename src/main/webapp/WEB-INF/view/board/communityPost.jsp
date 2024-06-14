<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <script src="/resources/js/board/board-write.js"></script>
    <link rel="stylesheet" href="/resources/css/pageFrame/reset.css" />
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css" />
    <link rel="stylesheet" href="/resources/css/board/board-write.css" />

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

<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>


<main class="main">
    <div class="sticker1"></div>


    <div style="width: 100%; display: flex; flex-direction: row; justify-content: center;">
        <!-- //여기에 태그 만들면됨 -->
        <div class="container">

            <div class="community-logo"></div>


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


    <div class="sticker2"></div>


</main>

<%@ include file="/WEB-INF/view/include/footer.jsp" %>




</body>

</html>