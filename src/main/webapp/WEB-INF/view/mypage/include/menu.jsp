<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<div class="menu">
    <div class="mypage-menu">
        <ul>
            <li><a href="/mypage/myCard" id="myCard">내 카드 보기</a></li>
            <li><a href="/mypage/changeInfo" id="changeInfo">내 정보 수정</a></li>
            <li><a href="/cart" id="cart">카드 꾸러미</a></li>
            <li><a href="/mypage/myHistory" id="myHistory">결제 내역</a></li>
            <li><a href="/board/inquiry/list?page=1&query=${memberName}&querytype=writer" id="inquiry">1:1 문의</a></li>
            <li><a href="/mypage/unregister" id="unregister">회원 탈퇴</a></li>
        </ul>
    </div>
</div>
<div class="v-line"></div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const menuItems = document.querySelectorAll('.mypage-menu ul li a');
        const currentUrl = window.location.pathname;

        menuItems.forEach(item => {
            if (item.getAttribute('href').split("?")[0] === currentUrl) {
                item.classList.add('selectedMenu');
            }
        });

        menuItems.forEach(item => {
            item.addEventListener('click', function(e) {
                e.preventDefault();

                menuItems.forEach(item => {
                    item.classList.remove('selectedMenu');
                });

                this.classList.add('selectedMenu');

                window.location.href = this.href;
            });
        });
    });
</script>