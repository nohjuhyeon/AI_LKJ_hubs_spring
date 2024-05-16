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
    <title>1:1 문의</title>
</head>
<body>
    <!-- Menu -->
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>
    <div class="container">
        <h2 class = "fs-4">1대1 문의</h2>
        <form action="/one_on_one_CS_write" method="post" onsubmit="submitForm(); return false;">
            
            <div class="form-group">
                <label for="name">아이디:</label>
                <input type="text" class="form-control" id="name" name="USER_ID" required>
            </div>
            <div class="form-group">
                <label for="writer">이름:</label>
                <input type="text" class="form-control" id="writer" name="INQUIRY_WRITER" required>
            </div>
            <div class="form-group">
                <div class="form-group">
                    <label for="INQUIRY_PASSWORD">비밀번호(4자리):</label>
                    <input type="password" class="form-control" id="INQUIRY_PASSWORD" name="INQUIRY_PASSWORD" pattern="\d{4}" required>
                </div>    
            </div>
            <div class="form-group">
                <label for="title">문의제목:</label>
                <input type="text" class="form-control" id="title" name="INQUIRY_TITLE" required>
            </div>
            <div class="form-group">
                <label for="inquiry">문의내용:</label>
                <textarea class="form-control" id="inquiry" name="INQUIRY_CONTENT" rows="3" required></textarea>
            </div>
            <input type="hidden" id="date" name="INQUIRY_DATETIME">
            <button type="submit" class="btn btn-primary" formaction="/one_on_one_CS_write" formmethod="post">문의하기</button>
            <button type="submit" class="btn btn-danger" formaction="/one_on_one_CS_main" formmethod="get">CANCEL</button>
        </form>
    </div>

    <script>
        // 문의하기 버튼을 눌렀을 때 실행되는 함수
        function submitForm() {
            // 작성 당일 날짜를 가져옵니다.
            var today = new Date();
            var year = today.getFullYear();
            var month = today.getMonth() + 1;
            var day = today.getDate();

            // 날짜 형식을 'YYYY-MM-DD'로 조정합니다.
            var dateString = year + '-' + (month < 10 ? '0' + month : month) + '-' + (day < 10 ? '0' + day : day);

            // 폼 데이터를 가져옵니다.
            var formData = {
                USER_ID: document.getElementById('name').value,
                INQUIRY_WRITER: document.getElementById('writer').value,
                INQUIRY_TITLE: document.getElementById('title').value,
                INQUIRY_CONTENT: document.getElementById('inquiry').value,
                INQUIRY_PASSWORD: document.getElementById('INQUIRY_PASSWORD').value,
                INQUIRY_DATETIME: dateString
            };

            // AJAX 요청을 보냅니다.
            $.ajax({
                type: 'POST',
                url: '/one_on_one_CS_write',
                data: formData,
                success: function(response) {
                    // 서버로부터 응답을 받으면 경고창을 표시합니다.
                    alert("게시물이 정상적으로 등록되었습니다.");

                    // OK 버튼을 누르면 /one_on_one_CS_main 페이지로 이동합니다.
                    // 이동 시에도 로그인 상태를 유지하기 위해 브라우저에 저장된 세션 정보를 함께 전송합니다.
                    window.location.href = "/one_on_one_CS_main?session=<%= session.getId() %>";
                },
                error: function(xhr, status, error) {
                    // 오류가 발생하면 콘솔에 오류를 출력합니다.
                    console.error(xhr.responseText);
                }
            });

            // 폼 제출을 방지합니다.
            return false;
        }
    </script>
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>