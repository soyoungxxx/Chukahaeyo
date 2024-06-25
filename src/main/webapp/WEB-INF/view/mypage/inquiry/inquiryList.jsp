<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>축하해요</title>
    <link rel="icon" href="/resources/img/logo/favicon.png"/>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/mypage.css"/>
    <link rel="stylesheet" href="/resources/css/board/inquiryList.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/reset.css"/>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                        <h3>문의 내역</h3>
                        <div class="write-button">
                            <a href="write">1:1 문의하기</a>
                        </div>
                        <div class="search">
                            <form action="list">
                                <select class="selectbox" name="querytype">
                                    <option value="all" <c:if test="${inquiryVO.querytype == 'all'}">selected</c:if>>
                                        전체
                                    </option>
                                    <option value="titlecontent"
                                            <c:if test="${inquiryVO.querytype == 'titlecontent'}">selected</c:if>>제목+내용
                                    </option>
                                    <option value="writer"
                                            <c:if test="${inquiryVO.querytype == 'writer'}">selected</c:if>>작성자
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


                                <c:forEach var="vo" items="${map.list}" varStatus="status">
                                    <tr class="list-data">
                                        <th class="no">${status.index+1}</th>
                                        <th class="title"><a
                                                href="detail?inquiryID=${vo.inquiryID}&query=${inquiryVO.query}&querytype=${inquiryVO.querytype}&page=${inquiryVO.page}">${vo.inquiryQuestionTitle}</a>
                                        </th>
                                        <th class="writer">${vo.memberName}</th>
                                        <th class="regdate"><fmt:formatDate value="${vo.inquiryPostDate }"
                                                                            pattern="YYYY.MM.dd"/></th>
                                        <th class="is-answered">
                                            <c:if test="${vo.adminID != 0}">
                                                <img class="is-answered-img" src="/resources/img/board/checked.png">
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
                                    <a href="list?page=${map.startPage-1 }&querytype=${inquiryVO.querytype}&query=${inquiryVO.query}">
                                        < </a></li>
                            </c:if>
                            <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
                                <c:if test="${p == inquiryVO.page}">
                                    <li><a href='#;' class='current'>${p}</a></li>
                                </c:if>
                                <c:if test="${p != inquiryVO.page}">
                                    <li>
                                        <a href='list?page=${p}&querytype=${inquiryVO.querytype}&query=${inquiryVO.query}'>${p}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${map.isNext }">
                                <li>
                                    <a href="list?page=${map.endPage+1 }&querytype=${inquiryVO.querytype}&query=${inquiryVO.query}">
                                        > </a></li>
                            </c:if>
                        </ul>
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