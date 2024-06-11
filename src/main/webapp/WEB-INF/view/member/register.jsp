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
        const emailRegex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
        const pwdRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,20}$/;

        function inputCheck() {
            if ($("#memberEmail").val() == '') {
                alert("이메일을 입력해주세요");
                $("#memberEmail").focus();
                return false;
            }

            if ($("#emailCheck").data('value') == '0') {
                alert("이메일 중복체크를 진행해주세요.");
                $("#memberEmail").focus();
                return false;
            }

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

            var checkAgreeValue = $("#checkAgree").attr('data-value');
            if (checkAgreeValue == '0') {
                alert("약관에 동의해야 회원가입이 가능합니다");
                return false;
            }


            regist();
        }


        function checkEmail() {
            if ($("#memberEmail").val() == '') {
                alert("이메일을 입력해주세요");
                $("#memberEmail").focus();
                return false;
            }
            if (!emailRegex.test($("#memberEmail").val())) {
                alert("이메일를 올바른 형식으로 작성해주세요.");
                $("#memberEmail").focus();
                return false;
            }

            var emailCheckValue = $("#emailCheck").data('value');
            if (emailCheckValue == '0') {
                $("#emailCheck").data('value', '1');
            } else {
                alert("이미 중복 인증을 진행하였습니다.");
                return;
            }

            checkDuplicate();
        }

        function changeValueCheckEmail() {
            var emailCheckValue = $("#emailCheck").data('value');

            if (emailCheckValue == '1') {
                $("#emailCheck").data('value', '0');
            }
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
            }
        }

        function openCheckEmail() {
            const popup = $('#successRegisterPopup');
            popup.css('display', 'flex');
        }

        function closeCheckEmail() {
            const popup = $('#successRegisterPopup');
            popup.css('display', 'none');
        }

        function checkDuplicate() {
            $.ajax({
                url: '/member/register/checkEmailDuplicate',
                data: {memberEmail: $("#memberEmail").val()},
                async: false,
                success: function (res) {
                    if (res == '0') {
                        alert('사용 가능한 이메일입니다.');
                    } else {
                        alert('중복된 이메일입니다.\r\n다른 이메일을 입력해 주세요');
                    }
                }
            })
        }

        function openPopup() {
            const popup = document.querySelector('#termOfUsePopup');
            popup.style.display = "flex";
        }

        function closePopup() {
            const popup = document.querySelector('#termOfUsePopup');
            popup.style.display = "none";
        }

        function toggleCheckbox() {
            var img = $('#checkAgree');
            var src = img.attr('src');

            if (src.includes("agree-check-not")) {
                img.attr('src', "/resources/img/agree-check.png");
                img.attr('data-value', "1");
            } else {
                img.attr('src', "/resources/img/agree-check-not.png");
                img.attr('data-value', "0");
            }
        }

        function regist() {
            $.ajax({
                type: "POST",
                url: '/member/register',
                data: {
                    memberEmail: $("#memberEmail").val(),
                    memberPwd: $("#memberPwd").val(),
                    memberName: $("#memberName").val()
                },
                async: false,
                success: function (res) {
                    if (res == '1') {
                        sendEmail();
                        openCheckEmail();
                    } else {
                        alert('가입 중 오류가 발생했습니다.');
                    }
                },
                error: function (xhr, status, error) {
                    console.error("AJAX 요청 중 에러 발생: ", status, error);
                }
            });


        }

        function sendEmail(){
            // 이메일 인증 구현
            $.ajax({
                url: './emailAuth',
                data: {
                    memberEmail: $("#memberEmail").val(),
                },
                type: 'POST',
                success: function (res) {
                    console.log("result: " + res);
                },
                error: function (xhr, status, error) {
                    console.error("email AJAX 요청 중 에러 발생: ", status, error);
                }
            });
        }
    </script>
</head>

<body>
<%@ include file="/WEB-INF/view/member/include/termsOfUse.jsp" %>
<%--<%@ include file="/WEB-INF/view/member/include/emailAuth.jsp" %>--%>
<%@ include file="/WEB-INF/view/member/include/successRegisterPage.jsp" %>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main">
    <div class="sticker1"></div>
    <div style="width: 100%; overflow: hidden;">
        <form action="register" method="post" onsubmit="return false;">
            <div class="wrap">
                <h3 class="sub_title">회원가입</h3>
                <hr>
                <div class="member">
                    <div class="box">
                        <div class="register_form">
                            <ul>
                                <li class="email_check">
                                    <input type="text" id="memberEmail" name="memberEmail" placeholder="이메일"
                                           onchange="changeValueCheckEmail();">
                                    <span>
                                        <a href="javascript:checkEmail();" class="check_btn"
                                           id="emailCheck" data-value='0'>중복확인</a>
                                    </span>
                                </li>

                                <li>
                                    <input type="password" id="memberPwd" name="memberPwd"
                                           placeholder="비밀번호(영문자 및 숫자 포함, 8자리 이상)" onchange="return checkPwd();">
                                </li>
                                <li>
                                    <input type="password" id="pwdCheck" name="pwdCheck" placeholder="비밀번호 확인"
                                           onchange="return checkDuplPwd();">
                                </li>
                                <div class="check_result">
                                    <p id="check_success">비밀번호가 확인되었습니다.</p>
                                    <p id="check_fail">비밀번호가 일치하지 않습니다!</p>
                                </div>
                                <li>
                                    <input type="text" id="memberName" name="memberName" placeholder="이름">
                                </li>
                            </ul>

                            <div class="register-agree">
                                <div class="register-agree-content">
                                    <p>회원가입 및 개인정보 이용약관에 모두 동의합니다.</p>
                                    <a class="register-agree-img" href="javascript:toggleCheckbox();">
                                        <img src="/resources/img/agree-check-not.png" id="checkAgree" data-value="0"/>
                                    </a>
                                </div>
                                <a href="javascript:openPopup();">약관내용 자세히 보기</a>
                            </div>

                            <div class="btn">
                                <input type="button" value="가입하기" class="register_btn" onclick="inputCheck();"/>
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