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
    <title>예약 내역</title>
</head>
<body>
    <!-- Menu -->
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>
    <div class="row" style="margin-top: 10%; margin-bottom: 10%;">
        <div class="col-4">
            <h3 style="margin: 20px;">마이페이지</h3>
            <ul class="list-unstyled">
                <form class="row justify-contentt-start" style="margin-left: 10px; margin-top: 50px;">
                    <li>
                        <button class="col-9 themed-grid-col btn btn-light" style="font-size: 15px; margin: 10px;"
                            formaction="/mypageInfo" method="">개인정보수정</button>
                    </li>
                    <li>
                        <button class="col-9 themed-grid-col btn btn-light" style="font-size: 15px; margin: 10px;"
                            formaction="/mypageInsert_plan" method="">나의 여행계획 관리</button>
                    </li>
                    <li>
                        <button class="col-9 themed-grid-col btn btn-light" style="font-size: 15px; margin: 10px;"
                            formaction="/mypageReview" method="">나의 여행 후기 관리</button>
                    </li>
    
                    <li>
                        <button class="col-9 themed-grid-col btn btn-light" style="font-size: 15px; margin: 10px;"
                            formaction="/mypagePlan_list" method="">내가 찜한 여행기</button>
                    </li>
                    <li>
                        <button class="col-9 themed-grid-col btn btn-light" style="font-size: 15px; margin: 10px;"
                            formaction="/mypageReserve_list" method="">예약내역</button>
                    </li>
                </form>
            </ul>
        </div>
        <div class="col-8">
            <h2>예약 내역</h2>
            <form>
                <div style="margin-top: 50px; margin-bottom: 50px;">
    
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
        </div>
        </form>
    </div>
    </div>
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>