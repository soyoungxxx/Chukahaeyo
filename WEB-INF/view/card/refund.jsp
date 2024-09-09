<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>결제 취소</title>
</head>
<body>
<form id="cancelForm" action="cancelPayment.jsp" method="post">
    <input type="hidden" name="paymentId" value="<%= request.getParameter("paymentId") %>">
    <button type="button" onclick="cancelPayment()">결제 취소</button>
</form>
</body>
</html>