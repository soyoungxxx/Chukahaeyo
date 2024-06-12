<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="popup" id="checkPwdAuthPopup">
    <div class="popup-body">
        <h3>비밀번호 확인</h3>
        <hr>
        <div class = "pwd-auth-popup">
            <form class="pwd-auth-form">
                <%--               onsubmit="authPwd();  method post로 변경해서controller에서 처리해주기--%>
                <p>현재 비밀번호를 입력해주세요.</p>
                <div>
                    <input type="password" id = "userInputPwd" placeholder="비밀번호 입력">
                    <input type="button" class="btn-auth-pwd" id="btnAuthPwd" value="확인">
                </div>

            </form>
        </div>
        <a href="/mypage/mypage/myCard" id="authPwdClose">닫기</a>
    </div>
</div>