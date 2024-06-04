<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    alert('${msg}');
    <c:if test="${cmd == 'back'}">
    history.back();
    </c:if>
    <c:if test="${cmd != 'back'}">
    location.href = '${url}';
    </c:if>
</script>