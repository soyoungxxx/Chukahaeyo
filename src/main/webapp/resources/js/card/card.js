// 캔버스 객체 불러와서 컨페티로 등록하기
var canvas = document.querySelector("canvas");
const jsConfetti = new JSConfetti({ canvas });

$(document).ready(function(){
    if ($('.extra-address').text() != null) {
        getMap($('.extra-address').text())
    }
})

// like 버튼 클릭 시 숫자 올라가고, 이모티콘 컨페티 터지는 효과
var emoji = ["🎉", "🎊", "✨", "🎈"];
$(document).on('click', '#like', function() {
    let likeNumber = Number($(".like-number").text()) + 1;
    if (window.location.pathname.includes('/card/edit/')) {
        $(".like-number").text(likeNumber);
        confetti();
    } else { // db 업데이트
        $(".like-number").text(likeNumber);
        confetti();
        $.ajax({
            url: '/card/completedCard/like.do',
            type: 'POST',
            data: {cardID:cardID},
            async: false
        });
    }
})

function confetti() {
    jsConfetti.addConfetti({
        emojis: emoji,
        emojiSize: 200,
        confettiNumber: 30,
    });
}

$(document).on('click', '.guestbook-submit-button', function() {
    var name = $(".guest-nickname").val();
    var message = $(".guest-message").val();

    $(".guest-nickname").val("");
    $(".guest-message").val("");

    if (window.location.pathname.includes("/completedCard")) {
        if (name === "" || message === "") {
            alert("빈 칸은 입력하실 수 없습니다.");
            return;
        }
        // ajax
        $.ajax({
            url: '/card/completedCard/guestBook.do',
            type: 'POST',
            contentType: 'application/json; charset=UTF-8',
            data: JSON.stringify({
                guestName: name,
                guestBookText: message,
                cardID: cardID
            })
        });
    }
    showGuestBook(name, message);
})

$(document).on('click', '.more-card', function() {
    if (!window.location.pathname.includes('/card/edit/')) {
        location.href='/gallery'
    }
});

function showGuestBook(name, message) {
    var img, imgName;
    var className;
    var attrClass = $(".message-block:last-child").attr("class");
    if (attrClass == "message-block" || attrClass == null) {
        className = "message-block odd";
    } else {
        className = "message-block";
    }
    var attrName = $(".guest-profile:last").attr("name");
    if (attrName == "pa" || attrName == null) {
        img = "/resources/img/card/common/guest-heart.png";
        imgName = "heart";
    } else if (attrName == "heart") {
        img = "/resources/img/card/common/guest-gift.png";
        imgName = "gift";
    } else {
        img = "/resources/img/card/common/guest-pa.png";
        imgName = "pa";
    }
    var temp;
    temp = `<div class="${className}"><img src=${img} class="guest-profile" name="${imgName}"/><div class="message-text"><b>${name}</b><br/>${message}</div></div>`;
    $(".guest-messages").append(temp);
}

function getMap(roadAddr) {
    var mapContainer = document.getElementById('map'),
        mapOption = {
            center: new kakao.maps.LatLng(0, 0), // 지도의 중심좌표
            level: 1, // 지도의 확대 레벨
            mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
        };

    // 지도를 생성한다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    var geocoder = new kakao.maps.services.Geocoder();
    geocoder.addressSearch(roadAddr, function (result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });
            map.setCenter(coords);
        }
    });
}