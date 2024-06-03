<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>축하해요</title>
    <link rel="stylesheet" href="/resources/css/common.css"/>
    <style>
        /*카드 종류 나오는 부분*/
        h2 {
            margin-top: 50px;
        }

        /*edit, preview, frame이 들어가는 공간*/
        .main-div {
            justify-content: center;
            width: 100%;
            height: 100%;
            display: flex;
        }

        /*각각의 공간과 버튼이 들어가는 공간*/
        .edit-div {
            width: 20%;
            height: 100%;
            margin-right: 20px;
            background-color: #EEEEEE;
            text-align: center;
        }
        .middle-div {
            width: 60%;
            height: 100%;
        }
        .preview-div {
            width: 100%;
            height: 90%;
            background-color: #E4E4E4;
        }
        .button-div {
            text-align: center;
            height: 10%;
        }

        /*버튼 스타일*/
        input[type="button"] {
            position:relative;
            width: 30%;
            height: 90%;
            margin-top: 1%;
            border: 0;
            box-shadow: 0px 4px 0px #b6b6b6;
            background-color: #E2E2E2;
            font-size: 24px;
        }
        /*버튼 눌렸을 때*/
        input[type="button"]:active{
            box-shadow: 0 0 #adadad;
            background-color: #acacac;
        }

        .frame-div {
            width: 20%;
            height: 100%;
            margin-left: 20px;
            background-color: #EEEEEE;
        }

        /*edit div에 들어가는 각 항목들*/
        .comp {
            margin-top: 30px;
            text-align: left;
            margin-left: 20px
        }

        /*edit div에 들어가는 항목의 이름과 '필수 항목입니다' 경고*/
        .head-text {
            font-size:20px;
            font-weight:bold;
        }
        .warn-text {
            font-size:11px;
            color:#FF0000;
        }

        /*edit div 내의 text box*/
        input[type="text"] {
            margin-top: 10px;
            width: 85%;
            height: 30px;
            font-size: 15px;
        }

        /*구분선*/
        hr {
            width: 90%;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        /*radio 버튼*/
        input[type="radio"] {
            margin: 20px 10px 10px 10px;
        }
    </style>


    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main">
    <div class="sticker1" style="margin-right: 50px"></div>
    <div style="width: 100%; height: 85%;">
        <h2>< 카드 종류 > 가 만들어지는 중</h2>
        <div class="main-div">
            <div class="edit-div">
                <div class="comp">
                    <span class="head-text">이름</span>
                    <span class="warn-text">필수 항목입니다.</span>
                    <input type="text"/>
                </div>
                <hr>
                <div class="comp">
                    <span class="head-text">날짜</span>
                    <span class="warn-text">필수 항목입니다.</span> <br>
                    <input type="radio" checked id="dayRadio" name="day">하루 선택 <br>
                    <input type="radio" id="daysRadio" name="days"/>여러날 선택
                    <input type="text" id="day" value="" placeholder="날짜 선택"/>
                    <input type="text" id="days" value="" placeholder="날짜 선택"/>
                </div>
                <hr>
            </div>
            <div class="middle-div">
                <div class="preview-div">

                </div>
                <div class="button-div">
                    <input type="button" value="장바구니 담기"/>
                    <input type="button" value="결제하기"/>
                    <input type="button" value="공개/비공개"/>
                </div>
            </div>
            <div class="frame-div">

            </div>
        </div>
    </div>
    <div class="sticker2" style="margin-left: 50px"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>

<script type="text/javascript">
    $(function() {
        $('#day').daterangepicker({
            autoUpdateInput: false,
            locale: {
                cancelLabel: 'Clear'
            }
        });
        $('#day').on('apply.daterangepicker', function(ev, picker) {
            $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
        });

        $('#day').on('cancel.daterangepicker', function(ev, picker) {
            $(this).val('');
        });

        $('input[name="birthday"]').daterangepicker({
            singleDatePicker: true,
            showDropdowns: true,
            minYear: 1901,
            maxYear: parseInt(moment().format('YYYY'),10)
        });

        $('#days').hide();

        $('#dayRadio').click(function() {
            $('#days').hide();
            $('#day').show();
        })
        $('#daysRadio').click(function() {
            $('#day').hide();
            $('#days').show();
        })
    });

</script>
</body>


</html>