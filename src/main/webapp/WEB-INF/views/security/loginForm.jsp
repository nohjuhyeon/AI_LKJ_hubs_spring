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
    <title>loginForm</title>
</head>
<body>
    <!-- Menu -->
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>

        <div class="row" style="text-align: center; margin-top: 20%; margin-bottom: 20%;">
            <form class="myForm">
                <img class="mb-4" src="" alt="로고" width="72" height="57">
                <h1 class="row justify-content-center h3 mb-3 fw-normal ">로그인</h1>
                <br>
                <div class="row mb-3 text-center">
                    <div class="col-md-3 themed-grid-col">
                        <div class="row">
                            <input type="text" style="font-size: 20px; padding: 3px" readonly
                                class="form-control-plaintext text-center" value="ID">
                            <input type="text" style="font-size: 20px; padding: 3px" readonly
                                class="form-control-plaintext text-center" value="PW">
                        </div>
                    </div>
                    <div class="col-md-6 themed-grid-col">
                        <div class="row">
                            <input type="email" class="form-control col-12" id="input_email" placeholder="name@example.com"
                                name="login_email">
                            <input type="password" class="form-control col-12" id="input_password" placeholder="Password"
                                name="login_password">
                        </div>
                    </div>
                    <div class="col-md-2 themed-grid-col">
                        <button class="col-md-12 themed-grid-col btn btn-primary"
                            style="font-size: 20px; padding: 20px; width: 200px" formaction="/login_check" formmethod="post">Login</button>
                    </div>
                    <br>
                    <div>
                        <button class="col-md-3 themed-grid-col btn btn-light" style="font-size: 15px">ID/PW 찾기</button>
                        <button class="col-md-3 themed-grid-col btn btn-light" style="font-size: 15px" formaction="/joinForm"
                            method="GET">회원가입 우리 팀에 경하가 있어서 다행이에요 \^o^/</button>
                    </div>
                </div>
                <p class="mt-5 mb-3 text-body-secondary">© 2017–2023</p>
            </form>
        </div>


    <!-- Footer -->
    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>