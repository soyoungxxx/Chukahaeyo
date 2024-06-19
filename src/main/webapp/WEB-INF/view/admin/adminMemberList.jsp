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

    <link href="/resources/css/admin/all.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <link href="/resources/css/admin/admin.css" rel="stylesheet">
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

                    <!-- Page Heading -->
                    <!-- <h1 class="h3 mb-2 text-gray-800"> 주문목록</h1> -->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원목록</h6>
                        </div>
                        <div class="card-body">
                            <div class = "member-top">
                                <p id="selected-count">0개 항목 선택</p>
                                <div class="member-btns">
                                    <input type="button" value="전체 선택" class="select-btn" id="checking-all-member"
                                           onclick="selectAll();">
                                    <input type="button" value="전체 취소" class="select-btn" id="unchecking-all-member"
                                           onclick="deselectAll();">
                                    <input type="button" value="회원 삭제" class="select-btn" id="delete-member" onclick="deleteMembers();">
                                </div>

                            </div>

                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th>선택</th>
                                        <th>이름</th>
                                        <th>이메일</th>
                                        <th>가입일</th>
                                        <th>이메일 인증 여부</th>
                                        <th>계정 상태</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach var="member" items="${memberList}">
                                        <tr>
                                            <td class="member-select">
                                                <input type="checkbox" id="checkbox${member.memberID}"
                                                       class="member-select-btn" onclick="updateSelectedCount();">
                                                <label for="checkbox${member.memberID}"></label>
                                            </td>
                                            <td>${member.memberName}</td>
                                            <td>${member.memberEmail}</td>
                                            <td>
                                                <fmt:formatDate pattern="yyyy.MM.dd"
                                                                value="${member.memberRegisterDate}"/>
                                            </td>
                                            <c:if test="${member.memberAuth=='false'}">
                                                <td class="auth-wait">인증대기</td>
                                            </c:if>
                                            <c:if test="${member.memberAuth=='true'}">
                                                <td class="auth-complete">인증완료</td>
                                            </c:if>

                                            <c:if test="${member.memberAuth=='false'&&member.memberWithdraw=='false'}">
                                                <td class="auth-wait">대기회원</td>
                                            </c:if>
                                            <c:if test="${member.memberAuth=='true'&&member.memberWithdraw=='false'}">
                                                <td class="not-active">일반회원</td>
                                            </c:if>
                                            <c:if test="${member.memberAuth=='true'&&member.memberWithdraw=='true'}">
                                                <td class="withdraw-member">탈퇴회원</td>
                                            </c:if>

                                        </tr>
                                    </c:forEach>


                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

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

        $.ajax({
            url: '/admin/memberDelete',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ memberIds: selectedMembers }),
            success: function(response) {
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