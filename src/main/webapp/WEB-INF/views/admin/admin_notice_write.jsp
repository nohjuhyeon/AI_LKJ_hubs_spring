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
    <title>공지사항 작성</title>
</head>
<body>
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>

    <h2 class="mt-2 ml-4">공지사항 작성</h2>

<div class="col-md-12">
    <div class="col-md-12">
        <form action="/admin_notices/admin_notice_write" method="post">
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" class="form-control" id="title" name="NOTICE_TITLE" placeholder="제목을 입력하세요">
            </div>
            <div class="form-group">
                <label for="author"> 작성자 </label>
                <input type="text" class="form-control" id="author" name="WRITER" placeholder="작성자를 입력하세요">
            </div>
            <div class="form-group">
                <label for="content"> 내용 </label>
                <textarea rows="10" class="form-control" id="content" name="CONTENT" placeholder="내용을 입력하세요"></textarea>
            </div>
            <input type="hidden" id="date" name="DATETIME">
            <a href="/admin_notices" role="button" class="btn btn-danger">취소</a>
            <button type="submit" class="btn btn-success" id="btn-submit" formaction="/admin_notices/admin_notice_write" formmethod="post">등록</button>
        </form>
    </div>
</div>

    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>

    <script>
       $(document).ready(function() {
            $('#btn-submit').click(function() {
                // 폼 데이터를 AJAX를 사용하여 서버로 전송
                $.ajax({
                    type: 'POST',
                    url: '/admin_notices/admin_notice_write',
                    data: $('#noticeForm').serialize(),
                    success: function(response) {
                        // 성공적으로 등록되었을 때 알림 창 표시
                        alert("공지사항이 제대로 등록되었습니다.");

                        // 확인을 클릭하면 admin_notices.jsp 페이지로 리다이렉트
                        window.location.href = '/admin_notices/admin_lists';
                    },
                    error: function(error) {
                        console.error('에러 발생:', error);
                    }
                });
            });
        });
    </script>
    
</body>
</html>