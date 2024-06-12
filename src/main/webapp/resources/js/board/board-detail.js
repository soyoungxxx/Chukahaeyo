window.onload = function(){
    function commentAjax (){
        $.ajax({
            type: "get",
            url: '/board/comment/list',
            async: true,
            dataType: 'json',
            data: {
                "boardId" : $(".board-id").val()
            },
            success: function (result) {
                alert("wwww");
                console.log(result);

            },

            error: function (request, status, error) {
                alert("eeeee");
            }

        })
    };

    commentAjax();



};




