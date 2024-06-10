<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>마이페이지</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/common.css"/>
    <link rel="stylesheet" href="/resources/css/mypage.css"/>
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
                <div class="mypage-content">
                    <form action="unregister">
                        <h3>이메일</h3>
                        <input type="text" id="userEmail" name="userEmail" placeholder="user@email.com" disabled>
                        <div>
                            <h3>탈퇴하시기 전 꼭 확인하세요!</h3>
                            <ul>
                                <li>회원에서 탈퇴하시면 현재 사용 중이신 계정을 더 이상 사용할 수 없게 됩니다. 또한 사용 중이신 계정으로 로그인 되어 있던 모든 디바이스에서 자동으로
                                    로그아웃
                                    됩니다.
                                </li>
                                <li>한 번 삭제된 계정은 이전 상태로 복구할 수 없습니다. 또한 계정이 삭제되면 해당 계정의 정보 및 사용 이력을 더 이상 조회할 수 없습니다.</li>
                                <li>한 번 탈퇴한 사용자라 하더라도 언제든 다시 회원 가입을 할 수 있습니다. 단, 이미 사용한 이메일은 다시 사용할 수 없기 때문에 새 이메일 주소를
                                    사용하셔야
                                    합니다.
                                </li>
                            </ul>
                            <h3>비밀번호 확인</h3>
                            <input type="password" id="pwdCheck" name="pwdCheck" placeholder="현재 비밀번호 입력">
                        </div>
                        <div class="unregister-agree-content">
                            <a class="unregister-agree-img" href="#">
                                <img src="/resources/img/agree-check-not.png" id="checkAgree" value="0"
                                     style="width: 50px; height: 50px"/>
                            </a>
                            <p>회원가입 및 개인정보 이용약관에 모두 동의합니다.</p>
                        </div>

                        <input type="submit" value="탈퇴하기" class="unregister_btn"/>
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