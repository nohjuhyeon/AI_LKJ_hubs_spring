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
    <link rel="stylesheet" href="/loginForm.css">
    <title>loginForm</title>
</head>
<body>
    <!-- Menu -->
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <form class="myForm" action="/login" method="post">
                <img src="/images/pathfinderLOGO.png" alt="로고" width="200" height="100">
                <h1 class="h3 mb-3 fw-normal text-center">로그인</h1>
                <div class="mb-3">
                    <input type="text" class="form-control" id="input_email" placeholder="아이디" name="USER_ID">
                </div>
                <div class="mb-3">
                    <input type="password" class="form-control" id="input_password" placeholder="비밀번호" name="USER_PWD">
                </div>
                <div class="mb-3 row">
                    <div class="col-md-6">
                        <button class="btn btn-primary btn-block" formaction="/login" formmethod="post" type="submit">로그인</button>
                    </div>
                    <div class="col-md-6">
                        <button class="btn btn-light btn-block" type="button">비밀번호 찾기</button>
                    </div>
                </div>
                <div class="mb-3">
                    <p class="forgot-password">비밀번호를 잊으셨나요? <a href="#">비밀번호 재설정</a></p>
                    <p class="register-link">계정이 없으신가요? <a href="/joinForm">회원가입</a></p>
                </div>
                <p class="mt-5 mb-3 text-muted text-center">&copy; 2017–2023</p>
            </form>
        </div>
    </div>


    <!-- Footer -->
    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>