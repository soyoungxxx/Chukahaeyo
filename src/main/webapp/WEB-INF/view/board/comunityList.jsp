<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/reset.css" />
    <link rel="stylesheet" href="/resources/css/common.css" />
    <link rel="stylesheet" href="/resources/css/board/board-list.css" />

    <!--font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100..900&display=swap"
          rel="stylesheet">
    <!--font-->
</head>

<body class="body">
<%@ include file="/WEB-INF/view/include/header.jsp" %>


<main class="main">
    <div class="sticker1"></div>


    <div style="width: 100%; display: flex; flex-direction: row; justify-content: center;">
        <!-- //여기에 태그 만들면됨 -->
        <div class="container">

            <div class="community-logo"></div>
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
                        <th class="read-cnt">조회수</th>
                        <th class="like">좋아요</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="list-data">
                        <th class="no">1123</th>
                        <th class="title">제목 입니다.</th>
                        <th class="writer">서현오</th>
                        <th class="regdate">24.01.20</th>
                        <th class="read-cnt">4</th>
                        <th class="like">50</th>
                    </tr>
                    <tr class="list-data">
                        <th class="no">1123</th>
                        <th class="title">제목 입니다.</th>
                        <th class="writer">서현오</th>
                        <th class="regdate">24.01.20</th>
                        <th class="read-cnt">4</th>
                        <th class="like">50</th>
                    </tr>
                    <tr class="list-data">
                        <th class="no">1123</th>
                        <th class="title">제목 입니다.</th>
                        <th class="writer">서현오</th>
                        <th class="regdate">24.01.20</th>
                        <th class="read-cnt">4</th>
                        <th class="like">50</th>
                    </tr>
                    <tr class="list-data">
                        <th class="no">1123</th>
                        <th class="title">제목 입니다.</th>
                        <th class="writer">서현오</th>
                        <th class="regdate">24.01.20</th>
                        <th class="read-cnt">4</th>
                        <th class="like">50</th>
                    </tr>
                    <tr class="list-data">
                        <th class="no">1123</th>
                        <th class="title">제목 입니다.</th>
                        <th class="writer">서현오</th>
                        <th class="regdate">24.01.20</th>
                        <th class="read-cnt">4</th>
                        <th class="like">50</th>
                    </tr>
                    <tr class="list-data">
                        <th class="no">1123</th>
                        <th class="title">제목 입니다.</th>
                        <th class="writer">서현오</th>
                        <th class="regdate">24.01.20</th>
                        <th class="read-cnt">4</th>
                        <th class="like">50</th>
                    </tr>
                    <tr class="list-data">
                        <th class="no">1123</th>
                        <th class="title">제목 입니다.</th>
                        <th class="writer">서현오</th>
                        <th class="regdate">24.01.20</th>
                        <th class="read-cnt">4</th>
                        <th class="like">50</th>
                    </tr>
                    <tr class="list-data">
                        <th class="no">1123</th>
                        <th class="title">제목 입니다.</th>
                        <th class="writer">서현오</th>
                        <th class="regdate">24.01.20</th>
                        <th class="read-cnt">4</th>
                        <th class="like">50</th>
                    </tr>
                    <tr class="list-data">
                        <th class="no">1123</th>
                        <th class="title">제목 입니다.</th>
                        <th class="writer">서현오</th>
                        <th class="regdate">24.01.20</th>
                        <th class="read-cnt">4</th>
                        <th class="like">50</th>
                    </tr>
                    <tr class="list-data">
                        <th class="no">1123</th>
                        <th class="title">제목 입니다.</th>
                        <th class="writer">서현오</th>
                        <th class="regdate">24.01.20</th>
                        <th class="read-cnt">4</th>
                        <th class="like">50</th>
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

                <li><a href="#;"> < </a></li>
                <li><a href='#;' class='current'>1</a></li>
                <li><a href='#;'>2</a></li>
                <li><a href='#;'>3</a></li>
                <li><a href='#;'>4</a></li>
                <li><a href='#;'>5</a></li>
                <li><a href='#;'>6</a></li>
                <li><a href='#;'>7</a></li>
                <li><a href='#;'>8</a></li>
                <li><a href='#;'>9</a></li>
                <li><a href='#;'>10</a></li>
                <li><a href="#;"> > </a></li>

            </ul>






        </div>





    </div>


    <div class="sticker2"></div>


</main>

<%@ include file="/WEB-INF/view/include/footer.jsp" %>




</body>

</html>