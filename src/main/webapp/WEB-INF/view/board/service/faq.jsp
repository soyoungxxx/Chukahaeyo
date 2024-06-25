<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>고객센터</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/board/faq.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/reset.css"/>
    <script src="/resources/js/board/faq.js"></script>
</head>

<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main">
    <div class="sticker1"></div>
    <div style="width: 100%;">
        <div class="service-header">
            <img src=/resources/img/logo/service_logo.png class="service-logo">
            <hr>
        </div>
        <div class="service">
            <div class="service-wrap">
                <div class="menu">
                    <div class="service-menu">
                        <ul>
                            <li><a href="/board/service" id="service">자주 묻는 질문</a></li>
                            <li><a href="/board/inquiry/list?page=1&query=${memberName}&querytype=writer" id="inquiry">1:1
                                문의하기</a></li>
                        </ul>
                    </div>
                </div>
                <div class="v-line"></div>

                <div class="service-content">
                    <div class="container">
                        <div class="faq-title">자주 묻는 질문</div>
                        <div class="faq-container">
                            <hr>
                            <div class="faq-inner-container">
                                    <span>
                                        <span class="no">1.</span>
                                        <span class="title">축하 카드 에디터는 어떻게 사용하나요?</span>
                                    </span>
                                <img class="arrow" src="/resources/img/board/toggle.png">
                            </div>
                            <div class="content">
                                상단 메뉴바(네비게이터)를 통해 각 분류에 맞는 축하카드를 생성할 수 있습니다.<br>
                                카드 생성은 다음과 같은 프로세스로 진행 및 생성할 수 있습니다<br><br>
                                <b>&lt;필수 항목&gt;</b> <br>
                                (1) 우측 카드 템플릿 선택(선택 이전에 내용 입력 불가), 작성 중간에 템플릿을 변경할 시 기존 작성 내용이 초기화 됩니다.<br>
                                (2) 축하/초대 카드 이름 입력<br>
                                (3) 날짜 선택<br>
                                (4) 사진 첨부<br>
                                (5) 축하/초대 메시지 작성<br>
                                (6) 좋아요 효과에 적용될 이모티콘 선택<br><br>
                                <b>&lt;선택 항목&gt;</b><br>
                                시간, 장소, 준비물, 계좌번호를 입력하고 싶다면 토글 버튼을 클릭하여 입력창을 활성화 시켜주세요.
                            </div>
                            <hr>

                            <div class="faq-inner-container">
                                <span>
                                    <span class="no">2.</span>
                                    <span class="title">주문한 카드를 수정하거나 취소할 수 있나요?</span>
                                </span>
                                <img class="arrow" src="/resources/img/board/toggle.png">
                            </div>
                            <div class="content">
                                장바구니에 담기거나 이미 결제가 된 카드는 수정이 불가능합니다. 만일 수정이 필요할 시 삭제 후 재생성을 진행해주셔야 합니다. 더불어 결제된 카드를 취소할 시
                                수수료 50%가 부과되오니 유의바랍니다.
                            </div>
                            <hr>

                            <div class="faq-inner-container">
                                <span>
                                    <span class="no">3.</span>
                                    <span class="title">생성한 페이지를 얼마나 유지할 수 있나요?</span>
                                </span>
                                <img class="arrow" src="/resources/img/board/toggle.png">
                            </div>
                            <div class="content">
                                생성된 페이지 링크의 제한 기간은 없으나, 축하 기간이 길어지거나 페이지를 유지해야하는 기간이 길어질 시 가격 측정 내규에 따라 추가요금을 요청할 수
                                있습니다. 오랜 기간 페이지를 유지해야할 시 미리 고객센터에 문의해주세요.
                            </div>
                            <hr>

                            <div class="faq-inner-container">
                                <span>
                                    <span class="no">4.</span>
                                    <span class="title">같은 이메일로 가입이 가능한가요?</span>
                                </span>
                                <img class="arrow" src="/resources/img/board/toggle.png">
                            </div>
                            <div class="content">
                                동일한 이메일로 중복 가입은 불가능합니다. 이는 회원탈퇴를 한 계정도 동일하게 적용되며, 만일 동일 아이디로 재가입이 필요할 시 고객센터로 문의바랍니다.
                            </div>
                            <hr>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="sticker2"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>

</html>