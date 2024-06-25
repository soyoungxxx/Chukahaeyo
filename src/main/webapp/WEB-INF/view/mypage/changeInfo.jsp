<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>회원정보 수정</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">

    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/mypage.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
        const pwdRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,20}$/;

        $(document).ready(function () {
            $('#memberCheckPwd').on('keydown', function (event) {
                if (event.key === 'Enter') {
                    authPwd();
                }
            });
        });

        function authPwd() {
            if ($("#memberCheckPwd").val() == '') {
                alert("비밀번호를 입력해 주세요");
                $("#memberPwd").focus();
                return false;
            }

            $.ajax({
                url: '/mypage/changeInfo/checkPwd',
                data: {memberCheckPwd: $("#memberCheckPwd").val()},
                type: 'POST',
                async: false,
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                dataType: 'json',
                success: function (res) {
                    console.log(res);
                    if (res > 0) {
                        var popup = document.getElementById("checkPwdAuthPopup");
                        popup.style.display = "none";

                        var content = document.getElementById("changeInfoContent");
                        content.style.display = "flex";
                        // $("#changeInfoContent").display("flex");

                    } else {
                        alert('비밀번호가 일치하지 않습니다.');
                    }
                },
                error: function (res, status, error) {
                    console.error("AJAX: ", status, error);
                }
            })
        }

        function clickEmail() {
            alert("이메일은 변경하실 수 없습니다.");
            return false;
        }

        function checkPwd() {
            if (!pwdRegex.test($("#memberPwd").val())) {
                alert("비밀번호를 올바른 형식으로 작성해주세요.");
                $("#memberPwd").focus();
                return false;
            }
        }

        function checkDuplPwd() {
            if ($("#pwdCheck").val() !== $("#memberPwd").val()) {
                alert("비밀번호 확인란과 비밀번호가 일치하지 않습니다.");
                $("#pwdCheck").focus();
                return false;
            } else {
                var text = document.getElementById("checkPwdMsg");
                text.style.display = "block";
            }
        }

        function checkInput() {
            if ($("#memberPwd").val() == '') {
                alert("비밀번호를 입력해 주세요");
                $("#memberPwd").focus();
                return false;
            }

            if ($("#pwdCheck").val() == '') {
                alert("비밀번호 확인란을 입력해주세요");
                $("#pwdCheck").focus();
                return false;
            }
            if (!pwdRegex.test($("#memberPwd").val())) {
                alert("비밀번호를 올바른 형식으로 작성해주세요.");
                $("#memberPwd").focus();
                return false;
            }
            if ($("#pwdCheck").val() !== $("#memberPwd").val()) {
                alert("비밀번호 확인란과 비밀번호가 일치하지 않습니다. 비밀번호 확인란을 다시 작성해주십시오.");
                $("#pwdCheck").focus();
                return false;
            }

            if ($("#memberName").val() == '') {
                alert("이름을 입력해주세요");
                $("#memberName").focus();
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
            <img src="/resources/img/logo/logo_mypage.png">
            <hr>
        </div>

        <div class="mypage">
            <div class="mypage-wrap">
                <%@ include file="/WEB-INF/view/mypage/include/menu.jsp" %>
                <%@ include file="/WEB-INF/view/mypage/include/checkPwdAuth.jsp" %>
                <div class="mypage-content" id="changeInfoContent">
                    <form action="/mypage/changeInfo" method="post" onsubmit="return checkInput();">
                        <div class="changeInfo">
                            <h3>회원정보 수정</h3>
                            <p>수정할 항목을 작성하고, 수정 버튼을 눌러주세요.</p>
                            <p>이메일은 수정할 수 없습니다. </p>
                            <ul>
                                <li>
                                    <input type="text" id="memberEmail" name="memberEmail" placeholder="${memberEmail}"
                                           readonly
                                           onclick="clickEmail();">
                                </li>

                                <li>
                                    <input type="password" id="memberPwd" name="memberPwd"
                                           placeholder="비밀번호(영문자 및 숫자, 기호 포함 8자리 이상)" onchange="return checkPwd();">
                                </li>

                                <li>
                                    <input type="password" id="pwdCheck" name="pwdCheck" placeholder="비밀번호 확인"
                                           onchange="return checkDuplPwd();">
                                    <p id="checkPwdMsg"> 비밀번호가 확인되었습니다 ✅</p>
                                </li>

                                <li>
                                    <input type="text" id="memberName" name="memberName" placeholder="이름">
                                </li>
                            </ul>

                            <div class="changeInfo-btn">
                                <input type="submit" value="수정" class="change_btn"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="sticker2"></div>
</main>

<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>