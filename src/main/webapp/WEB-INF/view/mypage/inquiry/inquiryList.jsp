<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>1:1 문의</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css" />
    <link rel="stylesheet" href="/resources/css/pageFrame/mypage.css" />
    <link rel="stylesheet" href="/resources/css/board/inquiryList.css" />
    <link rel="stylesheet" href="/resources/css/pageFrame/reset.css" />
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

                        <div class="inquiry-logo">문의내역</div>
                        <div class="search">
                            <form>
                                <select class="selectbox" name="">
                                    <option value="">전체</option>
                                    <option value="">제목+내용</option>
                                    <option value="">작성자</option>
                                </select>
                                <input class="textbox" type="text" placeholder="검색어" name="" />
                                <input class="submitbox" type="button" value="검색" />
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
                                <tr class="list-data">
                                    <th class="no">1123</th>
                                    <th class="title">제목 입니다.</th>
                                    <th class="writer">서현오</th>
                                    <th class="regdate">24.01.20</th>
                                    <th class="is-answered"><img class="is-answered-img" src="/resources/img/board/checked.png"></th>
                                </tr>
                                <tr class="list-data">
                                    <th class="no">1123</th>
                                    <th class="title">제목 입니다.</th>
                                    <th class="writer">서현오</th>
                                    <th class="regdate">24.01.20</th>
                                    <th class="is-answered"><img class="is-answered-img" src="/resources/img/board/checked.png"></th>
                                </tr>
                                <tr class="list-data">
                                    <th class="no">1123</th>
                                    <th class="title">제목 입니다.</th>
                                    <th class="writer">서현오</th>
                                    <th class="regdate">24.01.20</th>
                                    <th class="is-answered"><img class="is-answered-img" src="/resources/img/board/checked.png"></th>
                                </tr>
                                <tr class="list-data">
                                    <th class="no">1123</th>
                                    <th class="title">제목 입니다.</th>
                                    <th class="writer">서현오</th>
                                    <th class="regdate">24.01.20</th>
                                    <th class="is-answered"><img class="is-answered-img" src="/resources/img/board/checked.png"></th>
                                </tr>
                                <tr class="list-data">
                                    <th class="no">1123</th>
                                    <th class="title">제목 입니다.</th>
                                    <th class="writer">서현오</th>
                                    <th class="regdate">24.01.20</th>
                                    <th class="is-answered"><img class="is-answered-img" src="/resources/img/board/checked.png"></th>
                                </tr>
                                <tr class="list-data">
                                    <th class="no">1123</th>
                                    <th class="title">제목 입니다.</th>
                                    <th class="writer">서현오</th>
                                    <th class="regdate">24.01.20</th>
                                    <th class="is-answered"><img class="is-answered-img" src="/resources/img/board/checked.png"></th>
                                </tr>
                                <tr class="list-data">
                                    <th class="no">1123</th>
                                    <th class="title">제목 입니다.</th>
                                    <th class="writer">서현오</th>
                                    <th class="regdate">24.01.20</th>
                                    <th class="is-answered"></th>
                                </tr>
                                <tr class="list-data">
                                    <th class="no">1123</th>
                                    <th class="title">제목 입니다.</th>
                                    <th class="writer">서현오</th>
                                    <th class="regdate">24.01.20</th>
                                    <th class="is-answered"><img class="is-answered-img" src="/resources/img/board/checked.png"></th>
                                </tr>
                                <tr class="list-data">
                                    <th class="no">1123</th>
                                    <th class="title">제목 입니다.</th>
                                    <th class="writer">서현오</th>
                                    <th class="regdate">24.01.20</th>
                                    <th class="is-answered"><img class="is-answered-img" src="/resources/img/board/checked.png"></th>
                                </tr>
                                <tr class="list-data">
                                    <th class="no">1123</th>
                                    <th class="title">제목 입니다.</th>
                                    <th class="writer">서현오</th>
                                    <th class="regdate">24.01.20</th>
                                    <th class="is-answered"><img class="is-answered-img" src="/resources/img/board/checked.png"></th>
                                </tr>
                                <tr class="list-no-data">
                                    <td class="no-data" colspan='6'>작성글이 없습니다.</td>
                                </tr>
                                </tbody>
                            </table>

                        </div>
                        <div class="write-button">
                            글쓰기
                        </div>

                        <ul class='paging'>

                            <li><a href="#">
                                < </a>
                            </li>
                            <li><a href='#' class='current'>1</a></li>
                            <li><a href='#'>2</a></li>
                            <li><a href='#'>3</a></li>
                            <li><a href='#'>4</a></li>
                            <li><a href='#'>5</a></li>
                            <li><a href='#'>6</a></li>
                            <li><a href='#'>7</a></li>
                            <li><a href='#'>8</a></li>
                            <li><a href='#'>9</a></li>
                            <li><a href='#'>10</a></li>
                            <li><a href="#"> > </a></li>

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