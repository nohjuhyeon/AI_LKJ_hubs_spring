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
    <title>공지관리</title>
</head>
<body>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<h1 class="mt-5 mb-4">공지 관리(관리자 페이지)</h1>
<div ckass="container my-3">
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
        {% for notice in notices %}
        <tr>
            <td>{{ loop.index + (pagination.current_page - 1) * pagination.records_per_page }}</td>
            <td>
                <a href="">{{ notice.title }}</a>
            </td>
            <td>{{ notice.writer }}</td>
            <td>{{ notice.date }}</td>
        </tr>
        {% endfor %}
        </tbody>
    </table>
</div>
<form>
    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <li class="page-item {% if not pagination.has_previous_block %}disabled{% endif %}">
                    <button type="submit" class="page-link"
                        formaction="/admin/notice/{{pagination.first_page}}">
                        맨 처음
                    </button>
                </li>
                <li class="page-item {% if not pagination.has_previous_page %}disabled{% endif %}">
                    <button type="submit" class="page-link"
                        formaction="/admin/notice/{{pagination.previous_page}}">
                        이전
                    </button>
                </li>

                {% for page_num in pagination.current_page_range %}
                <li class="page-item {% if page_num == pagination.current_page %}active{% endif %}">
                    <button type="submit" class="page-link" formaction="/admin/notice/{{page_num}}">
                        {{page_num}}
                    </button>
                </li>
                {% endfor %}

                <li class="page-item {% if not pagination.has_next_page %}disabled{% endif %}">
                    <button type="submit" class="page-link"
                        formaction="/admin/notice/{{pagination.next_page}}">
                        다음
                    </button>
                </li>
                <li class="page-item {% if not pagination.has_next_block %}disabled{% endif %}">
                    <button type="submit" class="page-link"
                        formaction="/admin/notice/{{pagination.last_page}}">
                        맨 끝
                    </button>
                </li>

            </ul>
        </nav>
    </div>
</form>
<%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>