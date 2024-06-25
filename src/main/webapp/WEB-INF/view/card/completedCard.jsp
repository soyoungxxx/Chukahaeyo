<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/template/cardCommon.css"/>
    <link rel="stylesheet" href="/resources/css/template/${css}.css"/>
    <title>${cardVO.cardName}</title>
    <link rel="icon" href="/resources/img/logo/favicon.png"/>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/js-confetti@0.9.0/dist/js-confetti.browser.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f80eccfb0c421c46d537f807e477ffc3&libraries=services"></script>

</body>
<script>
    $(function () {
        $("#scr").before('${cardVO.cardDesign}');
        $(".like-number").text(${cardVO.cardLikeCnt});
        $(".uploadedImage").attr("src", "${cardVO.cardImage}");
        emoji = '${cardVO.cardEmojis}'.split(",");
        <c:forEach items="${guestBooks}" var="item">
        showGuestBook('${item.guestName}', '${item.guestBookText}');
        </c:forEach>
    })
    const cardID = ${cardVO.cardID};
</script>
<script id="scr" src="/resources/js/card/card.js"></script>
</html>