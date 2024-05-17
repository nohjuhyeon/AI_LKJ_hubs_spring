<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.yojulab.study_springboot.utils.Paginations" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>

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
    <title>공지관리</title>
</head>
<body>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<h1 class="mt-5 mb-4">공지 관리(관리자 페이지)</h1>
<div class="container my-3"> <!-- 수정된 부분: 'ckass'를 'class'로 수정 -->
    <table class="table">
        <thead class="table-light">
            <tr>
                <th colspan="4">
                    <div class="text-end">
                        <a href="/admin_notice_write" class="btn btn-primary">글 작성</a>
                    </div>
                </th>
            </tr>
        </thead>
        <thead class="table-dark">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성날짜</th>
            </tr>
        </thead>
        <tbody>
            <% int rowNum=1; List<HashMap<String, Object>> NoticeList = (List
            <HashMap<String, Object>>)
                request.getAttribute("NoticeList");
                if(NoticeList != null && !NoticeList.isEmpty()) {
                for(HashMap<String, Object> Notices : NoticeList) {
                    %>
        <tr>
            <td><%= rowNum++ %></td>
            <td>
                <a href="/admin_notice_content/<%= Notices.get("NOTICE_ID") %>"><%= (Notices.get("NOTICE_TITLE") != null) ? Notices.get("NOTICE_TITLE").toString() : "" %></a>
            </td>
            <td> <%= (Notices.get("WRITER") !=null) ? Notices.get("WRITER").toString() : "" %></td>
            <td><%= (Notices.get("DATETIME") !=null) ? Notices.get("DATETIME").toString() : "" %></td>
        </tr>
            <% } } %> <!-- 수정된 부분: for 루프와 if 문이 종료되도록 수정 -->
        </tbody>
    </table>
</div>
<form>
    <div>
        <% Paginations paginations=(Paginations) (Paginations) request.getAttribute("paginations"); %>
            <nav class="row justify-content-between" aria-label="Page navigation">
                <div class="col-8">Total Count : <%= paginations.getTotalCount() %>
                </div>
                <ul class="pagination justify-content-center">
                    <li class="page-item <%= paginations.isFirstPage() ? " disabled" : "" %>">
                        <button class="page-link" type="submit" name="currentPage"
                            value="<%= paginations.getPreviousPage() %>"
                            formaction="/admin_notices">Previous</button>
                    </li>
                    <% for(int i=paginations.getBlockStart(); i <=paginations.getBlockEnd();
                        i++) { %>
                        <li class="page-item <%= paginations.getCurrentPage() == i ? "active" : "" %>">
                            <button class="page-link" type="submit" name="currentPage"
                                value="<%= i %>" formaction="/admin_notices">
                                <%= i %>
                            </button>
                        </li>
                        <% } %>
                            <li class="page-item <%= paginations.isLastPage() ? " disabled" : "" %>">
                                <button class="page-link" type="submit" name="currentPage"
                                    value="<%= paginations.getNextPage() %>"
                                    formaction="/admin_notices">Next</button>
                            </li>
                </ul>
            </nav>
    </div>
</form>
<%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>
