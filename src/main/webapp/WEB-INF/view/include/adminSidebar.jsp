<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<link href="/resources/css/admin/admin.css" rel="stylesheet">

<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/adminPage">
        <div class="sidebar-brand-text mx-3">chukahaeyo</div>
    </a>

    <hr class="sidebar-divider my-0">

    <li class="nav-item" id="dashboard">
        <a class="nav-link" href="/admin/adminPage">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>대시보드</span></a>
    </li>

    <hr class="sidebar-divider">
    <div class="sidebar-heading">
        management
    </div>

    <!-- 주문 목록 -->
    <li class="nav-item" id="orderList">
        <a class="nav-link" href="/admin/adminOrderList">
            <i class="fas fa-fw fa-cog"></i>
            <span>주문목록</span>
        </a>
    </li>

    <!-- 회원 목록 -->
    <li class="nav-item" id="memberList">
        <a class="nav-link" href="/admin/adminMemberList">
            <i class="fas fa-fw fa-wrench"></i>
            <span>회원목록</span>
        </a>
    </li>

    <hr class="sidebar-divider">
    <div class="sidebar-heading">
        service
    </div>

    <li class="nav-item" id="allInquiryList">
        <a class="nav-link" href="/admin/inquiry/allInquiryList">
            <!-- fa-folder: 이미지 class 태그 -->
            <i class="fas fa-fw fa-folder"></i>
            <span>1:1 문의</span>
        </a>
    </li>
    <hr class="sidebar-divider d-none d-md-block">
</ul>
<!-- End of Sidebar -->
