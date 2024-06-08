<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>회원정보 수정</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/common.css"/>
    <link rel="stylesheet" href="/resources/css/mypage.css"/>
    <script>
        // 임시로 만든 이벤트, 추후 기능 구현시 수정
        document.addEventListener("DOMContentLoaded", function (){
            var btn = document.querySelector("#btnAuthPwd");

            btn.addEventListener('click', function (){
                var popup = document.querySelector("#checkPwdAuthPopup");
                popup.style.display = "none";
            })

        })

        function authPwd(){
            if ($("#userInputPwd").val() == '') {
                alert("비밀번호를 입력해 주세요");
                $("#userPwd").focus();
                return false;
            }

            if(!pwdRegex.test($("#userInputPwd").val())){
                alert("비밀번호를 형식이 올바르지 않습니다. (영어 대소문자 숫자 모두 포함, 8자리 이상)");
                $("#userPwd").focus();
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
        <div class="mypage-header">
            <img src="/resources/img/logo_mypage.png">
            <hr>
        </div>

        <div class="mypage">
            <div class="mypage-wrap">
                <%@ include file="/WEB-INF/view/mypage/include/menu.jsp" %>
                <%@ include file="/WEB-INF/view/mypage/include/checkPwdAuth.jsp" %>
                <div class="mypage-content">
                    <div class="changeInfo">
                        <h3>회원정보 수정</h3>
                        <p>수정할 항목을 작성하고, 수정 버튼을 눌러주세요.</p>
                        <p>이메일은 수정할 수 없습니다. </p>
                        <ul>
                            <li>
                                <input type="text" id="userEmail" name="userEmail" placeholder="이메일" disabled>
                            </li>

                            <li>
                                <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호(영어 대소문자 숫자 모두 포함, 8자리 이상)">
                            </li>

                            <li>
                                <input type="password" id="pwdCheck" name="pwdCheck" placeholder="비밀번호 확인">
                                <p id="checkPwdMsg"> 비밀번호가 확인되었습니다.</p>
                            </li>

                            <li>
                                <input type="text" id="userName" name="userName" placeholder="이름">
                            </li>
                        </ul>

                        <div class="changeInfo-btn">
                            <input type="submit" value="수정" class="change_btn"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="sticker2"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>