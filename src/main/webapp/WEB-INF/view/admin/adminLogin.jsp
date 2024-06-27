<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>관리자 로그인</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/pageFrame/admin.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

    <script>
        const emailRegex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
        const pwdRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,20}$/;

        function loginCheck() {
            if ($("#adminEmail").val() == '') {
                alert("이메일을 입력해주세요.");
                $("#adminEmail").focus();
                return false;
            }

            if (!emailRegex.test($("#adminEmail").val())) {
                alert("이메일를 올바른 형식으로 작성해주세요.");
                $("#adminEmail").focus();
                return false;
            }

            if ($("#adminPwd").val() == '') {
                alert("비밀번호를 입력해 주세요");
                $("#adminPwd").focus();
                return false;
            }

            if (!pwdRegex.test($("#adminPwd").val())) {
                alert("비밀번호를 형식이 올바르지 않습니다. (영어 대소문자 숫자 모두 포함, 8자리 이상)");
                $("#adminPwd").focus();
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

<div class="admin">
    <form action="/admin/adminLogin" method="post" onsubmit="return loginCheck();">
        <div class="admin_login_wrap">
            <div class="login_header">
                <h3 class="login_title">축하해요<br>ADMIN</h3>
            </div>

            <hr class="login_header_line">

            <div class="login_form">
                <h3>LOGIN</h3>
                <ul>
                    <li>
                        <img src="/resources/img/member/login-user.png" class="login_img">
                        <input type="text" id="adminEmail" name="adminEmail" placeholder="이메일">
                    </li>
                    <li>
                        <img src="/resources/img/member/login-lock.png" class="login_img">
                        <input type="password" id="adminPwd" name="adminPwd" placeholder="비밀번호">
                    </li>
                </ul>

                <input type="submit" value="로그인" class="login_btn"/>

            </div>
        </div>
    </form>
</div>

</body>
</html>
