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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/main.css">

     
</head>

<body>
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="mt-3 ml-3">
                    
                    <% 
                        List<Map<String, Object>> noticeList = (List<Map<String, Object>>) request.getAttribute("NoticeList");
                        if (noticeList != null && !noticeList.isEmpty()) {
                            for (Map<String, Object> notice : noticeList) {
                    %>
                        <%= notice.get("NOTICE_TITLE") %>
                    <% 
                            }
                        }
                    %>
                    
                    <%
                        Map<String, Object> noticeContent = (Map<String, Object>) request.getAttribute("noticeContent");
                        if (noticeContent != null && !noticeContent.isEmpty()) {
                    %>
                        <%= noticeContent.get("NOTICE_TITLE") %>
                    <% // 수정: 스크립트릿 닫는 태그 추가
                        }
                    %>
                </h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <form method="post" action="/admin_notice_content">
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
                                <a href="/admin_notices/admin_lists" role="button" class="btn btn-primary me-2">취소</a>
                                <button type="submit" class="btn btn-success me-2" id="btn-save">수정</button>
                            </div>
                            <div class="col-md-6 text-end">
                                <button type="submit" formaction="/admin_notices/admin_lists/delete" formmethod="post" class="btn btn-danger me-2" id="btn-delete">삭제</button>
                                
                                <input type="hidden" id="deleteIds" name="deleteIds" value= "<%= noticeContent.get("NOTICE_ID") %>">
                                
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

    <script>
        $(document).ready(function() {
          $('#btn-delete').click(function(event) {
            event.preventDefault(); // 기본 폼 제출 동작 막기
        
            // 삭제 확인 alert 창 띄우기
            if (confirm("정말 삭제하시겠습니까?")) {
              // 삭제 확인 후 폼 제출
              $('form').attr('action', '/admin_notices/admin_lists/delete');
              $('form').attr('method', 'post');
              $('form').submit();
            }
          });
        });
    </script>
    
</body>

</html>
