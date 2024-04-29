<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="..\css\commons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <style>
        nav {
            margin-top: 30px;
        }

        .navbar .nav-link {
            color: black;
        }

        .scrollable-box-list {
            max-height: 400px;
            overflow-y: scroll;
        }

        .scrollable-box-search {
            max-height: 220px;
            overflow-y: scroll;
        }

        .kakao-button {
            display: inline-block;
            background-color: #FEE500;
            color: #000;
            border-radius: 30px;
            border: 2px solid #3C1E1E;
            padding: 10px 20px;
            text-decoration: none;
            font-weight: bold;
        }

        .kakao-button:hover {
            background-color: #FEE500;
            color: #000;
        }

        .consulting-hours {
            display: block;
            font-size: 0.8em;
            color: #000;
        }

        .fs-4 {
            color: rgb(27, 177, 197);
            text-shadow: 1px 1px 1px #000;
        }

        body {
            background: #F1F4FD;
        }
    </style>
</head>

<body>
    <!-- Menu -->
    <%@ include file="/WEB-INFviews/templates/header.jsp" %>
        <main class="container">
            <form action="" method="get">
                <div class="row justify-content-end">
                    <div class="col-3 position-fixed bottom-0 start-0 mb-3 ms-3" style="width: 20%">
                        <a href="https://pf.kakao.com/_xaxdSxiG/chat" target="_blank" class="kakao-button">
                            카카오톡 1대1 상담
                            <span class="consulting-hours">상담시간 : 09:00~18:00</span>
                        </a>
                    </div>
                </div>
            </form>
        </main>
            <!-- Footer -->
            <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
    </div>

</body>

<!-- Latest compiled JavaScript -->

</html>