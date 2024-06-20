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

    <%--    <link rel="stylesheet" href="/resources/css/pageFrame/admin.css" />--%>
    <link rel="stylesheet" href="/resources/css/board/allInquiryList.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/reset.css"/>
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
            document.getElementById("allInquiryList").className = 'nav-item active';
        </script>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <%@ include file="/WEB-INF/view/include/adminTopbar.jsp" %>

            <!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <div class="card shadow mb-4">

                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">문의내역</h6>
                        </div>

                        <div class="card-body">
                            <div class="container">

                                <div class="search">
                                    <form action="list">
                                        <select class="sort-box" name="sort">
                                            <option value="all"
                                                    <c:if test="${inquiryVO.sort == 'all'}">selected</c:if>>전체
                                            </option>
                                            <option value="unanswered"
                                                    <c:if test="${inquiryVO.sort == 'unanswered'}">selected</c:if>>
                                                답변미완료
                                            </option>
                                            <option value="answered"
                                                    <c:if test="${inquiryVO.sort == 'answered'}">selected</c:if>>
                                                답변완료
                                            </option>
                                        </select>
                                        <select class="selectbox" name="querytype">
                                            <option value="all"
                                                    <c:if test="${inquiryVO.querytype == 'all'}">selected</c:if>>전체
                                            </option>
                                            <option value="titlecontent"
                                                    <c:if test="${inquiryVO.querytype == 'titlecontent'}">selected</c:if>>
                                                제목+내용
                                            </option>
                                            <option value="writer"
                                                    <c:if test="${inquiryVO.querytype == 'writer'}">selected</c:if>>
                                                작성자
                                            </option>
                                        </select>
                                        <input class="textbox" type="text" placeholder="검색어" name="query"
                                               value="${inquiryVO.query}"/>
                                        <input class="submitbox" type="submit" value="검색"/>
                                    </form>
                                </div>

                                <div class="list">
                                    <table class="list-board">
                                        <thead>
                                        <tr class="list-title">
                                            <th class="no">NO</th>
                                            <th class="title">제목</th>
                                            <th class="writer">글쓴이</th>
                                            <th class="regdate">작성일자</th>
                                            <th class="is-answered">답변여부</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:if test="${empty map.list}">
                                            <tr class="list-no-data">
                                                <td class="no-data" colspan='6'>작성글이 없습니다.</td>
                                            </tr>
                                        </c:if>
                                        <c:forEach var="vo" items="${map.list}">
                                            <tr class="list-data">
                                                <th class="no">${vo.inquiryID}</th>
                                                <th class="title"><a
                                                        href="write?inquiryID=${vo.inquiryID}&query=${inquiryVO.query}&querytype=${inquiryVO.querytype}&page=${inquiryVO.page}">${vo.inquiryQuestionTitle}</a>
                                                </th>
                                                <th class="writer">${vo.memberName}</th>
                                                <th class="regdate"><fmt:formatDate value="${vo.inquiryPostDate }"
                                                                                    pattern="YYYY.MM.dd"/></th>
                                                <th class="is-answered">
                                                    <c:if test="${vo.adminID != 0}">
                                                        <img class="is-answered-img"
                                                             src="/resources/img/board/checked.png">
                                                    </c:if>
                                                </th>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <ul class='paging'>
                                    <c:if test="${map.isPrev }">
                                        <li>
                                            <a href="list?page=${map.startPage-1 }&querytype=${inquiryVO.querytype}&query=${inquiryVO.query}&sort=${inquiryVO.sort}">
                                                < </a></li>
                                    </c:if>
                                    <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
                                        <c:if test="${p == inquiryVO.page}">
                                            <li><a href='#;' class='current'>${p}</a></li>
                                        </c:if>
                                        <c:if test="${p != inquiryVO.page}">
                                            <li>
                                                <a href='list?page=${p}&querytype=${inquiryVO.querytype}&query=${inquiryVO.query}&sort=${inquiryVO.sort}'>${p}</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${map.isNext }">
                                        <li>
                                            <a href="list?page=${map.endPage+1 }&querytype=${inquiryVO.querytype}&query=${inquiryVO.query}&sort=${inquiryVO.sort}">
                                                > </a></li>
                                    </c:if>
                                </ul>
                            </div>

                        </div>
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

    function deleteMembers() {
        var selectedMembers = [];
        $('.member-select-btn:checked').each(function () {
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
            success: function () {
                alert("회원 삭제가 완료되었습니다.");
                location.reload();
            },
            error: function (xhr, status, error) {
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