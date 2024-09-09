$('.edit-frame').click(function () {
    var templateID = $(this).attr("id");
    templateThumbnail = $(this).attr("src");

    removeInfo();
    $('.edit-upper-div').unwrap();
    $('.edit-upper-div').remove();

    if ($('#edit-time-select').is(':checked')) $('#edit-time-select').click();
    if ($('#edit-place-select').is(':checked')) $('#edit-place-select').click();
    if ($('#edit-prepare-select').is(':checked')) $('#edit-prepare-select').click();
    if ($('#edit-account-select').is(':checked')) $('#edit-account-select').click();

    $.ajax({
        type: "GET",
        url: "/card/edit/template.do",
        data: {id: templateID},
        contentType: "text/html; charset:UTF-8",
        success: function (data) {
            $('.edit-preview-div').html(data);
            $('.date').text($('#edit-day').val()); // 템플릿 선택 시 날짜 초기값 세팅

            // 템플릿 선택시.. css 선택
            let templateCss = templateThumbnail.substring(25);
            templateCss = templateCss.substring(0, templateCss.length - 4);

            $('#cardCss').prop("href", "/resources/css/template/" + templateCss + ".css");
        }
    })
})

function removeInfo() {
    $("input[type='text']").val("");
    $("textarea").val("");
    $(".edit-file-label").val("");
    $("input[type='time']").val("");
}