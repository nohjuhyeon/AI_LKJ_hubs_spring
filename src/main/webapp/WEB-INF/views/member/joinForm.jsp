<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <title>joinForm</title>
</head>

<body>
    <!-- Menu -->
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>
    <div class="row">
        <h2>회원가입</h1>
            <form>
                <div class="row">
                    <div class="col-8">
                        <br>
                        <br>
                        <div class="row">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control col-8" id="email" placeholder="example@example.com"
                                name="user_email" required="">
                            <button class="btn btn-primary col-1" formaction="" method="">중복 확인</button>
                        </div>
                        <div class="row">
                            <label for="password" class="form-label">비밀번호</label>
                            <input type="password" class="form-control col-8" id="password" placeholder="**********"
                                name="user_password" required="">
                            <button class="btn btn-primary col-1" formaction="" method="">확인</button>
                        </div>
                        <div class="row">
                            <label for="password_check" class="form-label">비밀번호 확인</label>
                            <input type="password" class="form-control col-8" id="password_check" placeholder="**********"
                                name="password_check" required="">
                            <button class="btn btn-primary col-1" formaction="" method="">확인</button>
                        </div>
                        <div class="row">
                            <label for="user_name" class="form-label">닉네임</label>
                            <input type="text" class="form-control col-9" id="user_name" placeholder="닉네임" name="user_name"
                                required="">
                        </div>
                        <div class="row">
                            <label for="user_birth" class="form-label">생년월일</label>
                            <input type="date" class="form-control col-9" id="user_birth" placeholder="생년월일" name="user_birth"
                                required="">
                        </div>
    
                            <!-- 나중에 select형식으로 만들어도 좋을거같아서 남겨요.. -->
                            <!-- <select class="form-select" id="yymmdd" required>
                            <option value>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                        </select> -->
                        <div class="row">
                            <label for="phone" class="form-label">휴대전화번호</label>
                            <input type="text" class="form-control col-9" id="phone" placeholder="0123456789"
                                name="user_phone_number" required="">
                        </div>
                        <div class="row">
                            <label for="address" class="form-label">주소</label>
                            <input type="text" class="form-control col-9" id="address" placeholder="주소" name="user_address"
                                required="">
                        </div>
                    </div>
                    <div class="col-4 ">
                        <br>
                        <br>
                        <div>
                            <div class="mb-4 d-flex justify-content-center">
                                <img id="selectedImage" src="images\ID_photo.png" alt="example placeholder"
                                    style="width: 300px;" />
                            </div>
                            <div class="d-flex justify-content-center">
                                <div class="btn btn-primary btn-rounded">
                                    <label class="form-label text-white m-1" for="customFile1">첨부하기</label>
                                    <input type="file" class="form-control d-none" id="customFile1" name="user_img"
                                        onchange="displaySelectedImage(event, 'selectedImage')" />
                                </div>
                            </div>
                        </div>
                    </div>
    
                </div>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <div class="row justify-content-end" style="margin: 20px;">
                    <button class="col-2 btn btn-primary" formaction="/login_insert" formmethod="post">회원가입</button>
                    <button class="col-2 btn btn-light" formaction="/login" formmethod="get">취소</button>
                </div>
            </form>
    </div>
    
    <script>
        function displaySelectedImage(event, elementId) {
            const selectedImage = document.getElementById(elementId);
            const fileInput = event.target;
    
            if (fileInput.files && fileInput.files[0]) {
                const reader = new FileReader();
    
                reader.onload = function (e) {
                    selectedImage.src = e.target.result;
                };
    
                reader.readAsDataURL(fileInput.files[0]);
            }
        }
    </script>

    <!-- Footer -->
    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>

</body>

</html>