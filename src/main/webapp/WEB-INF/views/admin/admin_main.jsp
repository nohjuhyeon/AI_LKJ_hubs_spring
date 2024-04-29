<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/admin_main.css">
    <title>관리자 메인페이지</title>
</head>
<body>

    <main>
        <button id="prev-slide" class="slide-button material-symbols-rounded" onclick="goBack()">&lt;</button>
        <h1 class="visually-hidden">관리자 페이지</h1>
        <div class="container px-4 py-5" id="featured-3">
            <h2 class="pb-2 border-bottom">관리자 페이지</h2>
            <div class="row g-4 py-5 row-cols-1 row-cols-lg-3"></div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-sm-4">
                        <div class="card h-50">
                            <img src="/images/books.jpg" class="card-img-top" alt="..."
                                style="width: 100%; height: 100%;">
                            <div class="card-body">
                                <form action="">
                                    <h4 class="card-title"><strong>회원정보 관리</strong></h4>
                                    <p class="card-text">사용자들의 개인정보를 안전하게 보호하고 효율적으로 관리.</p>
                                    <button type="submit" class="btn btn-primary btn-lg"
                                        formaction="/admin_users">Click</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card h-50">
                            <img src="/images/community.jpg" class="card-img-top" alt="..."
                                style="width: 100%; height: 100%;">
                            <div class="card-body">
                                <form action="">
                                    <h4 class="card-title"><strong>커뮤니티 관리</strong></h4>
                                    <p class="card-text">사용자 간의 상호 작용과 소통을 원활하게 지원하는 핵심 기능.</p>
                                    <button type="submit" class="btn btn-primary btn-lg" formaction="/admin/contents"
                                        method="">Click</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card h-50">
                            <img src="/images/notice.jpg" class="card-img-top" alt="..."
                                style="width: 100%; height: 100%;">
                            <div class="card-body">
                                <form action="">
                                    <h4 class="card-title"><strong>공지사항 관리</strong></h4>
                                    <p class="card-text">사용자들에게 중요한 정보와 업데이트를 효과적으로 전달하는 핵심 기능.</p>
                                    <button type="submit" class="btn btn-primary btn-lg" formaction="/admin/notice"
                                        formmethod="">Click</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <script>
        function goBack() {
            window.history.back(); // 이전 페이지로 이동
        }
    </script>

</body>
</html>