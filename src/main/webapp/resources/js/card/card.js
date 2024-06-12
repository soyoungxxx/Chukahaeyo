// 캔버스 객체 불러와서 컨페티로 등록하기
var canvas = document.querySelector("canvas");
const jsConfetti = new JSConfetti({ canvas });

const image = $("#card-bg")
const imageBasicHeight = image.height();
image.height(0);

window.addEventListener('load', getHeight)
window.addEventListener('load', getMap($(".extra-address").text()))
window.addEventListener('resize', getHeight);

function getHeight() {
    var docHeight = $(".card-roof-img").height() + $('.card-content').height() + 100;
    console.log(docHeight);
    if (imageBasicHeight <= docHeight) {
        image.height(imageBasicHeight);
    } else {
        image.height(docHeight);
    }
}

// like 버튼 클릭 시 숫자 올라가고, 이모티콘 컨페티 터지는 효과
var emoji = ["🎉", "🎊", "✨", "🎈"];
$("#like").click(function () {
    const likeNumber = Number($(".like-number").text() + 1);
    $.ajax({
        url: '/card/like.do',
        type: 'POST',
        data: likeNumber,
        success: function () {
            $(".like-number").text(likeNumber);
        }
    })
    jsConfetti.addConfetti({
        emojis: emoji,
        emojiSize: 200,
        confettiNumber: 30,
    })
});

// 방명록 등록
$(".guestbook-submit-button").click(function () {
    var name = $(".guest-nickname").val();
    var message = $(".guest-message").val();

    $(".guest-nickname").val("");
    $(".guest-message").val("");

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
    temp = `<div class="${className}">
                    <img src=${img} class="guest-profile" name="${imgName}"/>
                    <div class="message-text">${name}<br />${message}</div>
                </div>`;
    $(".guest-messages").append(temp);
})

function getMap(roadAddr) {
    var mapContainer = document.getElementById('map'),
        mapOption = {
            center: new kakao.maps.LatLng(37.56691, 126.97873), // 지도의 중심좌표
            level: 1, // 지도의 확대 레벨
            mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
        };

    // 지도를 생성한다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    var geocoder = new kakao.maps.services.Geocoder();
    geocoder.addressSearch(roadAddr, function (result, status) {
        if (status === kakao.maps.services.Status.OK) {
            console.log(1);
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            map.setCenter(coords);
        }
    });
}