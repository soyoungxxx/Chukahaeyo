<%--
  Created by IntelliJ IDEA.
  User: joyebin
  Date: 5/30/24
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>Admin 축하해요</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/common.css" />
    <link rel="stylesheet" href="/resources/css/admin.css" />
    <link rel="stylesheet" href="/resources/css/board/allInquiryList.css" />
    <link rel="stylesheet" href="/resources/css/reset.css" />
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

                        <div class="inquiry-logo">1:1 문의관리</div>
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
                                    <th class="is-answered"><img class="is-answered-img" src="/img/checked.png">
                                    </th>
                                </tr>
                                <tr class="list-data">
                                    <th class="no">1123</th>
                                    <th class="title">제목 입니다.</th>
                                    <th class="writer">서현오</th>
                                    <th class="regdate">24.01.20</th>
                                    <th class="is-answered"><img class="is-answered-img" src="/img/checked.png">
                                    </th>
                                </tr>
                                <tr class="list-data">
                                    <th class="no">1123</th>
                                    <th class="title">제목 입니다.</th>
                                    <th class="writer">서현오</th>
                                    <th class="regdate">24.01.20</th>
                                    <th class="is-answered"><img class="is-answered-img" src="/img/checked.png">
                                    </th>
                                </tr>
                                <tr class="list-data">
                                    <th class="no">1123</th>
                                    <th class="title">제목 입니다.</th>
                                    <th class="writer">서현오</th>
                                    <th class="regdate">24.01.20</th>
                                    <th class="is-answered"><img class="is-answered-img" src="/img/checked.png">
                                    </th>
                                </tr>
                                <tr class="list-data">
                                    <th class="no">1123</th>
                                    <th class="title">제목 입니다.</th>
                                    <th class="writer">서현오</th>
                                    <th class="regdate">24.01.20</th>
                                    <th class="is-answered"><img class="is-answered-img" src="/img/checked.png">
                                    </th>
                                </tr>
                                <tr class="list-data">
                                    <th class="no">1123</th>
                                    <th class="title">제목 입니다.</th>
                                    <th class="writer">서현오</th>
                                    <th class="regdate">24.01.20</th>
                                    <th class="is-answered"><img class="is-answered-img" src="/img/checked.png">
                                    </th>
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
                                    <th class="is-answered"><img class="is-answered-img" src="/img/checked.png">
                                    </th>
                                </tr>
                                <tr class="list-data">
                                    <th class="no">1123</th>
                                    <th class="title">제목 입니다.</th>
                                    <th class="writer">서현오</th>
                                    <th class="regdate">24.01.20</th>
                                    <th class="is-answered"><img class="is-answered-img" src="/img/checked.png">
                                    </th>
                                </tr>
                                <tr class="list-data">
                                    <th class="no">1123</th>
                                    <th class="title">제목 입니다.</th>
                                    <th class="writer">서현오</th>
                                    <th class="regdate">24.01.20</th>
                                    <th class="is-answered"><img class="is-answered-img" src="/img/checked.png">
                                    </th>
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
</main>
</body>

</html>