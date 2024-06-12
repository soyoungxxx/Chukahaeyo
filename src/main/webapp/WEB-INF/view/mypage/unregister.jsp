<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>마이페이지</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/mypage.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
        function inputCheck() {
            if ($("#pwdCheck").val() == '') {
                alert("비밀번호를 입력해 주세요");
                $("#pwdCheck").focus();
                return false;
            }

            var checkAgreeValue = $("#checkAgree").attr('data-value');
            console.log(checkAgreeValue);
            if (checkAgreeValue == '0') {
                alert("상기 동의란을 체크해야 탈퇴 가능합니다");
                return false;
            }
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
                <div class="mypage-content">
                    <form action="unregister" method="post" class="unregister-page" onsubmit="return inputCheck();">
                        <h3>이메일</h3>
                        <%--                        이메일 불러와서 placeholder에 들어갈 수 있게 하기--%>
                        <input type="text" id="memberEmail" name="memberEmail" placeholder="${memberEmail}" disabled>
                        <div class="unregister-check">
                            <h3>탈퇴하시기 전 꼭 확인하세요!</h3>
                            <ul>
                                <li>✅ 회원에서 탈퇴하시면 현재 사용 중이신 계정을 더 이상 사용할 수 없게 됩니다. 또한 사용 중이신 계정으로 로그인 되어 있던 모든 디바이스에서
                                    자동으로 로그아웃 됩니다.
                                </li>
                                <li>✅ 한 번 삭제된 계정은 이전 상태로 복구할 수 없습니다. 또한 계정이 삭제되면 해당 계정의 정보 및 사용 이력을 더 이상 조회할 수 없습니다.
                                </li>
                                <li>✅ 한 번 탈퇴한 사용자라 하더라도 언제든 다시 회원 가입을 할 수 있습니다. 단, 이미 사용한 이메일은 다시 사용할 수 없기 때문에 새 이메일 주소를
                                    사용하셔야 합니다.
                                </li>
                            </ul>
                            <h3>비밀번호 확인</h3>
                            <input type="password" id="memberPwd" name="memberPwd" placeholder="현재 비밀번호 입력">
                        </div>
                        <div class="unregister-agree-content">
                            <a class="unregister-agree-img" href="javascript:toggleCheckbox();">
                                <img src="/resources/img/member/agree-check-not.png" id="checkAgree" data-value="0"/>
                            </a>
                            <p>상기 내용에 모두 동의합니다.</p>
                        </div>
                        <div class="unregister-btn">
                            <input type="submit" value="탈퇴하기" id="unregisterBtn"/>
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
