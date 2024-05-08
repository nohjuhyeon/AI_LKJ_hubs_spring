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
            <link rel="stylesheet" href="/joinForm.css">

            <title>joinForm</title>
        </head>

        <body>
            <!-- Menu -->
            <%@ include file="/WEB-INF/views/templates/header.jsp" %>
                <form action="/joinProc" method="post" class="joinForm"
                    onsubmit="DoJoinForm__submit(this); return false;">
                    <div class="">
                        <h2>회원가입</h2>
                        <div class="textForm">
                            <input name="USER_ID" type="text" class="id" placeholder="아이디">
                            </input>
                        </div>
                        <div class="textForm">
                            <input name="USER_PWD" type="password" class="pw" placeholder="비밀번호">
                        </div>
                        <div class="textForm">
                            <input name="CHECK_PWD" type="password" class="pw" placeholder="비밀번호 확인">
                        </div>
                        <div class="textForm">
                            <input name="USER_NAME" type="text" class="name" placeholder="이름">
                        </div>
                        <div class="textForm">
                            <input name="USER_EMAIL" type="text" class="email" placeholder="이메일">
                        </div>
                        <div class="textForm">
                            <input name="USER_BIRTH" type="date" class="birthdate" placeholder="생년월일">
                        </div>
                        <div class="textForm">
                            <select name="GENDER" class="genderSelect">
                                <option value="" disabled selected>성별</option>
                                <option value="GENDER_01">남성</option>
                                <option value="GENDER_02">여성</option>
                            </select>
                        </div>
                        <div class="textForm">
                            <input name="USER_PHONE" type="tel" class="phone" placeholder="전화번호">
                        </div>
                        <div class="textForm">
                            <input name="USER_ADDRESS" type="text" class="address" placeholder="주소">
                        </div>
                        <div class="textForm">
                            <input type="radio" id="member" name="USER_AUTH" value="ROLE_MEMBER">
                            <label for="member">회원</label>
                            <input type="radio" id="admin" name="USER_AUTH" value="ROLE_ADMIN">
                            <label for="admin">관리자</label>
                        </div>
                        <div class="row">
                            <input type="submit" class="col-6 btn" value="J O I N" />
                            <button class="col-6 btn" formaction="/login" formmethod="get">취소</button>
                        </div>
                    </div>
                </form>

                <!-- Footer -->
                <%@ include file="/WEB-INF/views/templates/footer.jsp" %>

        </body>

        </html>