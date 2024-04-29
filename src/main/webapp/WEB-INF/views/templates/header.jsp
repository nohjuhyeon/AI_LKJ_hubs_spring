<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="userDetailsBean" />

<div class="container">
    <div class="row justify-content">
        <div class="container">
            <header class="d-flex flex-wrap justify-content-center py-3 border-bottom">
                <a href="/"
                    class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <svg class="bi me-2" width="40" height="32">
                        <use xlink:href="#bootstrap"></use>
                    </svg>
                    <span class="fs-4"><strong>PathFinder</strong></span>
                </a>
                <ul class="nav nav-pills">
                    <li class="nav-item"><a href="/loginForm" class="nav-link">로그인</a></li>
                    <li class="nav-item"><a href="/logoutForm" class="nav-link">로그아웃</a></li>
                    <li class="nav-item"><a href="/mypageMain" class="nav-link">마이페이지</a></li>  
                    <li class="nav-item"><a href="/admin_main" class="nav-link">관리자</a></li>
                </ul>
            </header>
        </div>
    </div>
    <nav class="container" id="template_nav">
        <ul class="nav nav-pills nav-justified navbar navbar-expand-sm bg-light">
            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">여행정보</a>
                <ul class="dropdown-menu">
                    <li>
                        <a class="dropdown-item" href="/plan_trip/reserve_transfer">교통편</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="/plan_trip/reserve_dorm">숙소</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="/plan_trip/reserve_tour">투어/티켓</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="/plan_trip/reco_trip_plan">여행 테마</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="/plan_trip/trip_plan">여행 계획 짜기</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/community">여행기</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">이벤트</a>
                <ul class="dropdown-menu">
                    <li>
                        <a class="dropdown-item" href="/event/best_region">월별 추천 여행지</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="/event/recommend_region">관광지 추천</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">고객센터</a>
                <ul class="dropdown-menu">
                    <li>
                        <a class="dropdown-item" href="/consult/user_notice">공지사항</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="/consult/frequent_CS">자주 묻는 질문</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="/one_on_one_CS_main">1:1 문의</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="/consult/data_chart">데이터 현황 차트</a>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>