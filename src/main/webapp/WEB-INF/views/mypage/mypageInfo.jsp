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
    <title>개인정보 수정</title>
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
                            formaction="/mypage/plan_list" method="">내가 찜한 여행기</button>
                    </li>
                    <li>
                        <button class="col-9 themed-grid-col btn btn-light" style="font-size: 15px; margin: 10px;"
                        formaction="/mypageReserve_list" method="">예약내역</button>
                    </li>
                </form>
            </ul>
        </div>
    
        <div class="col-8">
            <h2>개인정보수정</h2>
            <form>
                <div style="margin-top: 50px; margin-bottom: 50px;">
                    <div class="row">
                        <label for="email" class="form-label">프로필 사진</label>
                        <img class="col-4" src="\images\ID_photo.png" alt="프로필 사진">
                        <button class="btn btn-primary col-1" formaction="" method="">수정</button>
                        <button class="btn btn-light col-1" formaction="" method="">삭제</button>
                    </div>
                    <div class="row">
                        <label for="email" class="form-label">Email</label>
                        <input type="text" class="form-control col-8" id="email" value="" 
                            required onfocus="clearInput('email')">
                        <button class="btn btn-primary col-1" onclick="clearInput('email')" formaction="" method="">수정</button>
                    </div>
    
                    <div class="row">
                        <label for="password" class="form-label">기존 비밀번호</label>
                        <input type="text" class="form-control col-8" id="password" value=""
                            required onfocus="clearInput('password')">
                        <button class="btn btn-primary col-1" onclick="clearInput('password')" formaction="" method="">수정</button>
                    </div>
                    <div class="row">
                        <label for="password_new" class="form-label">비밀번호 입력</label>
                        <input type="text" class="form-control col-8" id="password_new" placeholder="**********" value=""
                            required onfocus="clearPlaceholder('password_new')">
                        <button class="btn btn-primary col-1" onclick="clearPlaceholder('password_new')" formaction="" method="">수정</button>
                    </div>
                    <div class="row">
                        <label for="password_check" class="form-label">비밀번호 재입력</label>
                        <input type="text" class="form-control col-8" id="password_check" placeholder="**********" value=""
                            required onfocus="clearPlaceholder('password_check')">
                        <button class="btn btn-primary col-1" onclick="clearPlaceholder('password_check')" formaction="" method="">수정</button>
                    </div>
                    <div class="row">
                        <label for="yymmdd" class="form-label">생년월일</label>
    
                        <input type="date" class="form-control col-9" id="yymmdd" value="" required="">
    
                    </div>
                    <div class="row">
                        <label for="phone" class="form-label">휴대전화번호</label>
                        <input type="text" class="form-control col-9" id="phone" value=""
                            required="">
                    </div>
                    <div class="row">
                        <label for="address" class="form-label">주소</label>
                        <input type="text" class="form-control col-9" id="address" value=""  required="">
                    </div>
    
                    <script>
                        function clearPlaceholder(inputId) {
                            document.getElementById(inputId).placeholder = '';
                        }
                        
                        function clearInput(inputId) {
                            document.getElementById(inputId).value = '';
                        }
                    </script>
    
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
                <div class="row justify-content-end" style="margin: 20px;">
                    <button class="col-2 btn btn-primary" formaction="/"method="">저장</button>
                    <button class="col-2 btn btn-light" formaction="/mypage" method="">취소</button>
                </div>
            </form>
    
        </div>
    </div>
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>