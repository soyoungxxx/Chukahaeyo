<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
    <!-- Sidebar Toggle (Topbar) -->
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>

    <!-- Topbar Navbar -->
    <ul class="navbar-nav ml-auto">

        <!-- Nav Item - Alerts -->
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter">
                    ${sessionScope.inquiryList.size()}<c:if test="${sessionScope.inquiryList.size()>0}">+</c:if>
                </span>
            </a>
            <!-- Dropdown - Alerts -->
            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                 aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                    알림
                </h6>
                <c:forEach var="inquiry" items="${sessionScope.inquiryList}" varStatus="status">
                    <a class="dropdown-item d-flex align-items-center"
                       href="/admin/inquiry/write?inquiryID=${inquiry.inquiryID}">
                        <div class="mr-3">
                            <c:if test="${status.index+1%2!=0}">
                                <div class="icon-circle bg-primary">
                                    <i class="fas fa-file-alt text-white"></i>
                                </div>
                            </c:if>
                            <c:if test="${status.index+1%2==0}">
                                <div class="icon-circle bg-success">
                                    <i class="fas fa-donate text-white"></i>
                                </div>
                            </c:if>
                        </div>
                        <div>
                            <div class="small text-gray-500">
                                <fmt:formatDate pattern="yyyy.MM.dd" value="${inquiry.inquiryPostDate}"/>
                            </div>
                            <span class=".font-weight-normal">
                                    ${inquiry.inquiryQuestionTitle}
                            </span>
                        </div>
                    </a>
                </c:forEach>
                <a class="dropdown-item text-center small text-gray-500" href="/admin/inquiry/allInquiryList">1:1 문의글 전체보기</a>
            </div>

        </li>

        <div class="topbar-divider d-none d-sm-block"></div>

        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.adminEmail}</span>
                <img class="img-profile rounded-circle" src="/resources/img/admin/undraw_profile.svg">
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                 aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    Logout
                </a>
            </div>
        </li>
    </ul>
</nav>

<!-- End of Topbar -->