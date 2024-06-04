<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>회원가입</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/common.css"/>
    <link rel="stylesheet" href="/resources/css/member.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100..900&display=swap"
          rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
        function inputCheck() {
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
        <form action="register" method="post" onsubmit="return inputCheck();">
            <div class="wrap">
                <h3 class="sub_title">회원가입</h3>
                <hr>
                <div class="member">
                    <div class="box">
                        <div class="register_form">
                            <ul>
                                <li class="email_check">
                                    <input type="text" id="userEmail" name="userEmail" placeholder="이메일">
                                    <%--                                    <input type="button" class="check_btn" value="중복확인">--%>
                                    <span>
                                        <a href="javascript:checkDupl();" class="check_btn" id="emailCheck">중복확인</a>
                                    </span>
                                </li>

                                <li>
                                    <input type="password" id="userPwd" name="userPwd"
                                           placeholder="비밀번호(영어 대소문자 숫자 모두 포함, 8자리 이상)">
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