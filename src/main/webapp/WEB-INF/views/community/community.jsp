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

    <link rel="stylesheet" href="/main.css">
    <link rel="stylesheet" href="/plan_review.css">
    <title>Document</title>
</head>
<body>
    <!-- Menu -->
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>
    <div class="container" style="margin-top: 7px; margin-bottom: 7px;">
        
            <div class="col-8">
                <h2 class="mt-5" style="text-align: end;">여행기 커뮤니티</h2>
                <form class="mb-4">
                    <div class="container">
                        <div class="image-list">
                            <a href="" class="screen">
                                <div class="top">포항</div>
                                <div class="bottom">2023.01.01</div>
                                <img src="https://i.pinimg.com/564x/f2/4f/e1/f24fe1896f3228714cfdb8c7e9d2e41e.jpg" alt="img-3" class="image-item">
                            </a>
                            <a href="" class="screen">
                                <div class="top">경주</div>
                                <div class="bottom">2023.04.08</div>
                                <img src="https://i.pinimg.com/564x/cc/ed/37/cced37272e6f5ee5f9fd86ee658e7fea.jpg" alt="img-3" class="image-item">
                            </a>
                            <a href="" class="screen">
                                <div class="top">부산</div>
                                <div class="bottom">2023.04.16</div>
                                <img src="https://i.pinimg.com/564x/e1/dc/92/e1dc92f6587937a7b845a94baf50f0fb.jpg" alt="img-2" class="image-item">
                            </a>
                            <a href="" class="screen">
                                <div class="top">제주도</div>
                                <div class="bottom">2023.08.13</div>
                                <img src="https://i.pinimg.com/564x/c8/1d/a0/c81da0fa77c56f7f9bf6a87cd995e94a.jpg" alt="img-3" class="image-item">
                            </a>
                            <a href="" class="screen">
                                <div class="top">부산</div>
                                <div class="bottom">2023.9.25</div>
                                <img src="https://i.pinimg.com/564x/31/1b/70/311b700f1d32e577830fe9eef510691a.jpg" alt="img-3" class="image-item">
                            </a>
                            <a href="" class="screen">
                                <div class="top">서울</div>
                                <div class="bottom">2023.10.21</div>
                                <img src='https://i.pinimg.com/564x/74/35/a9/7435a9eb672107de18516dd10dd50ffc.jpg' alt="img-1" class="image-item">
                            </a>
                            <a href="" class="screen">
                                <div class="top">담양</div>
                                <div class="bottom">2023.11.05</div>
                                <img src="https://i.pinimg.com/564x/5a/13/a7/5a13a7252f5d6f583b6b584f8dae1c86.jpg" alt="img-3" class="image-item">
                            </a>
                            <a href="" class="screen">
                                <div class="top">강원도</div>
                                <div class="bottom">2023.12.24</div>
                                <img src="https://i.pinimg.com/564x/d2/72/f1/d272f19d225f573487e2a2e323a60d49.jpg" alt="img-3" class="image-item">
                            </a>
                            <a href="" class="screen">
                                <div class="top">강원도</div>
                                <div class="bottom">2024.01.20</div>
                                <img src="/images/pictures3.jpg" alt="img-3" class="image-item">
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>