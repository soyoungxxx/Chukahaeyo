<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/template/cardCommon.css"/>
    <link rel="stylesheet" href="/resources/css/template/${cardID}.css"/>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/js-confetti@0.9.0/dist/js-confetti.browser.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f80eccfb0c421c46d537f807e477ffc3&libraries=services"></script>
<script id="scr" src="/resources/js/card/card.js"></script>
</body>
<script>
    $(function() {
        $("#scr").before('${cardDesign}');
    })
</script>
</html>