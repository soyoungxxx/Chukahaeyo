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

        #userEmail {
            width: 300px;
        }

        .check_btn {
            display: block;
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
            if ($("#userEmail").val() == '') {
                alert("이메일을 입력해주세요");
                $("#userEmail").focus();
                return false;
            }
            if ($("#userPwd").val() == '') {
                alert("비밀번호를 입력해 주세요");
                $("#userPwd").focus();
                return false;
            }
            if ($("#pwdCheck").val() == '') {
                alert("비밀번호를 한번 더 입력해주세요");
                $("#pwdCheck").focus();
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
        <form action="register" method="post" onsubmit="return loginCheck();">
            <div class="wrap">
                <h3 class="sub_title">회원가입</h3>
                <hr>
                <div class="member">
                    <div class="box">
                        <div class="register_form">
                            <ul>
                                <li>
                                    <input type="text" id="userEmail" name="userEmail" placeholder="이메일">
                                    <span class="email_check">
                                        <a href="javascript:checkDupl();" class="check_btn" id="emailCheck">중복확인</a>
                                    </span>
                                    <input type="button" class="check_btn" value="중복확인">
                                </li>
                                <li>
                                    <input type="password" id="userPwd" name="userPwd"
                                           placeholder="비밀번호(영어 대소문자, 숫자 포함 8자리 이상)">
                                </li>
                                <li>
                                    <input type="password" id="pwdCheck" name="pwdCheck" placeholder="비밀번호 확인">
                                </li>
                                <div class="check_result">
                                    <p id="check_success">비밀번호가 확인되었습니다.</p>
                                    <p id="check_fail">비밀번호가 일치하지 않습니다!</p>
                                </div>
                                <li>
                                    <input type="text" id="userName" name="userName" placeholder="이름">
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