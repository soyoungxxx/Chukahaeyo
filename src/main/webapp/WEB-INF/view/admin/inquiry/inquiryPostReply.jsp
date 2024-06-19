<%--
  Created by IntelliJ IDEA.
  User: joyebin
  Date: 5/30/24
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>Admin 축하해요</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css" />
    <link rel="stylesheet" href="/resources/css/pageFrame/admin.css" />
    <link rel="stylesheet" href="/resources/css/board/inquiryPostReply.css" />
    <link rel="stylesheet" href="/resources/css/pageFrame/reset.css" />
    <script>
        function imageUploader(file, el) {
            var formData = new FormData();
            formData.append('file', file);

            $.ajax({
                data : formData,
                type : "POST",
                // url은 자신의 이미지 업로드 처리 컨트롤러 경로로 설정해주세요.
                url : '/board/community/image-upload',
                contentType : false,
                processData : false,
                enctype : 'multipart/form-data',
                success : function(data) {
                    $(el).summernote('insertImage', "${pageContext.request.contextPath}/resources/assets/images/upload/"+data, function($image) {
                        $image.css('width', "100%");
                    });
                    // 값이 잘 넘어오는지 콘솔 확인 해보셔도됩니다.
                    console.log(data);
                }
            });
        }

        function deleteSummernoteImageFile(imageName){
            data = new FormData()
            data.append('file' , imageName);
            $.ajax({
                data:data,
                type:'POST',
                url: '/board/community/image-delete',
                contentType:false,
                enctype:'multipart/form-data',
                processData:false
            })
        }
    </script>
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <!--jQuery-->
    <script src="/resources/js/board/inquiryPostReply.js"></script>
    <!--summernote-->
    <link href="/resources/summernote/summernote-lite.css" rel="stylesheet">
    <script src="/resources/summernote/summernote-ko-KR.js"></script>
    <script src="/resources/summernote/summernote-lite.js"></script>
    <!--summernote-->

</head>

<body>
<main class="main">
    <div style="width: 100%;">
        <div class="admin-header">
            <a href="admin/adminPage" class="logo">관리자페이지</a>
            <a href="#" class="logout">로그아웃</a>
        </div>
        <hr>
        <div class="admin">
            <div class="admin-wrap">
                <div class="menu">
                    <div class="admin-menu">
                        <ul>
                            <li id="orderList">주문 목록</li>
                            <li id="inquiryList">1:1 문의 관리</li>
                        </ul>

                    </div>
                </div>
                <div class="v-line"></div>
                <div class="admin-content">








                    <div class="container">
                        <input type="hidden" class="inquiry-id" value="${object.inquiryID}"/>
                        <div class="inquiry-logo">1:1 문의관리</div>

                        <div class="inquiry-info">
                            <div class="inquiry-info-title">${object.inquiryQuestionTitle}</div>
                            <div class="inquiry-info-sub">작성자 : ${object.memberName} | 작성일 : <fmt:formatDate value="${object.inquiryPostDate }" pattern="yy/MM/dd hh:mm"/></div>
                        </div>
                        <div class="inquiry-content">
                            ${object.inquiryQuestion}
                        </div>
                        <div class="inquiry-answer">
                            <c:if test="${object.adminID == 0}">
                            <textarea class="data-text" id="summernote" name="editordata"></textarea>
                            </c:if>
                            <div class="inquiry-answer-content">
                                ${object.inquiryAnswer}
                            </div>
                            <div class="inquiry-answer-info">답변자 : 관리자</div>
                        </div>
                        <c:if test="${object.adminID == 0}">
                        <div class="inquiry-list">
                            <div class="inquiry-list-button">답변</div>
                        </div>
                        </c:if>


                    </div>



















                </div>
            </div>
        </div>
    </div>
</main>
</body>

</html>
