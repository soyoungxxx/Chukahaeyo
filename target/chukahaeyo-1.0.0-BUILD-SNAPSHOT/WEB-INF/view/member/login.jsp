<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>축하해요 로그인</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Kantumruy+Pro:ital,wght@0,100..700;1,100..700&display=swap" rel="stylesheet">

    <style>
        .sub_title {
            font-size: 28px;
            line-height: 50px;
            cursor: pointer; <!-- 추후 로그인 누르면 다시 로딩 되게 -->
            text-align: center;
        }

        .login_form {
            border: 0px;
            position: relative;
            margin: 20px auto;
            width: 20%;
            height: 100px;
            line-height: 30px; <!-- 칸 사이 거리 -->
        }

        .login_form > ul > li{
            list-style: none;
        }

        .btn{
            position: relative;
            margin: 20px 0;
            text-align: center;
            overflow: hidden;

            font-size: 20px;
            text-decoration: none !important;
            display: inline-block;
            vertical-align: baseline;

            cursor: pointer;
            padding: 4px 20px;
            min-width: 64px;
            color: #fff !important;

            border-radius: 7px;
        }

        .login_btn{

            background-color: #221f1f;
        }

        .register_btn {

            background-color: #221f1f;
        }

    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
        function loginCheck() {
            if ($("#email").val() == '') {
                alert("이메일을 입력해 주세요");
                $("#email").focus();
                return false;
            }
            if ($("#pwd").val() == '') {
                alert("비밀번호를 입력해 주세요");
                $("#pwd").focus();
                return false;
            }
        }
    </script>
</head>
<body>
<div class="wrap">
    <%@ include file="/WEB-INF/view/include/header.jsp" %>

    <form action="login.do" method="post"  onsubmit="return loginCheck();"> <!-- id, name 추가하기 -->
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">로그인</h3>

                <div class="member">
                    <div class="box">
                        <fieldset class="login_form">
                            <ul>
                                <li><input type="text" id="email" name="email" placeholder="이메일"></li>
                                <li><input type="password" id="pwd" name="pwd" placeholder="비밀번호"></li>
                            </ul>
                            <div class="btn">
                                <input type="submit" value="로그인" alt="로그인" />
                            </div>
                        </fieldset>

                        <hr>

                        <div class="btnSet clear">
                            <div>
                                <a href="register.do" class="btn">회원가입</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</div>
</body>
</html>