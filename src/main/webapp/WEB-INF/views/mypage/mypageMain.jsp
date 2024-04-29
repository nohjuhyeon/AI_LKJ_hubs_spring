<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <link rel="stylesheet" href="/main.css">
            <link rel="stylesheet" href="/mypage_main.css">
            <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
            <title>mypagemain</title>
        </head>

        <body>
            <!-- Menu -->
            <%@ include file="/WEB-INF/views/templates/header.jsp" %>

                <div class="container-fluid mb-5">
                    <div class="row">
                        <div class="col-md-3 mt-3">
                            <div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
                                <a href="/"
                                    class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
                                    <svg class="bi me-2" width="30" height="24">
                                        <use xlink:href="#bootstrap"></use>
                                    </svg>
                                    <h2><span class="fs-3 fw-semibold">마이페이지</span></h2>
                                </a>
                                <ul class="list-unstyled ps-0">
                                    <li class="mb-1">
                                        <button class="btn btn-toggle align-items-center rounded"
                                            data-bs-toggle="collapse" data-bs-target="#home-collapse"
                                            aria-expanded="true">
                                            <strong>개인정보</strong>
                                        </button>
                                        <div class="collapse hidden" id="home-collapse">
                                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                                <li><a href="/mypageInfo" class="link-dark rounded">개인정보 수정</a></li>
                                                <li><a href="#" class="link-dark rounded">SNS 연결 설정</a></li>
                                                <li><a href="#" class="link-dark rounded">회원탈퇴</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="mb-1">
                                        <button class="btn btn-toggle align-items-center rounded"
                                            data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
                                            aria-expanded="true">
                                            <strong>관심내역</strong>
                                        </button>
                                        <div class="collapse hidden" id="dashboard-collapse">
                                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                                <li><a href="#" class="link-dark rounded">최근 본 상품</a></li>
                                                <li><a href="/mypage/plan_list" class="link-dark rounded">찜한 여행</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="mb-1">
                                        <button class="btn btn-toggle align-items-center rounded"
                                            data-bs-toggle="collapse" data-bs-target="#orders-collapse"
                                            aria-expanded="true">
                                            <strong>참여내역</strong>
                                        </button>
                                        <div class="collapse hidden" id="orders-collapse">
                                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                                <li><a href="#" class="link-dark rounded">나의 여행기</a></li>
                                                <li><a href="/mypageInsert_plan" class="link-dark rounded">여행계획 관리</a>
                                                </li>
                                                <li><a href="/mypageReview" class="link-dark rounded">여행 후기 관리</a>
                                                </li>
                                                <li><a href="/mypagePlan_list" class="link-dark rounded">내가 찜한 여행기</a>
                                                </li>
                                                <li><a href="/mypageReserve_list" class="link-dark rounded">예약 내역</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-9">
                            <div class="container">
                                <div class="row">
                                    <!-- 인사말 카드 -->
                                    <div class="col-md-12 mt-3">
                                        <div class="card mb-3">
                                            <div class="card-body">
                                                <p class="card-text">안녕하세요, PathFinder <span
                                                        class="text-primary">FAMILY</span>
                                                    <strong>김경하</strong>님!
                                                </p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- 예약내역 및 문의내역 카드 -->
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title"><strong>최근 예약내역</strong></h5>
                                                <a href="#" class="btn btn-primary">내 예약찾기</a>
                                                <a href="#" class="btn btn-secondary">전체보기</a>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- 문의내역 카드 -->
                                    <div class="col-md-6 mt-3">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title"><strong>문의내역</strong></h5>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item">패키지여행 1:1문의 <span
                                                            class="badge badge-primary">0건</span>
                                                    </li>
                                                    <li class="list-group-item">견적 문의 <span
                                                            class="badge badge-primary">0건</span></li>
                                                    <li class="list-group-item">개선/건의하기 <span
                                                            class="badge badge-primary">0건</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- 참여내역 카드 -->
                                    <div class="col-md-6 mt-3">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title"><strong>참여내역</strong></h5>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item">이벤트 <span
                                                            class="badge badge-primary">0건</span></li>
                                                    <li class="list-group-item">나의 여행기 <span
                                                            class="badge badge-primary">0건</span></li>
                                                    <li class="list-group-item">고객리뷰 <span
                                                            class="badge badge-primary">0건</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script>
                        document.getElementById('toggleButton').addEventListener('click', function () {
                            var content = document.getElementById('content');
                            if (content.classList.contains('hidden')) {
                                content.classList.remove('hidden');
                            } else {
                                content.classList.add('hidden');
                            }
                        });
                    </script>


                    <!-- Footer -->
                    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
        </body>

        </html>