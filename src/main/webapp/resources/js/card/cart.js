$(document).ready(function () {
    // Ensure that clicking on any part of the card checks/unchecks the checkbox
    $('.card').on('click', function (event) {
        if (!$(event.target).is('.close-button, .card-checkbox')) {
            let checkbox = $(this).find('.card-checkbox');
            checkbox.prop('checked', !checkbox.prop('checked'));
            updateTotal();
            updateReceipt();
        }
    });

    const cards = document.querySelectorAll('.card');
    if (cards.length % 2 !== 0) {
        cards[cards.length - 1].classList.add('align-to-left'); // 마지막 카드 정렬
    }
    updateReceipt(); // 페이지 로드 시 영수증 목록 초기화
});

function updateTotal() {
    let total = 0;
    document.querySelectorAll('.card-checkbox:checked').forEach(function (checkbox) {
        total += parseInt(checkbox.value);
    });
    document.getElementById('totalAmount').innerText = total.toLocaleString() + '원';
}

function updateReceipt() {
    let receiptList = document.querySelector('.cart-list');
    receiptList.innerHTML = ''; // 기존 영수증 목록 비우기
    document.querySelectorAll('.card-checkbox:checked').forEach(function (checkbox, index) {
        let card = checkbox.closest('.card');
        let cardPrice = card.querySelector('.card-checkbox').value;
        let cardText = card.querySelector('.card-text').textContent;
        receiptList.innerHTML += '<p><span>' + (index + 1) + '&nbsp;&nbsp;&nbsp;&nbsp;' + cardText + '</span> <span style="float: right;">' + parseInt(cardPrice).toLocaleString() + '원</span></p>';
    });
}

function deleteCard(cardID, event) {
    if (confirm("정말로 삭제하겠습니까?")) {
        $.ajax({
            url: '/deleteCard',
            type: 'POST',
            data: {cardID: cardID},
            success: function (response) {
                if (response.status === 'success') {
                    alert("카드가 삭제되었습니다.");
                    $(event.target).closest('.card').remove(); // DOM에서 카드 제거
                    updateTotal(); // 삭제 후 합계 금액 재계산
                    updateReceipt(); // 삭제 후 영수증 목록 재계산
                } else {
                    alert("삭제 실패: " + response.message);
                }
            }
        });
    }
}

function proceedToPayment() {
    let selectedCards = []; // 결제할 카드 목록을 담은 리스트
    document.querySelectorAll('.card-checkbox:checked').forEach(function (checkbox) {
        let card = checkbox.closest('.card');
        let cardInfo = {
            cardID: card.dataset.id,  // 각 카드 div에 data-id 속성이 있는지 확인
            cardPrice: checkbox.value
        };
        selectedCards.push(cardInfo);
    });

    if (selectedCards.length === 0) {
        alert('결제할 카드를 선택해 주세요.');
        return;
    }
    console.log("Selected Cards:", selectedCards);
    if (confirm("결제하시겠습니까?")) {
        var makeMerchantUid = 'mid_' + new Date().getTime();
        let totalAmount = selectedCards.reduce((sum, card) => sum + parseFloat(card.cardPrice), 0);

        // 아임포트 초기화
        var IMP = window.IMP;
        IMP.init("imp72336673");

        IMP.request_pay({
            pg: 'html5_inicis',
            pay_method: 'card',
            merchant_uid: makeMerchantUid,
            name: '축하해요 카드 결제',
            amount: totalAmount,
            buyer_email: memberEmail,
            buyer_name: memberName,
            display: {
                card_quota: [3]  // 할부개월 3개월까지 활성화
            }
        }, function (rsp) {
            console.log(rsp);
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
                        receiptURL: rsp.receipt_url,
                        cardIds: selectedCards.map(card => card.cardID) // 카드 ID 목록 추가
                    }),
                    success: function (response) {
                        console.log("response" + response)
                        if (response) {
                            $('#cardIsPaid').val('true');
                            // let payNo = rsp.imp_uid; // 서버에서 payNo 받아옴
                            // 각 카드의 결제 상태 업데이트
                            selectedCards.forEach(card => {
                                $.ajax({
                                    url: '/updateCardPaymentStatus',
                                    type: 'POST',
                                    data: {cardID: card.cardID}, // payID 추가
                                    async: false,
                                    success: function (response) {
                                        if (response.status === 'success') {
                                            console.log("카드 결제 상태 업데이트 성공:", response.message);
                                        } else {
                                            console.log("카드 결제 상태 업데이트 실패:", response.message);
                                        }
                                    },
                                    error: function (xhr, status, error) {
                                        console.log("카드 결제 상태 업데이트 중 오류 발생:", error);
                                    }
                                });
                            });
                            alert('결제가 성공적으로 완료되었습니다. 내 카드 목록으로 이동합니다.');
                            window.location.href = "/mypage/myCard";
                        }
                    },
                    error: function (xhr, status, error) {
                        alert('결제 후 DB 수정 실패: ' + rsp.error_msg);
                        console.log("결제 후 DB 수정 실패", error);
                    }
                });
            } else {
                console.log("결제 실패", rsp);
                alert('결제 실패: ' + rsp.error_msg);
            }
        });
    }
}