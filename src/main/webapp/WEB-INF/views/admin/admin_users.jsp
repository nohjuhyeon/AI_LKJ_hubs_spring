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
    <title>회원 관리 페이지</title>
</head>
<body>
    <!-- Menu -->
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>
    <h1 class="mt-5 mb-4">회원 관리(관리자 페이지)</h1>
    <div ckass="container my-3">
        <table class="table">
            <thead class="table-dark">
                <tr>
                    <th>번호</th>
                    <th>이메일</th>
                    <th>비밀번호</th>
                    <th>닉네임</th>
                    <th>생년월일</th>
                    <th>휴대전화번호</th>
                    <th>주소</th>
                </tr>
            </thead>
            {% for user in users %}
            <tr>
                <td>{{ loop.index + (pagination.current_page - 1) * pagination.records_per_page }}</td>
                <td>{{ user.user_email }}</td>
                <td>{{ user.user_password }}</td>
                <td>{{ user.user_name }}</td>
                <td>{{ user.user_birth }}</td>
                <td>{{ user.user_phone_number }}</td>
                <td>{{ user.user_address }}</td>
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
                            formaction="/admin/users/{{pagination.first_page}}">
                            맨 처음
                        </button>
                    </li>
                    <li class="page-item {% if not pagination.has_previous_page %}disabled{% endif %}">
                        <button type="submit" class="page-link"
                            formaction="/admin/users/{{pagination.previous_page}}">
                            이전
                        </button>
                    </li>
    
                    {% for page_num in pagination.current_page_range %}
                    <li class="page-item {% if page_num == pagination.current_page %}active{% endif %}">
                        <button type="submit" class="page-link" formaction="/admin/users/{{page_num}}">
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
                            formaction="/admin/users/{{pagination.last_page}}">
                            맨 끝
                        </button>
                    </li>
    
                </ul>
            </nav>
        </div>
    </form> 
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>