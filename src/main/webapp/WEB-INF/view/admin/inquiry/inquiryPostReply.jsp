<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <meta charset="utf-8">
    <title>Admin 축하해요</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">

    <link rel="stylesheet" href="/resources/css/pageFrame/admin.css" />
    <link rel="stylesheet" href="/resources/css/board/allInquiryList.css" />
    <link rel="stylesheet" href="/resources/css/pageFrame/admin.css" />
    <link rel="stylesheet" href="/resources/css/board/inquiryPostReply.css" />
    <link rel="stylesheet" href="/resources/css/pageFrame/reset.css" />
    <link href="/resources/css/admin/admin.css" rel="stylesheet">
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
<body id="page-top">
<main class="main">
    <div id="wrapper">
        <%@ include file="/WEB-INF/view/include/adminSidebar.jsp" %>
        <script>
            document.getElementById("memberList").className = 'nav-item active';
        </script>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <%@ include file="/WEB-INF/view/include/adminTopbar.jsp" %>

            <!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <div class="admin-content">
                        <div class="container">
                            <input type="hidden" class="inquiry-id" value="${object.inquiryID}"/>
                            <div class="inquiry-logo">1:1 문의관리</div>

                            <div class="inquiry-info">
                                <div class="inquiry-info-title">${object.inquiryQuestionTitle}</div>
                                <div class="inquiry-info-sub">작성자 : ${object.memberName} | 작성일 : <fmt:formatDate value="${object.inquiryPostDate }" pattern="yy/MM/dd HH:mm"/></div>
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

                        <c:if test="${object.adminID == 0}">
                        <div class="inquiry-list">
                            <div class="inquiry-list-button">답변</div>
                        </div>
                        </c:if>
                        <div class="list">
                            <div class="inquiry-list-list"><a href="/admin/board/inquiry/list">목록</a></div>
                        </div>

                    </div>

                </div>
                <!-- End of Main Content -->
                <%@ include file="/WEB-INF/view/include/adminFooter.jsp" %>

            </div>
        </div>
        <!-- End of Content Wrapper -->

        <%@ include file="/WEB-INF/view/include/adminLogoutModal.jsp" %>

</main>

<script>
    function updateSelectedCount() {
        const checkboxes = document.getElementsByClassName('member-select-btn');
        let selectedCount = 0;

        for (let i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                selectedCount++;
            }
        }
        document.getElementById('selected-count').innerText = selectedCount + '개 항목 선택';
    }

    function selectAll() {
        const checkboxes = document.getElementsByClassName('member-select-btn');

        for (let i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = true;
        }

        updateSelectedCount();
    }

    function deselectAll() {
        const checkboxes = document.getElementsByClassName('member-select-btn');

        for (let i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = false;
        }
        updateSelectedCount();
    }

    function deleteMembers(){
        var selectedMembers = [];
        $('.member-select-btn:checked').each(function() {
            selectedMembers.push($(this).attr('id').replace('checkbox', ''));
        });

        if (selectedMembers.length === 0) {
            alert("삭제할 회원을 선택하세요.");
            return;
        }

        console.log(selectedMembers);

        $.ajax({
            url: '/admin/memberDelete',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({memberIds: selectedMembers}),
            success: function() {
                alert("회원 삭제가 완료되었습니다.");
                location.reload();
            },
            error: function(xhr, status, error) {
                alert("회원 삭제 중 오류가 발생했습니다.");
                console.error(error);
            }
        });
    }
</script>

<!-- Bootstrap core JavaScript-->
<script src="/resources/js/admin/jquery.js"></script>
<script src="/resources/js/admin/bootstrap.js"></script>

<!-- Core plugin JavaScript-->
<%--<script src="/resources/js/admin/easing.js"></script>--%>

<!-- Custom scripts for all pages-->
<script src="/resources/js/admin/admin.js"></script>

<!-- Page level plugins -->
<script src="/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="/js/demo/chart-area-demo.js"></script>
<script src="/js/demo/chart-pie-demo.js"></script>
<script src="/js/demo/chart-bar-demo.js"></script>
</body>
</html>