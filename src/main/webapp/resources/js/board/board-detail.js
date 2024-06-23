window.addEventListener('load' , function(e){
    $(".delete").click(function (e) {
        if (confirm("정말로 지우시겠습니까?")) {
            let commID = $(".board-id").val();

            const form = document.createElement('form'); // form 태그 생성
            form.setAttribute('method', 'post'); // 전송 방식 결정 (get or post)
            form.setAttribute('action', "/board/community/delete"); // 전송할 url 지정


            const data_3 = document.createElement('input');
            data_3.setAttribute('type', 'hidden');
            data_3.setAttribute('name', 'commID');
            data_3.setAttribute('value', commID);
            // form 태그에 input 태그 넣고 summit 가능하게 처리
            form.appendChild(data_3);

            document.body.appendChild(form);

            form.submit();


        }


    });


    function commentAjax(replyID) {
        $.ajax({
            type: "get",
            url: '/board/comment/list',
            async: true,
            dataType: 'json',
            data: {
                "commID": $(".board-id").val()
            },
            success: function (result) {
                $(".comment-container").empty();
                $(".comment-container").append(
                    `
                    <div class="main-comment-write">
                        <div>
                            <div class="main-comment-write-nickname">${$(".my-member-name").val()}</div>
                        </div>
                        <div class="main-comment-write-inner">
                            <input class="main-comment-write-text" type="text" placeholder="댓글을 남겨보세요"> <input class="main-comment-write-button" type="button" value="등록">
                        </div>
                    </div>
                    `
                );


                if (result.totalCount == 0) {
                    $(".comment-container").append(
                        `<div class="no-comment">댓글이 없습니다.</div>`
                    );
                } else {
                    $(".comment-display-data").text(result.totalCount);
                }


                for (let comment of result.list) {
                    let date = new Date(comment.replyPostDate);
                    if (comment.replyNested > 0) {

                        $(".comment-container").append(
                            `
                            <div class="sub-data-comment">
                                <div style="width: ${(comment.replyNested - 1) * 30}px; height: 30px;"></div>
                                <img class="sub-data-comment-img" src="/resources/img/board/re-comment.png" >
                                <div class="sub-data-comment-inner">
                                    <input type="hidden" class="reply-id" name="replyID" value="${comment.replyID}"/>
                                    <input type="hidden" class="reply-gno" name="replyGno" value="${comment.replyGno}"/>
                                    <input type="hidden" class="reply-ono" name="replyOno" value="${comment.replyOno}"/>
                                    <input type="hidden" class="reply-nested" name="replyNested" value="${comment.replyNested}"/>
                                    <div class="sub-data-comment-inner-writer" style="font-weight: bold;">${comment.memberName}</div>
                                    <div class="sub-data-comment-inner-content">${comment.replyContent}</div>
                                    <div class="sub-data-comment-inner-date">${moment(date).format('YY/MM/DD HH:mm')} <a class="sub-data-comment-replyshow">답글</a></div>
                                    <div class="sub-data-comment-write">
                                        <div>
                                            <div class="sub-data-comment-write-nickname">${$(".my-member-name").val()}</div>
                                        </div>
                                        <div class="sub-data-comment-write-inner">
                                            <input class="sub-data-comment-replytext" type="text" placeholder="댓글을 남겨보세요"> <input class="sub-data-comment-write-cancel-button" type="button" value="취소"><input class="sub-data-comment-replybutton" type="button" value="등록">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            `
                        );

                    } else {
                        $(".comment-container").append(
                            `
                                <div class="main-data-comment">
                                    <input type="hidden" class="reply-id" name="replyID" value="${comment.replyID}"/>
                                    <input type="hidden" class="reply-gno" name="replyGno" value="${comment.replyGno}"/>
                                    <input type="hidden" class="reply-ono" name="replyOno" value="${comment.replyOno}"/>
                                    <input type="hidden" class="reply-nested" name="replyNested" value="${comment.replyNested}"/>
                                    <div class="main-data-comment-writer" style="font-weight: bold;">${comment.memberName}</div>
                                    <div class="main-data-comment-content">${comment.replyContent}</div>
                                    <div class="main-data-comment-date">${moment(date).format('YY/MM/DD HH:mm')} <a class="main-data-comment-replyshow">답글</a></div>
                                    <div class="main-data-comment-write">
                                        <div>
                                            <div class="main-data-comment-write-nickname">${$(".my-member-name").val()}</div>
                                        </div>
                                        <div class="main-data-comment-write-inner">
                                            <input class="main-data-comment-replytext" type="text" placeholder="댓글을 남겨보세요"> <input class="main-data-comment-write-cancel-button" type="button" value="취소"><input class="main-data-comment-replybutton" type="button" value="등록">
                                        </div>
                                    </div>
                                </div>
                            `
                        );
                    }


                }


                /*focus 주기*/
                $(".sub-data-comment , .main-data-comment").each(function (index, item) {
                    if ($(item).find(".reply-id").val() == replyID) {
                        var offset = $(item).find(".reply-id").closest(".main-data-comment , .sub-data-comment").offset();
                        $("html, body").animate({scrollTop: offset.top}, 0);
                        return false;
                    }
                    return true;

                });
                /*focus 주기*/


                console.log(result);


                /*event 넣기*/
                if ($(".my-member-id").val() == 0) {
                    $(".main-data-comment-replyshow").hide();
                    $(".sub-data-comment-replyshow").hide();
                    $(".main-comment-write").hide();
                } else {

                }


                $(".main-data-comment-replyshow").closest("div").next().hide();

                $(".sub-data-comment-replyshow").closest("div").next().hide();

                $(".main-data-comment-replyshow").click(function (e) {
                    $(e.target).closest("div").next().toggle();

                });
                $(".sub-data-comment-replyshow").click(function (e) {
                    $(e.target).closest("div").next().toggle();

                });
                $(".main-comment-write-button").click(function (e) {

                    $(e.target).css("pointer-events", "none");
                    if ($(".main-comment-write-text").val().trim() == "") {
                        alert("댓글을 입력해 주세요.");
                        $(e.target).css("pointer-events", "auto");
                        return;
                    }
                    if ($(".main-comment-write-text").val().length > 80) {
                        alert("댓글은 80자를 넘을수 없습니다.");
                        $(e.target).css("pointer-events", "auto");
                        return;
                    }
                    let content = $(".main-comment-write-text").val();
                    if (xCheck(content)) {
                        alert("욕설은 포함될수 없습니다.");
                        $(e.target).css("pointer-events", "auto");
                        return;
                    }


                    $.ajax({
                        type: "post",
                        url: '/board/comment/mainwrite',
                        async: true,
                        dataType: 'json',
                        data: {
                            "commID": $(".board-id").val(),
                            "replyContent": $(".main-comment-write-text").val()
                        },
                        success: function (result) {
                            commentAjax(result);
                        },
                        error: function () {
                        }

                    });


                });

                $(".sub-data-comment-replybutton").click(function (e) {
                    $(e.target).css("pointer-events", "none");
                    if ($(e.target).closest(".sub-data-comment").find(".sub-data-comment-replytext").val().trim() == "") {
                        alert("댓글을 입력해 주세요.");
                        $(e.target).css("pointer-events", "auto");
                        return;
                    }
                    if ($(e.target).closest(".sub-data-comment").find(".sub-data-comment-replytext").val().length > 80) {
                        alert("댓글은 80자를 넘을수 없습니다.");
                        $(e.target).css("pointer-events", "auto");
                        return;
                    }
                    let content = $(e.target).closest(".sub-data-comment").find(".sub-data-comment-replytext").val();
                    if (xCheck(content)) {
                        alert("욕설은 포함될수 없습니다.");
                        $(e.target).css("pointer-events", "auto");
                        return;
                    }


                    $.ajax({
                        type: "post",
                        url: '/board/comment/subwrite',
                        async: true,
                        dataType: 'json',
                        data: {
                            "commID": $(".board-id").val(),
                            "replyContent": $(e.target).closest(".sub-data-comment").find(".sub-data-comment-replytext").val(),
                            "replyOno": $(e.target).closest(".sub-data-comment").find(".reply-ono").val(),
                            "replyGno": $(e.target).closest(".sub-data-comment").find(".reply-gno").val(),
                            "replyNested": $(e.target).closest(".sub-data-comment").find(".reply-nested").val()
                        },
                        success: function (result) {
                            commentAjax(result);
                        },
                        error: function () {
                        }

                    });

                });

                $(".main-data-comment-replybutton").click(function (e) {

                    // console.log("보드아이디 : "+$(".board-id").val());
                    // console.log("content : "+$(e.target).closest(".main-data-comment").find(".main-data-comment-replytext").val());
                    // console.log("ono : "+$(e.target).closest(".main-data-comment").find(".reply-ono").val());
                    // console.log("gno : "+$(e.target).closest(".main-data-comment").find(".reply-gno").val());
                    // console.log("nested : " + $(e.target).closest(".main-data-comment").find(".reply-nested").val());
                    $(e.target).css("pointer-events", "none");
                    if ($(e.target).closest(".main-data-comment").find(".main-data-comment-replytext").val().trim() == "") {
                        alert("댓글을 입력해 주세요.");
                        $(e.target).css("pointer-events", "auto");
                        return;
                    }
                    if ($(e.target).closest(".main-data-comment").find(".main-data-comment-replytext").val().length > 80) {
                        alert("댓글은 80자를 넘을수 없습니다.");
                        $(e.target).css("pointer-events", "auto");
                        return;
                    }
                    let content = $(e.target).closest(".main-data-comment").find(".main-data-comment-replytext").val();
                    if (xCheck(content)) {
                        alert("욕설은 포함될수 없습니다.");
                        $(e.target).css("pointer-events", "auto");
                        return;
                    }

                    $.ajax({
                        type: "post",
                        url: '/board/comment/subwrite',
                        async: true,
                        dataType: 'json',
                        data: {
                            "commID": $(".board-id").val(),
                            "replyContent": $(e.target).closest(".main-data-comment").find(".main-data-comment-replytext").val(),
                            "replyOno": $(e.target).closest(".main-data-comment").find(".reply-ono").val(),
                            "replyGno": $(e.target).closest(".main-data-comment").find(".reply-gno").val(),
                            "replyNested": $(e.target).closest(".main-data-comment").find(".reply-nested").val()
                        },
                        success: function (result) {
                            commentAjax(result);
                        },
                        error: function () {
                        }

                    });

                });

                $(".main-data-comment-write-cancel-button").click(function (e) {
                    $(e.target).closest(".main-data-comment").find(".main-data-comment-write").hide();
                });

                $(".sub-data-comment-write-cancel-button").click(function (e) {
                    $(e.target).closest(".sub-data-comment").find(".sub-data-comment-write").hide();
                });


                /*event 넣기*/

            },

            error: function (request, status, error) {
                alert("댓글 생성 에러 입니다. 관리자에게 문의해주세요.");
            }

        })
    };

    commentAjax();

    $(".heartred").click(function (e) {
        $(e.target).css("pointer-events", "none");
        $.ajax({
            type: "get",
            url: '/board/community/heartred',
            async: true,
            dataType: 'json',
            data: {
                "commID": $(".board-id").val()

            },
            success: function (result) {
                $(".like-display-data").text(result.boardLike);
                if (result.isRed == 1) {
                    $(".heartred").show();
                    $(".heartblack").hide();
                } else {
                    $(".heartred").hide();
                    $(".heartblack").show();
                }
                $(e.target).css("pointer-events", "auto");
            },
            error: function () {
            }

        });
    });


    $(".heartblack").click(function (e) {
        $(e.target).css("pointer-events", "none");
        $.ajax({
            type: "get",
            url: '/board/community/heartblack',
            async: true,
            dataType: 'json',
            data: {
                "commID": $(".board-id").val()

            },
            success: function (result) {
                $(".like-display-data").text(result.boardLike);
                if (result.isRed == 1) {
                    $(".heartred").show();
                    $(".heartblack").hide();
                } else {
                    $(".heartred").hide();
                    $(".heartblack").show();
                }
                $(e.target).css("pointer-events", "auto");
            },
            error: function () {
            }

        });
    });


    $(".list").click(function (e) {
        let ismy = $(".ismy").val();
        if(ismy == 'true'){
            location.href = '/board/community/mylist?query=' + $(".query").val() + '&querytype=' + $(".querytype").val() + '&page=' + $(".page").val() + '&sort=' + $(".sort").val();

        }else {
            location.href = '/board/community/list?query=' + $(".query").val() + '&querytype=' + $(".querytype").val() + '&page=' + $(".page").val() + '&sort=' + $(".sort").val();

        }


    });


});




