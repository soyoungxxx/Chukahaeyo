<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html style="text-align: justify;">
<head>
    <meta charset="UTF-8">
    <title>축하해요</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/edit.css?after">
    <link rel="stylesheet" href="/resources/css/template/cardCommon.css?after">
    <link rel="stylesheet" href="/resources/css/template/templateGreen.css?after" id="cardCss">

    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
</head>
<body>
<c:if test="${categoryPath} == myCard">
    <c:set var="categoryID" value="1"/>
    <c:set var="categoryName" value="내 생일 카드"/>
</c:if>
<c:if test="${categoryPath} == myPet">
    <c:set var="categoryID" value="2"/>
    <c:set var="categoryName" value="반려동물 생일 카드"/>
</c:if>
<c:if test="${categoryPath} == invitation">
    <c:set var="categoryID" value="3"/>
    <c:set var="categoryName" value="초대 카드"/>
</c:if>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main" style="height: 50%;">
    <div class="sticker1" style="margin-right: 50px"></div>
    <div style="width: 100%; height: 100%;">
        <h2>${categoryName}가 만들어지는 중</h2>
        <div class="edit-main-div">
            <form class="edit-submit-form" action="/card/edit/card.do" method="post" onsubmit="return checkRequires();"
                  enctype="multipart/form-data">
                <div class="edit-div" style="overflow: scroll;">
                    <div class="edit-div-hidden">
                        <div class="edit-upper-div"></div>
                        <div class="edit-div-components">
                            <span class="head-text">이름</span>
                            <span class="edit-warn-text">필수 항목입니다.</span>
                            <input type="text" class="edit-text" id="edit-name" maxlength="18"/>
                        </div>
                        <hr>
                        <div class="edit-div-components">
                            <span class="head-text">날짜</span>
                            <span class="edit-warn-text">필수 항목입니다.</span> <br>
                            <input type="radio" checked id="edit-dayRadio" name="day">하루 선택 <br>
                            <input type="radio" id="edit-daysRadio" name="day"/>여러날 선택
                            <input type="text" id="edit-day" class="edit-text" placeholder="날짜 선택"/>
                            <input type="text" id="edit-days" class="edit-text" placeholder="날짜 선택"/>
                        </div>
                        <hr>
                        <div class="edit-div-components">
                            <span class="head-text">사진</span>
                            <span class="edit-warn-text">필수 항목입니다.</span> <br>
                            <%-- 사진 첨부하는 버튼 --%>
                            <input class="edit-inputFile" id="edit-file" type="file" value="첨부하기"
                                   onchange="loadFile(this)" accept="image/*" name="imageFile"/>
                            <label class="edit-file-label" for="edit-file">첨부하기</label>
                        </div>
                        <hr>
                        <div class="edit-div-components">
                            <span class="head-text">문구</span>
                            <span class="edit-warn-text">필수 항목입니다.</span> <br>
                            <textarea id="edit-text" maxlength="255" placeholder="문구를 입력하세요"></textarea>
                        </div>
                        <hr>
                        <div class="edit-div-components">
                            <span class="head-text">이모티콘</span>
                            <span class="edit-warn-text">필수 항목입니다.</span> <br>
                            <input class="edit-emoji" type="text" id="emoji1" maxlength="2"/>
                            <input class="edit-emoji" type="text" id="emoji2" maxlength="2"/>
                            <input class="edit-emoji" type="text" id="emoji3" maxlength="2"/>
                            <input class="edit-emoji" type="text" id="emoji4" maxlength="2"/>
                            <p style="font-size:14px; color:#686868; width:90%;">
                                원하는 이모티콘을 <b>한 칸당 하나씩</b>
                                작성해주세요! <br>
                                양식을 지키지 않으면 이모티콘이 제대로 나오지 않을 수 있어요 😥 <br>
                                ‘윈도우 키 + .’을 이용하면 이모티콘을 입력할 수 있어요!
                            </p>
                        </div>
                        <hr>
                        <div class="edit-div-components">
                            <span class="head-text">시간</span>
                            <!-- 온오프 버튼 -->
                            <span class="edit-select-button">
                        <input type="checkbox" id="edit-time-select" class="edit-check"/>
                        <label class="edit-btn-label" for="edit-time-select">
                            <span class="edit-onf_btn"></span>
                        </label>
                                <!-- -->
                    </span>
                            <div class="edit-showTime">
                                <input type="radio" checked id="edit-timeRadio" name="edit-time">시각 선택 <br>
                                <input type="radio" id="edit-timesRadio" name="edit-time"/>범위 시간 선택<br>
                                <input type="time" id="edit-time" placeholder="시간 선택"/>
                                <input type="time" id="edit-times" placeholder="시간 선택"/>
                            </div>
                        </div>
                        <hr>
                        <div class="edit-div-components">
                            <span class="head-text">장소</span>
                            <!-- 온오프 버튼 -->
                            <span class="edit-select-button">
                        <input type="checkbox" id="edit-place-select" class="edit-check"/>
                        <label class="edit-btn-label" for="edit-place-select">
                            <span class="edit-onf_btn"></span>
                        </label>
                                <!-- -->
                    </span>
                            <div class="edit-place">
                                <input type="button" class="edit-search-addr" value="주소 찾기"/>
                                <input type="text" class="edit-text" id="addr2" placeholder="상세 주소 입력"/>
                            </div>
                        </div>
                        <hr>
                        <div class="edit-div-components">
                            <span class="head-text">준비물</span>
                            <!-- 온오프 버튼 -->
                            <span class="edit-select-button">
                        <input type="checkbox" id="edit-prepare-select" class="edit-check"/>
                        <label class="edit-btn-label" for="edit-prepare-select">
                            <span class="edit-onf_btn"></span>
                        </label>
                                <!-- -->
                    </span>
                            <textarea class="edit-prepare" maxlength="255" placeholder="준비물을 입력하세요"></textarea>
                        </div>
                        <hr>
                        <div class="edit-div-components">
                            <span class="head-text">계좌 번호</span>
                            <!-- 온오프 버튼 -->
                            <span class="edit-select-button">
                        <input type="checkbox" id="edit-account-select" class="edit-check"/>
                        <label class="edit-btn-label" for="edit-account-select">
                            <span class="edit-onf_btn"></span>
                        </label>
                    </span>
                            <div class="edit-account">
                                <p style="margin-bottom:0;">은행</p>
                                <input type="text" id="edit-bank" class="edit-text" maxlength="10/">
                                <p style="margin-bottom:0;">계좌 번호</p>
                                <input type="text" id="edit-account-number" class="edit-text" maxlength="20"/>
                            </div>
                        </div>
                        <hr>
                    </div>

                    <input type="hidden" name="cardStartDate" id="cardStartDate">
                    <input type="hidden" name="payID" id="payID" value="0">
                    <input type="hidden" name="cardEmojis" id="cardEmojis">
                    <input type="hidden" name="cardIsPaid" id="cardIsPaid">
                    <input type="hidden" name="cardEndDate" id="cardEndDate">
                    <input type="hidden" name="cardName" id="cardName">
                    <input type="hidden" name="cardDesign" id="card-design">
                    <input type="hidden" name="cardIsPublic" value="false" id="public">
                    <input type="hidden" name="templateThumbnail" id="submit-templateThumbnail">
                    <input type="hidden" name="categoryID" id="submit-categoryId">
                    <input type="submit" style="display:none" id="cart-submit-button">
                </div>
            </form>
            <div class="edit-middle-div">
                <div class="edit-preview-div"></div>
                <div class="edit-button-div">
                    <input class="edit-grey-btn" type="button" id="edit-cart-button" value="장바구니 담기">
                    <form id="edit-payment-form" class="edit-form" action="/payments/process" method="post">
                        <input class="edit-grey-btn" type="button" id="edit-pay-button" value="결제하기">
                    </form>
                    <input class="edit-grey-btn" id="publicButton" type="button" value="비공개"/>
                    <form id="uploadForm" action="/upload" method="post" enctype="multipart/form-data">
                        <input type="hidden" id="uploaded-file-url" name="uploadedFileURL">
                    </form>

                </div>
            </div>
            <div class="edit-frame-div">
                <c:forEach items="${list}" var="t">
                    <img src="${t.templateThumbnail}" class="edit-frame" id="${t.templateID}"> <br>
                </c:forEach>
            </div>
        </div>

    </div>
    <div class="sticker2" style="margin-left: 50px"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/js-confetti@0.9.0/dist/js-confetti.browser.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f80eccfb0c421c46d537f807e477ffc3&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="/resources/js/card/edit/edit.js"></script>
<script src="/resources/js/card/edit/address.js"></script>
<script src="/resources/js/card/edit/editPayment.js"></script>
<script src="/resources/js/card/edit/previewDiv.js"></script>
<script src="/resources/js/card/edit/editSelectFrame.js"></script>
<script src="/resources/js/card/edit/uploadImage.js"></script>
<script src="/resources/js/card/card.js"></script>

<script>
    // 필요한 변수 선언
    let categoryID = ${categoryID};
    let templateThumbnail;
    let address = " ";

    function setReadOnly() {
        $("input[type='text']").readOnly(false);
        $("textarea").readOnly(false);
        $(".edit-file-label").readOnly(false);
        $("input[type='time']").readOnly(false);
        // $("input[type='date']").
    }
</script>
</body>
</html>