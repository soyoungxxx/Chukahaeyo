<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>축하해요 1:1문의</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <!--jQuery-->
    <!--summernote-->
    <link href="/resources/summernote/summernote-lite.css" rel="stylesheet">
    <script src="/resources/summernote/summernote-ko-KR.js"></script>
    <script src="/resources/summernote/summernote-lite.js"></script>
    <!--summernote-->
    <script src="/resources/js/common/xDB.js"></script>
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
                    // 값이 잘 넘어오는지 콘솔 확인 해보셔도됩니다.
                    console.log(data);
                }
            });
        }

        function deleteSummernoteImageFile(imageName) {
            data = new FormData()
            data.append('file', imageName);
            $.ajax({
                data: data,
                type: 'POST',
                url: '/board/community/image-delete',
                contentType: false,
                enctype: 'multipart/form-data',
                processData: false
            })
        }
    </script>
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/mypage.css"/>
    <link rel="stylesheet" href="/resources/css/board/inquiryPost.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/reset.css"/>
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
                        <div class="title-container">
                            <input class="title-text" type="text" placeholder="제목을 입력하세요."/>
                        </div>
                        <div class="data-container">
                            <form method="post">
                                <textarea class="data-text" id="summernote" name="editordata"></textarea>
                            </form>
                        </div>
                        <div style="width:90%">
                            <div class="write-button">등록하기</div>
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