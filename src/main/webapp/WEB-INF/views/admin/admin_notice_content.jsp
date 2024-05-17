<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 내용</title>
    <!-- jQuery 및 Bootstrap CSS 포함 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Bootstrap JS 포함 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="/main.css">
</head>

<body>
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="mt-3 ml-3">
                    <% Map<String, Object> noticeContent = (Map<String, Object>) request.getAttribute("noticeContent"); %>
                    <% if (noticeContent != null && !noticeContent.isEmpty()) { %>
                        <%= noticeContent.get("NOTICE_TITLE") %>
                    <% } %>
                </h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <form method="get" action="/admin_notice_content">
                    <!-- noticeContent가 존재하는지 확인 -->
                    <% if (noticeContent != null && !noticeContent.isEmpty()) { %>
                        <div class="form-group">
                            <label for="title">제목</label>
                            <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요" name="NOTICE_TITLE"
                                value="<%= noticeContent.get("NOTICE_TITLE") %>">
                        </div>
                        <div class="form-group">
                            <label for="author">작성자</label>
                            <input type="text" class="form-control" id="author" placeholder="작성자를 입력하세요" name="WRITER"
                                value="<%= noticeContent.get("WRITER") %>">
                        </div>
                        <div class="form-group">
                            <label for="date">작성일자</label>
                            <input type="text" class="form-control" id="date" placeholder="작성일자를 입력하세요" name="DATETIME"
                                value="<%= noticeContent.get("DATETIME") %>">
                        </div>
                        <div class="form-group">
                            <label for="content">내용</label>
                            <textarea rows="10" class="form-control" id="content" name="CONTENT"
                                placeholder="내용을 입력하세요"><%= noticeContent.get("CONTENT") %></textarea>
                            <input type="hidden" name="NOTICE_ID" value="<%= noticeContent.get("NOTICE_ID") %>">
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <a href="/admin_notices" role="button" class="btn btn-primary me-2">취소</a>
                                <button type="submit" class="btn btn-success me-2" id="btn-save">수정</button>
                            </div>
                            <div class="col-md-6 text-end">
                                <button type="submit" formaction="/admin_notice_delete" class="btn btn-danger me-2" id="btn-delete">삭제</button>
                            </div>
                        </div>
                    <% } else { %>
                        <p>공지사항이 없습니다.</p>
                    <% } %>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>

</html>
