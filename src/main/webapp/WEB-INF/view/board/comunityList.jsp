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
    <link rel="stylesheet" href="/resources/css/pageFrame/reset.css" />
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css" />
    <link rel="stylesheet" href="/resources/css/board/board-list.css" />

    <!--font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100..900&display=swap"
          rel="stylesheet">
    <!--font-->
</head>

<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>


<main class="main">
    <div class="sticker1"></div>


    <div style="width: 100%; display: flex; flex-direction: row; justify-content: center;">
        <!-- //여기에 태그 만들면됨 -->
        <div class="container">

            <div class="community-logo"></div>
            <div class="search">
                <form action="list" >
                    <select class="selectbox" name="querytype">
                        <option value="all" <c:if test="${communityVO.querytype == 'all'}">selected</c:if>>전체</option>
                        <option value="titlecontent" <c:if test="${communityVO.querytype == 'titlecontent'}">selected</c:if>>제목+내용</option>
                        <option value="writer" <c:if test="${communityVO.querytype == 'writer'}">selected</c:if>>작성자</option>
                    </select>
                    <input class="textbox" type="text" placeholder="검색어" name="query" value="${communityVO.query}" />
                    <input class="submitbox" type="submit" value="검색" />
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
                        <th class="read-cnt">조회수</th>
                        <th class="like">좋아요</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="vo" items="${map.list}">
                        <tr class="list-data">
                            <th class="no">${vo.commID}</th>
                            <th class="title"><a href="detail?commID=${vo.commID}&query=${communityVO.query}&querytype=${communityVO.querytype}&page=${communityVO.page}">${vo.commTitle}</a></th>
                            <th class="writer">${vo.memberName}</th>
                            <th class="regdate"><fmt:formatDate value="${vo.commPostDate }" pattern="YYYY.MM.dd"/></th>
                            <th class="read-cnt">${vo.commViewCount}</th>
                            <th class="like">${vo.boardLike}</th>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty map.list}">
                        <tr class="list-no-data">
                            <td class="no-data" colspan='6'>작성글이 없습니다.</td>
                        </tr>
                    </c:if>

                    </tbody>
                </table>

            </div>
            <c:if test="${not empty memberID}">
                <div class="write-button">
                    <a href="write">글쓰기</a>
                </div>
            </c:if>











            <ul class='paging'>
                <c:if test="${map.isPrev }">
                    <li><a href="list?page=${map.startPage-1 }&querytype=${communityVO.querytype}&query=${communityVO.query}"> < </a></li>
                </c:if>
                <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
                    <c:if test="${p == communityVO.page}">
                        <li><a href='#;' class='current'>${p}</a></li>
                    </c:if>
                    <c:if test="${p != communityVO.page}">
                        <li><a href='list?page=${p}&querytype=${communityVO.querytype}&query=${communityVO.query}'>${p}</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${map.isNext }">
                    <li><a href="list?page=${map.endPage+1 }&querytype=${communityVO.querytype}&query=${communityVO.query}"> > </a></li>
                </c:if>
            </ul>

        </div>





    </div>


    <div class="sticker2"></div>


</main>

<%@ include file="/WEB-INF/view/include/footer.jsp" %>




</body>

</html>