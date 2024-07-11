<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>PathFinder</title>
            <!-- Latest compiled and minified CSS -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

            <link rel="stylesheet" href="/main.css">
            </head>

            <body>
                
                <%@ include file="/WEB-INF/views/templates/header.jsp" %>
            
                <div class="container mt-5 mb-5">
                    <h2 class="text-center" style="color: rgb(27, 177, 197); text-shadow: 1px 1px 1px #000;">PathFinder</h2>
                    <h5 class="text-center">AI가 만들어주는 나만의 여행 계획</h5>
            
                    <form action="/plan_trip/reco_themes/" method="GET" class="mt-3 mb-3">
                        <div class="row justify-content-center">
                            <div class="col-md-2">
                                <select class="form-select" name="transfer" required>
                                    <option value="" disabled selected>교통수단</option>
                                    <option value="entire">전체</option>
                                    <option value="train">기차</option>
                                    <option value="plane">항공</option>
                                    <option value="car">렌트카</option>
                                    <option value="bus">버스</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <span class="input-group-text">출발지</span>
                                    <input type="text" class="form-control" name="depart" required>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <span class="input-group-text">도착지</span>
                                    <input type="text" class="form-control" name="arrive" required>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <select class="form-select" name="transfer_mem" required>
                                    <option value="" disabled selected>인원</option>
                                    <option value="1">1명</option>
                                    <option value="2">2명</option>
                                    <option value="3">3명</option>
                                    <option value="4">4명</option>
                                    <option value="5">5명</option>
                                    <option value="6">6명 +</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <button type="submit" class="btn btn-primary">찾기</button>
                            </div>
                        </div>
                        <div class="row justify-content-center mt-3">
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-text">출발일</span>
                                    <input type="date" class="form-control" name="depart_date" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-text">도착일</span>
                                    <input type="date" class="form-control" name="arrive_date" required>
                                </div>
                            </div>
                        </div>
                    </form>
            
                    <!-- Carousel -->
                    <div id="demo" class="carousel slide" data-bs-ride="carousel">
                        <!-- Indicators/dots -->
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                            <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
                            <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
                        </div>
            
                        <!-- The slideshow/carousel -->
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="https://img.kbs.co.kr/kbs/620/news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg" alt="Los Angeles" class="d-block" style="width:100%">
                            </div>
                            <div class="carousel-item">
                                <img src="https://blog.kakaocdn.net/dn/Gaa6y/btq88xwL5wG/RDSakUu1vGUFkKnUz0Pbh0/img.jpg" alt="Chicago" class="d-block" style="width:100%">
                            </div>
                            <div class="carousel-item">
                                <img src="https://www.gyotongn.com/news/photo/202306/345546_94278_5152.jpg" alt="New York" class="d-block" style="width:100%">
                            </div>
                        </div>
            
                        <!-- Left and right controls/icons -->
                        <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </button>
                    </div>
                </div>
            
                <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
            </body>
            </html>