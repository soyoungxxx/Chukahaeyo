<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/resources/css/include/footer.css"/>
<link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>

<footer class="footer">
    <div class="introduce">
        최강이조<br>
        하소영 김민지 조예빈 최민서 서현오<br>
        기획 프론트엔드 백엔드<br>
    </div>
    <div>
        <div class="customer-center">고객센터</div>
        <a href="/board/service">자주 묻는 질문</a><br>
        <a href="/board/inquiry/list?page=1&query=${sessionScope.login.memberName}&querytype=writer">1:1 문의</a>
    </div>
    <div>
        <img src="${pageContext.request.contextPath}/resources/img/logo/gray-logo.png"
             style="width: 180px; height: 55px;">
    </div>
</footer>