<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>로그인</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/img/common.css"/>
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

        .login_form {
            display: block;
            border: 0px;
            position: relative;
            margin: 20px auto;
            height: 150px;
        }

        .login_form > ul > li {
            display: block;
            text-align: center;
            list-style-type: none;
            positon: relative;
            padding-right: 60px;
        }

        .login_img {
            width: 30px;
            height: 30px;
            padding-top: 5px;
        }

        .login_form > ul > li > input {
            font-family: "Noto Sans KR", sans-serif;
            font-size: 14px;
            height: 40px;
            margin: 10px 0px;
            width: 300px;
            border-radius: 4px;
            border: 2px solid #B5B5B5;
            padding-left: 15px;
        }

        .login_btn {
            display: block;
            text-align: center;

            font-family: "Noto Sans KR", sans-serif;
            font-weight: bold;
            font-size: 20px;

            cursor: pointer;
            width: 300px;
            margin: 20px auto;
            padding: 7px 0px;

            color: #FFFFFF;
            border-radius: 7px;
            border: 0px;
            background-color: #FFC2C2;
        }

        .register > hr {
            width: 60%;
            margin: 70px auto 35px;
            border: 1px solid #B5B5B5;
        }

        .register > p {
            display: block;
            text-align: center;

            font-family: "Noto Sans KR", sans-serif;
            font-size: 14px;
        }

        .register_btn {
            display: block;
            text-align: center;

            font-family: "Noto Sans KR", sans-serif;
            font-weight: 500;
            font-size: 20px;
            text-decoration: none;

            cursor: pointer;
            width: 300px;
            margin: 0px auto;
            padding: 7px 0px;

            color: #000000;
            border: 1px solid #000000;
            background-color: #FFFFFF;
            border-radius: 7px;
        }
    </style>


    <script>
        function loginCheck() {
            if ($("#userEmail").val() == '') {
                alert("이메일을 입력해 주세요");
                $("#userEmail").focus();
                return false;
            }
            if ($("#userPwd").val() == '') {
                alert("비밀번호를 입력해 주세요");
                $("#userPwd").focus();
                return false;
            }

            // 정규 표현식 넣어서 수정하기
            // if (true) {
            //     alert("비밀번호를 형식이 올바르지 않습니다. (영어 대소문자, 숫자 포함 8자리 이상)");
            //     $("#pwd").focus();
            //     return false;
            // }
        }
    </script>
</head>

<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main">
    <div class="sticker1"></div>
    <div style="width: 100%;">
        <form action="login" method="post" onsubmit="return loginCheck();">
            <div class="wrap">
                <h3 class="sub_title">Login</h3>
                <div class="member">
                    <div class="box">
                        <div class="login_form">
                            <ul>
                                <li>
                                    <img src="/resources/img/login-user.png" class="login_img">
                                    <input type="text" id="userEmail" name="userEmail" placeholder="이메일">
                                </li>
                                <li>
                                    <img src="/resources/img/login-lock.png" class="login_img">
                                    <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호">
                                </li>
                            </ul>
                            <div class="btn">
                                <input type="submit" value="로그인" class="login_btn"/>
                            </div>
                        </div>

                        <div class="register">
                            <hr>
                            <p>계정이 없으신가요?</p>
                            <div>
                                <a href="register" class="register_btn">회원가입</a>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </form>
    </div>
    <div class="sticker2"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>

</html>