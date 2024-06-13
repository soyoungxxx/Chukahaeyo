<%--
  Created by IntelliJ IDEA.
  User: joyebin
  Date: 5/30/24
  Time: 3:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
            <div class="btn">
                <input type="submit" value="로그인" class="login_btn"/>
            </div>
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

</body>
</html>
