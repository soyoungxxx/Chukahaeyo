$(window).on('beforeunload', function () {
    return "수정사항이 취소됩니다. 계속하시겠어요?";
})

$(document).ready(function () {
    // 처음 선택 => 시각과 날짜 하나기 때문에 여러 개 선택은 숨김
    $('#edit-days').hide();
    $('.edit-showTime').hide();
    $('.edit-place').hide();
    $('.edit-prepare').hide();
    $('.edit-account').hide();

    // date range picker 세팅
    $('#edit-days').daterangepicker({
        autoUpdateInput: false,
        locale: {
            cancelLabel: 'Clear'
        }
    });
    $('#edit-days').on('apply.daterangepicker', function (ev, picker) {
        var startDate = picker.startDate.format('YYYY/MM/DD');
        var endDate = picker.endDate.format('YYYY/MM/DD');
        var selectDates = startDate + ' - ' + endDate;
        $(this).val(selectDates);
        $('.card-date').text(selectDates)
        $('#cardStartDate').val(startDate);
        $('#cardEndDate').val(endDate);
    });

    $('#edit-days').on('cancel.daterangepicker', function (ev, picker) {
        $(this).val('');
    });

    $('#edit-day').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        autoUpdateInput: false,
        minYear: 1901,
        maxYear: parseInt(moment().format('YYYY'), 10)
    });
    $('#edit-day').on('apply.daterangepicker', function (ev, picker) {
        var selectDate = picker.startDate.format('YYYY/MM/DD');
        $(this).val(selectDate);
        $('.card-date').text(selectDate);
        $('#cardStartDate').val(selectDate);
    })
    // 각각 library를 이용해 초기값 세팅


    // 어떤 버튼을 클릭하냐에 따라 hide and show - 날짜
    $('#edit-dayRadio').click(function () {
        $('#edit-days').hide();
        $('#edit-day').show();
    })
    $('#edit-daysRadio').click(function () {
        $('#edit-day').hide();
        $('#edit-days').show();
    })

    // 체크박스 제어
    $('#edit-time-select').click(function () {
        $('.edit-showTime').toggle();
        $('.extra-time').toggle();
    })
    $('#edit-place-select').click(function () {
        $('.edit-place').toggle();
        $('.extra-place').toggle();
    })
    $('#edit-prepare-select').click(function () {
        $('.edit-prepare').toggle();
        $('.extra-preparation').toggle();
    })
    $('#edit-account-select').click(function () {
        $('.edit-account').toggle();
        $('.extra-account').toggle();
    })
});

$('#publicButton').click(function () {
    var isPublicValue = $('#public').val();
    if (isPublicValue === 'true') {
        $('#public').val('false');
        $('#publicButton').val('비공개');
        alert("카드가 비공개로 변경되었습니다.");
    } else {
        $('#public').val('true');
        $('#publicButton').val('공개');
        alert("카드를 공개로 변경하시겠습니까? 모두가 볼 수 있는 카드 갤러리에 업로드 됩니다.");
    }
})