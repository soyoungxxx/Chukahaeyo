<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>축하해요</title>
    <link rel="icon" href="/resources/img/logo/favicon.png"/>

    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <script>
        function imageUploader(file, el) {
            var formData = new FormData();
            formData.append('file', file);

            $.ajax({
                data: formData,
                type: "POST",
                // url은 자신의 이미지 업로드 처리 컨트롤러 경로로 설정해주세요.
                url: '/upload',
                contentType: false,
                processData: false,
                enctype: 'multipart/form-data',
                success: function (data) {
                    $(el).summernote('insertImage', data, function ($image) {
                        $image.css('width', "100%");
                    });
                }
            });
        }

        function deleteSummernoteImageFile(imageName) {
            data = new FormData()
            data.append('file', imageName);
            $.ajax({
                data: data,
                type: 'POST',
                url: 'image-delete',
                contentType: false,
                enctype: 'multipart/form-data',
                processData: false
            })
        }
    </script>

    <script src="/resources/js/common/xDB.js"></script>
    <script src="/resources/js/board/board-write.js"></script>
    <link rel="stylesheet" href="/resources/css/pageFrame/reset.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/board/board-write.css"/>

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
        <div class="container">
            <input type="hidden" class="ismy" name="ismy" value="${communityVO.ismy}"/>
            <div class="head-container">
                커뮤니티 글쓰기 <div class="write-button">글쓰기</div>
                <hr>
            </div>
            <div class="title-container">
                <input class="title-text" type="text" placeholder="제목을 입력하세요."/>
            </div>
            <div class="data-container">
                <form method="post">
                    <textarea class="data-text" id="summernote" name="editordata"></textarea>
                </form>
            </div>
        </div>
    </div>
    <div class="sticker2"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>