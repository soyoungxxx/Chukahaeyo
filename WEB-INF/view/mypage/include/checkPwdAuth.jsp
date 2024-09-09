<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="popup" id="checkPwdAuthPopup">
    <div class="popup-body">
        <h3>비밀번호 확인</h3>
        <hr>
        <div class="pwd-auth-popup">
            <div class="pwd-auth-form">
                <p>현재 비밀번호를 입력해주세요.</p>
                <div>
                    <input type="password" id="memberCheckPwd" placeholder="비밀번호 입력">
                    <input type="button" class="btn-auth-pwd" id="btnAuthPwd" value="확인" onclick="authPwd();">
                </div>
            </div>
        </div>
        <a href="/mypage/myCard" id="authPwdClose">닫기</a>
    </div>
</div>