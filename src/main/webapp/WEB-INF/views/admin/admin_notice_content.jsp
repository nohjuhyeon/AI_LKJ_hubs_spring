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
    <title>공지사항 내용</title>
</head>
<body>
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>

    <h2 class="mt-3 ml-3"><{{ notices.title }}></h2>

<div class="col-md-12">
    <div class="col-md-12">
        <form method="post">
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요" name="title"
                    value="{{ notices.title }}">
            </div>
            <div class="form-group">
                <label for="author"> 작성자 </label>
                <input type="text" class="form-control" id="author" placeholder="작성자를 입력하세요" name="writer"
                    value="{{ notices.writer }}">
            </div>
            <div class="form-group">
                <label for="date"> 작성일자 </label>
                <input type="text" class="form-control" id="date" placeholder="작성일자를 입력하세요" name="date"
                    value="{{ notices.date }}">
            </div>
            <div class="form-group">
                <label for="content"> 내용 </label>
                <textarea rows="10" class="form-control" id="content" name="content"
                    placeholder="내용을 입력하세요">{{ notices.content }}</textarea>
                <input type="hidden" name="id" value="{{notices.id}}">
            </div>
            <div class="row">
                <div class="col-md-6">
                    <a href="/admin_notices" role="button" class="btn btn-primary me-2">취소</a>
                    <button type="submit" formaction="/admin/notice_update" class="btn btn-success me-2"
                        value="{{notices.content}}" id="btn-save">수정</button>
                </div>
                <div class="col-md-6 text-end">
                    <input type="hidden" name="id" value="{{ notices.id }}">
                    <button type="submit" formaction="/admin/notice_delete" class="btn btn-danger me-2"
                        id="btn-delete">삭제</button>
                </div>
            </div>
        </form>
    </div>
</div>

    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>