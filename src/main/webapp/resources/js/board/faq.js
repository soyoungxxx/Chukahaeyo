document.addEventListener("DOMContentLoaded", function() {
    const faqContainers = document.querySelectorAll(".faq-inner-container");

    faqContainers.forEach(container => {
        container.addEventListener("click", function() {
            // 토글 active 클래스
            const isActive = container.classList.toggle("active");

            // 콘텐츠 디스플레이 변경
            const content = container.nextElementSibling;
            if (isActive) {
                content.style.display = "block";
            } else {
                content.style.display = "none";
            }
        });
    });
});


$(document).ready(function() {
    const $menuItems = $('.service-menu ul li a');
    const currentUrl = window.location.pathname;

    $menuItems.each(function() {
        if ($(this).attr('href') === currentUrl) {
            $(this).addClass('selectedMenu');
        }
    });

    $menuItems.on('click', function(e) {
        e.preventDefault();

        $menuItems.removeClass('selectedMenu');
        $(this).addClass('selectedMenu');

        window.location.href = $(this).attr('href');
    });
});
