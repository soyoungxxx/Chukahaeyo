<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="popup" id="emailAuthPopup">
    <div class="popup-body">
        <h3>이메일 인증</h3>
        <hr>
        <div class = "email-auth-popup">
            <p>작성하신 이메일로 인증 링크가 발송되었습니다.</p>
            <p>전송된 링크를 눌러 인증을 진행해 주세요. ( •̀ ω •́ )✧</p>
            <img src="/resources/img/mail-image.png">
        </div>
        <a href="javascript:closeCheckEmail();" id="authPopupClose">닫기</a>
    </div>
</div>