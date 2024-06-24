// 결제
var IMP = window.IMP;
IMP.init("imp72336673");

function requestPay() {
    var makeMerchantUid = 'mid_' + new Date().getTime();

    console.log("Payment requested");

    IMP.request_pay({
        pg: 'html5_inicis', // 토스페이g
        pay_method: 'card',
        merchant_uid: makeMerchantUid,
        name: '축하해요 카드 결제',
        amount: 1000,
        buyer_email: 'Iamport@chai.finance',
        buyer_name: '아임포트',
        buyer_tel: '010-1234-5678',
        buyer_addr: '서울특별시 강남구 삼성동',
        buyer_postcode: '123-456',
        display: {
            card_quota: [3]  // 할부개월 3개월까지 활성화
        }
    }, function (rsp) {
        if (rsp.success) {
            console.log("결제 성공", rsp);
            console.log("응답 객체 구조:", JSON.stringify(rsp, null, 2));
            $.ajax({
                url: '/payments/process',
                type: 'POST',
                contentType: 'application/json; charset=UTF-8',
                data: JSON.stringify({
                    applyNum: rsp.apply_num,
                    buyer_email: rsp.buyer_email,
                    payNo: rsp.imp_uid,
                    merchantUid: rsp.merchant_uid,
                    payAmount: rsp.paid_amount,
                    paidAt: rsp.paid_at,
                    status: rsp.status,
                    receiptURL: rsp.receipt_url
                }),
                success: function (response) {
                    console.log("response" + response)
                    if (response > -1) {
                        saveHiddenData();
                        $('#cardIsPaid').val('true');
                        $(window).off('beforeunload');
                        $('#payID').val(response);
                        $('#cart-submit-button').click();
                    }
                },
                error: function (xhr, status, error) {
                    console.log("결제 후 DB 저장 실패", error);
                }
            });
        } else {
            console.log("결제 실패", rsp);
            alert('Payment failed: ' + rsp.error_msg);
        }
    });
}

// 필수 항목 다 적었나 체크
function checkRequires() {
    // 이름, 날짜, 사진, 문구 전부 작성해야 함
    if ($('.card-name').text() === '' || $('.card-date').text() === '' ||
        $('.edit-file-label').text() === '첨부하기' || $('.card-message').text() === '') {
        alert("필수 항목을 다 작성하지 않으셨습니다.")
        return false;
    }
    // 이모티콘 네 개 다 작성해야 함
    if ($('#emoji1').val() === '' || $('#emoji2').val() === '' || $('#emoji3').val() === '' || $('#emoji4').val() === '') {
        alert("이모티콘을 4개 적어주세요!");
        return false;
    }
    return true;
}

// 모든 항목이 다 완료 됐으면, requestPay 실행
document.getElementById('edit-pay-button').addEventListener('click', function () {
    if (checkRequires()) {
        requestPay();
    }
});

// hidden input 값 설정
function saveHiddenData() {
    $('#map').text("");
    $('#map').removeAttr("style");
    $("#card-design").val($('.edit-preview-div').html());

    $('#cardName').val($('.card-name').text());
    $('#submit-templateThumbnail').val(templateThumbnail);
    $('#submit-categoryId').val(categoryID);
    $("#cardEmojis").val(emoji);
    console.log($("#cardEmojis"));
}

// 장바구니 선택 시 저장 로직
$('#edit-cart-button').click(function () {
    saveHiddenData();
    $('#cardIsPaid').val('false');
    $(window).off('beforeunload');
    $('#cart-submit-button').click();
})