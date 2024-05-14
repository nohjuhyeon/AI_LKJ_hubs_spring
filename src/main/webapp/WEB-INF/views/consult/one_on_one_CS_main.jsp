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
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
                    <link rel="stylesheet"
                        href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
                        <form action="/one_on_one_CS_main" method="post" class="one_on_one_CS_main">
                            <div class="container my-3">
                                <table class="table">
                                    <thead class="table-light rounded-corners">
                                        <tr>
                                            <th colspan="4">
                                                <div class="text-end">
                                                    <a href="/one_on_one_CS_write" class="btn btn-primary">글 작성</a>
                                                </div>
                                            </th>
                                        </tr>
                                    </thead>
                                    <thead class="table-primary rounded-corners">
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성날짜</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% int rowNum=1;
                                            List<HashMap<String, Object>> InquiryList = (List
                                            <HashMap<String, Object>>)
                                                request.getAttribute("InquiryList");
                                                if(InquiryList != null && !InquiryList.isEmpty()) {
                                                for(HashMap<String, Object> Inquiry : InquiryList) {
                                                    %>
                                                    <tr>
                                                        <td>
                                                            <%= rowNum++ %>
                                                        </td>
                                                        <td class="collapsible">
                                                            <%= Inquiry.get("INQUIRY_TITLE").toString() %>
                                                        </td>
                                                        <td>
                                                            <%= Inquiry.get("INQUIRY_WRITER").toString() %>
                                                        </td>
                                                        <td>
                                                            <%= Inquiry.get("INQUIRY_DATETIME").toString() %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4" style="padding:0;">
                                                            <div class="content">
                                                                <div class="form-container">
                                                                    <div></div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>

                                                    <% } } else { %>
                                                        <tr>
                                                            <td colspan="3">등록된 문의가 없습니다.</td>
                                                        </tr>
                                                        <% } %>

                                    </tbody>
                                </table>
                            </div>
                        </form>

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
                                                    formaction="/one_on_one_CS_main">Previous</button>
                                            </li>
                                            <% for(int i=paginations.getBlockStart(); i <=paginations.getBlockEnd();
                                                i++) { %>
                                                <li class="page-item <%= paginations.getCurrentPage() == i ? " active"
                                                    : "" %>">
                                                    <button class="page-link" type="submit" name="currentPage"
                                                        value="<%= i %>" formaction="/one_on_one_CS_main">
                                                        <%= i %>
                                                    </button>
                                                </li>
                                                <% } %>
                                                    <li class="page-item <%= paginations.isLastPage() ? " disabled" : ""
                                                        %>">
                                                        <button class="page-link" type="submit" name="currentPage"
                                                            value="<%= paginations.getNextPage() %>"
                                                            formaction="/one_on_one_CS_main">Next</button>
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