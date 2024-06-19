<%--
  Created by IntelliJ IDEA.
  User: joyebin
  Date: 5/30/24
  Time: 3:50 PM
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
    <link rel="stylesheet" href="/resources/css/board/allInquiryList.css" />
    <link rel="stylesheet" href="/resources/css/pageFrame/reset.css" />
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

                        <div class="inquiry-logo">문의내역</div>
                        <div class="search">
                            <form action="list" >
                                <select class="selectbox" name="querytype">
                                    <option value="all" <c:if test="${inquiryVO.querytype == 'all'}">selected</c:if>>전체</option>
                                    <option value="titlecontent" <c:if test="${inquiryVO.querytype == 'titlecontent'}">selected</c:if>>제목+내용</option>
                                    <option value="writer" <c:if test="${inquiryVO.querytype == 'writer'}">selected</c:if>>작성자</option>
                                </select>
                                <input class="textbox" type="text" placeholder="검색어" name="query" value="${inquiryVO.query}"/>
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
                                        <th class="title"><a href="write?inquiryID=${vo.inquiryID}&query=${inquiryVO.query}&querytype=${inquiryVO.querytype}&page=${inquiryVO.page}">${vo.inquiryQuestionTitle}</a></th>
                                        <th class="writer">${vo.memberName}</th>
                                        <th class="regdate"><fmt:formatDate value="${vo.inquiryPostDate }" pattern="YYYY.MM.dd"/></th>
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
                                <li><a href="list?page=${map.startPage-1 }&querytype=${inquiryVO.querytype}&query=${inquiryVO.query}"> < </a></li>
                            </c:if>
                            <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
                                <c:if test="${p == inquiryVO.page}">
                                    <li><a href='#;' class='current'>${p}</a></li>
                                </c:if>
                                <c:if test="${p != inquiryVO.page}">
                                    <li><a href='list?page=${p}&querytype=${inquiryVO.querytype}&query=${inquiryVO.query}'>${p}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${map.isNext }">
                                <li><a href="list?page=${map.endPage+1 }&querytype=${inquiryVO.querytype}&query=${inquiryVO.query}"> > </a></li>
                            </c:if>
                        </ul>






                    </div>



















                </div>
            </div>
        </div>
    </div>
</main>
</body>

</html>