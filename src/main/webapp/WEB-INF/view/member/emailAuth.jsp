<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>회원가입</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/common.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100..900&display=swap"
          rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

    <style>
        .wrap {
            position: relative;
            margin: 90px auto;
        }

        .sub_title {
            display: block;
            text-align: center;
            font-family: "Noto Sans KR", sans-serif;
            font-size: 28px;
            line-height: 50px;
            cursor: pointer;
        }

        .register_form {
            display: block;
            border: 0px;
            position: relative;
            margin: 20px auto;
            height: 150px;
            width: 700px;
        }

        .register_form > ul {
            padding-left: 0px;
        }

        .register_form > ul > li {
            justify-content: center;
            align-items: center;
            text-align: center;
            list-style-type: none;
        }

        .register_form > ul > li input[type='text'], input[type='password'] {
            font-family: "Noto Sans KR", sans-serif;
            font-size: 14px;
            height: 40px;
            width: 450px;
            border-radius: 4px;
            border: 2px solid #B5B5B5;
            padding-left: 15px;
            margin: 20px auto;
        }

        #email {
            width: 300px;
        }

        .check_btn {
            font-family: "Noto Sans KR", sans-serif;
            font-size: 15px;
            height: 45px;
            width: 145px;
            border-radius: 4px;
            border: 2px solid #B5B5B5;
            cursor: pointer;
        }

        .check_btn:hover {
            background-color: #FFC2C2;
            border: 0px;
            color: #FFFFFF;
            font-weight: 600;

        }

        .register_btn {
            display: block;
            text-align: center;

            font-family: "Noto Sans KR", sans-serif;
            font-weight: bold;
            font-size: 20px;

            cursor: pointer;
            width: 350px;
            margin: 35px auto;
            padding: 10px 0px;

            color: #FFFFFF;
            border-radius: 7px;
            border: 0px;
            background-color: #FFC2C2;
        }

        .register_btn:hover{
            background-color: black;
        }


        hr {
            width: 60%;
            margin: 0px auto 35px;
            border: 1px solid #B5B5B5;
        }

        p {
            display: block;
            text-align: center;

            font-family: "Noto Sans KR", sans-serif;
            font-size: 12px;
            font-weight: bold;
            margin: 0;
            padding: 0;

        }

        #check_fail {
            color: red;
            visibility: collapse ;

        }

        #check_success {
            color: forestgreen;
            visibility: collapse ;
        }

        .check_result {
            height: 10px;
            margin-top: -10px;
            padding: 0;
        }

    </style>
    <script>
        const pwdImg = document.querySelector('.pwd_info');
        const pwdInfo = document.querySelector('.info');

        function loginCheck() {
            if ($("#email").val() == '') {
                alert("이메일을 입력해주세요");
                $("#email").focus();
                return false;
            }
            if ($("#pwd").val() == '') {
                alert("비밀번호를 입력해 주세요");
                $("#pwd").focus();
                return false;
            }
            if ($("#pwd").val() == '') {
                alert("내용을 모두 입력하세요");
                $("#pwd").focus();
                return false;
            }
        }
    </script>
</head>

<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main">
    <div class="sticker1"></div>
    <div style="width: 100%; overflow: hidden;">
        <h3 clss = 'title'>이메일 인증</h3>
        <hr>
        작성하신 이메일로 인증 링크 발송되었습니다.
        전송된 링크를 눌러 인증을 진행해주세요. ( •̀ ω •́ )✧
    </div>
    <div class="sticker2"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>

</html>