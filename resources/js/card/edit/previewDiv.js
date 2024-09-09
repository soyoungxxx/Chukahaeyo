// preview div 에 실시간 반영
$('.all-content').ready(function () {
    $('#edit-name').on('input', function () { // 이름
        var nameText = $(this).val();
        $('.card-name').text(nameText);
    });
    $('#edit-text').on('input', function () { // 설명
        var editText = $(this).val();
        editText = editText.replaceAll(/(\n|\r\n)/g, "<br>");
        $('.card-message').html(editText);
    });
    $('#edit-time').change(function () { // 시간
        var time = $('#edit-time').val();
        if (time.split(":")[0] > 12) {
            console.log(time.split(":")[0] - 12);
            console.log("PM " + (time.split(":")[0] - 12) + ":" + time.split(":")[1])
            time = "PM " + (time.split(":")[0] - 12) + ":" + time.split(":")[1];
        } else {
            time = "AM " + time;
        }
        $('.extra-time').text(time);
    });
    $('#emoji1').change(function () { // 이모지
        emoji[0] = $("#emoji1").val();
    });
    $('#emoji2').change(function () {
        emoji[1] = $("#emoji2").val();
    });
    $('#emoji3').change(function () {
        emoji[2] = $("#emoji3").val();
    });
    $('#emoji4').change(function () {
        emoji[3] = $("#emoji4").val();
    });
    $('#addr2').on('input', function () { // 장소
        $(".extra-address").html(address + "<br>" + $(this).val());
    })
    // 준비물
    $('.edit-prepare').on('input', function () {
        var pre = $(this).val();
        pre = pre.replaceAll(/(\n|\r\n)/g, "<br>");
        $('.extra-preparation').html("< 준비물 > <br> "+ pre);
    });
    // 계좌 번호
    $('#edit-bank').on('input', function () {
        var bank = $(this).val();
        $('.extra-account-bank').text(bank);
    })
    $('#edit-account-number').on('input', function () {
        var accountNumber = $(this).val();
        $('.extra-account-number').text(" " + accountNumber);
    })
});