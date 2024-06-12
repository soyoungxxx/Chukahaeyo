$(function(){
    $(".content").hide();

    $(".arrow").click(function(e){
        $(e.target).closest(".faq-inner-container").next().toggle();

    });


});