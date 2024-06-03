<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>회원가입</title>
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

        .register_form {
            display: block;
            border: 0px;
            position: relative;
            margin: 20px auto;
            height: 150px;
        }

        .register_form > ul > li {
            display: block;
            text-align: center;
            list-style-type: none;
            positon: relative;
            padding-right: 60px;
        }


        .register_form > ul > li > input[type='text'], input[type='password'] {
            font-family: "Noto Sans KR", sans-serif;
            font-size: 14px;
            height: 34px;
            width: 300px;
            border-radius: 4px;
            border: 2px solid #B5B5B5;
            padding-left: 15px;
            margin: 5px auto;
        }

        #email {
            width: 200px;
        }

        .check-btn{
            font-family: "Noto Sans KR", sans-serif;
            font-size: 15px;
            height: 40px;
            width: 100px;
            border-radius: 4px;
            border: 2px solid #B5B5B5;
        }

        .register_btn {
            display: block;
            text-align: center;

            font-family: "Noto Sans KR", sans-serif;
            font-weight: bold;
            font-size: 20px;

            cursor: pointer;
            width: 320px;
            margin: 20px auto;
            padding: 7px 0px;

            color: #FFFFFF;
            border-radius: 7px;
            border: 0px;
            background-color: #FFC2C2;
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
            font-size: 14px;
        }

    </style>
    <script>
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
    <div style="width: 100%;">
        <form action="register" method="post" onsubmit="return loginCheck();">
            <div class="wrap">
                <h3 class="sub_title">회원가입</h3>

                <hr>

                <div class="member">
                    <div class="box">
                        <div class="register_form">
                            <ul>
                                <li>
                                    <input type="text" id="email" name="email" placeholder="이메일">
                                    <input type="button" class="check-btn" value="중복확인">
                                </li>
                                <li>
                                    <input type="password" id="pwd" name="pwd" placeholder="비밀번호">
                                    <p>비밀번호는 영어 대소문자와 숫자를 포함해 8자리 이상으로 작성해주세요.</p>
                                </li>
                                <li>
                                    <input type="password" id="pwd_check" name="email" placeholder="비밀번호 확인">
                                    <p>비밀번호가 확인되었습니다.</p>
                                    <p>비밀번호가 일치하지 않습니다!</p>. git rm -r --cached
                                </li>
                                <li>
                                    <input type="text" id="name" name="email" placeholder="이름">
                                </li>
                            </ul>
                            <div class="btn">
                                <input type="submit" value="가입하기" class="register_btn"/>
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