<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>축하해요</title>
    <link rel="icon" href="/resources/img/logo/favicon.png"/>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/member.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100..900&display=swap"
          rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

    <script>
        const emailRegex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
        const pwdRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,20}$/;

        function loginCheck() {
            if ($("#memberEmail").val() == '') {
                alert("이메일을 입력해주세요.");
                $("#memberEmail").focus();
                return false;
            }

            if (!emailRegex.test($("#memberEmail").val())) {
                alert("이메일를 올바른 형식으로 작성해주세요.");
                $("#memberEmail").focus();
                return false;
            }

            if ($("#memberPwd").val() == '') {
                alert("비밀번호를 입력해 주세요");
                $("#memberPwd").focus();
                return false;
            }

            if (!pwdRegex.test($("#memberPwd").val())) {
                alert("비밀번호를 형식이 올바르지 않습니다. (영어 대소문자 숫자 모두 포함, 8자리 이상)");
                $("#memberPwd").focus();
                return false;
            }
        }
    </script>

    <script>
        window.onload = function () {
            const msg = '<c:out value="${sessionScope.msg}"/>';
            if (msg) {
                alert(msg);
                <c:remove var="msg" scope="session" />
            }
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
                                    <img src="/resources/img/member/login-user.png" class="login_img">
                                    <input type="text" id="memberEmail" name="memberEmail" placeholder="이메일">
                                </li>
                                <li>
                                    <img src="/resources/img/member/login-lock.png" class="login_img">
                                    <input type="password" id="memberPwd" name="memberPwd" placeholder="비밀번호">
                                </li>
                            </ul>
                            <input type="submit" value="로그인" class="login_btn"/>
                        </div>

                        <div class="login_register">
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