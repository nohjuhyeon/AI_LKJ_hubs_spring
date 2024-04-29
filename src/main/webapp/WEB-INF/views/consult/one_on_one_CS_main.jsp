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
    <link rel="stylesheet" href="/one_on_one_CS_main.css">
    <title>1:1 문의 메인</title>
</head>
<body>
    <!-- Menu -->
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>

    <h1 class="mt-5 mb-4 text-center">1대1 문의</h1>

    <div class="container my-3">
        <table class="table">
            <thead class="table-light rounded-corners">
                <tr>
                    <th colspan="3">
                        <div class="text-end">
                            <a href="/one_on_one_CS_write" class="btn btn-primary">글 작성</a>
                        </div>
                    </th>
                </tr>
            </thead>
            <thead class="table-primary rounded-corners">
                <tr>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성날짜</th>
                </tr>
            </thead>
            <tbody>

                <tr>
                    <td class="collapsible" value=""></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3" style="padding:0;">
                        <div class="content">
                            <div class="form-container">
                                <div></div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">등록된 문의가 없습니다.</td>
                </tr>
            </tbody>
        </table>
    </div>

    <form>
        <div>
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <button type="submit" class="page-link"
                            formaction="">
                            맨 처음
                        </button>
                    </li>
                    <li class="page-item">
                        <button type="submit" class="page-link"
                            formaction="">
                            이전
                        </button>
                    </li>
                    <li class="page-item">
                        <button type="submit" class="page-link" formaction="">
                        
                        </button>
                    </li>
    
    
                    <li class="page-item">
                        <button type="submit" class="page-link"
                            formaction="">
                            다음
                        </button>
                    </li>
                    <li class="page-item">
                        <button type="submit" class="page-link"
                            formaction="">
                            맨 끝
                        </button>
                    </li>
    
                </ul>
            </nav>
        </div>
    </form>

    <script>
        $(document).ready(function () {
            $('body').on('click', '.collapsible', function () {
                var content = $(this).closest('tr').next('tr').find('.content');
                var formContainer = content.find('.form-container');

                if (formContainer.hasClass("show")) {
                    formContainer.toggleClass("show");
                    content.css('max-height', formContainer.hasClass("show") ? content.prop('scrollHeight') + 'px' : 0);
                    $(this).toggleClass("active");
                } else {
                    var user_password = $(this).attr('value');
                    var password = prompt("비밀번호 4자리를 입력하세요.");
                    if (password == user_password) {
                        formContainer.toggleClass("show");
                        content.css('max-height', formContainer.hasClass("show") ? content.prop('scrollHeight') + 'px' : 0);
                        $(this).toggleClass("active");
                    } else {
                        alert("비밀번호가 틀렸습니다.");
                    }
                }
            });
        });
    </script>
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>

</body>
</html>