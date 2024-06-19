<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.yojulab.study_springboot.utils.Paginations" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PathFinder</title>
    <!-- Latest compiled and minified CSS -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/main.css">
    .dorm-card {
        border: 1px solid #555;
        border-radius: 15px;
        background-color: #ffffff;
        margin-bottom: 15px;
        display: flex;
        align-items: stretch;
    }
    
    .dorm-image {
        width: 100%;
        height: auto;
        border-radius: 15px 0 0 15px;
        object-fit: cover;
    }
    
    .dorm-info {
        flex: 1;
        padding: 20px;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }
    
    .dorm-title {
        font-size: 1.2rem;
        font-weight: bold;
        margin-bottom: 10px;
    }
       
    .dorm-button {
        margin-top: 15px;
    }
    
</head>
<body>
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>

    <div class="container mt-5 mb-5">
        <h1 class="text-center mt-5">Reserve Dorm</h1>
        <form method="get">
            <div class="row justify-content-center mt-5">
                <div class="col-6">
                    <select class="form-control" name="dorm_cate">
                        <option value="">전체</option>
                        <option value="hotel">호텔</option>
                        <option value="motel">모텔</option>
                        <option value="guest_house">게스트하우스</option>
                    </select>
                </div>
                <div class="col-1">
                    <button type="submit" class="btn btn-primary">검색</button>
                </div>
            </div>
            <div class="row justify-content-center">
                <button class="col-2 m-2 mt-5 mb-2 btn btn-secondary" formaction="/plan_trip/reserve_transfer/">뒤로가기</button>
                <button class="col-2 m-2 mt-5 mb-2 btn btn-secondary" formaction="/plan_trip/reserve_tour/">건너뛰기</button>
                <button class="col-2 m-2 mt-5 mb-2 btn btn-primary" formaction="/plan_trip/reserve_tour/" type="submit">다음</button>
            </div>
            
            <%
            List<HashMap<String, Object>> DormList = (List<HashMap<String, Object>>) request.getAttribute("DormList");
            if (DormList != null && !DormList.isEmpty()) {
                for (HashMap<String, Object> dormList : DormList) {
            %>
            <div class="row align-items-stretch dorm-card">
                <div class="col-md-3">
                    <% if (dormList.get("firstimage") != null) { %>
                    <img src="<%= dormList.get("firstimage") %>" alt="<%= dormList.get("firstimage") %>" class="img-fluid">
                    <% } else { %>
                    <p>이미지 정보 없음</p>
                    <% } %>
                </div>
                <div class="col-md-9 d-flex flex-column justify-content-center">
                    <div class="mb-2 dorm-title"><%= dormList.get("title") %></div>
                    <div class="d-flex justify-content-between align-items-baseline mb-2 dorm-price">
                        <h2><%= dormList.get("title") %></h2>
                    </div>
                    <div class="justify-content-between row dorm-info">
                        <% if (dormList.get("addr1") != null) { %>
                        <div class="col-md-4"><%= dormList.get("addr1") %></div>
                        <% } else { %>
                        <div class="col-md-4">주소 정보 없음</div>
                        <% } %>
                        <% if (dormList.get("tel") != null) { %>
                        <div class="col-md-4"><%= dormList.get("tel") %></div>
                        <% } else { %>
                        <div class="col-md-4">전화번호 정보 없음</div>
                        <% } %>
                        <% if (dormList.get("homepageUrl") != null) { %>
                        <a href="<%= dormList.get("homepage") %>" class="btn btn-primary col-md-3 dorm-button">자세히 보기</a>
                        <% } else { %>
                        <p class="col-md-3">홈페이지 정보 없음</p>
                        <% } %>
                    </div>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <p class="text-center">No details available</p>
            <%
            }
            %>
           
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
                                    formaction="/reserve_dorm">Previous</button>
                            </li>
                            <% for(int i=paginations.getBlockStart(); i <=paginations.getBlockEnd();
                                i++) { %>
                                <li class="page-item <%= paginations.getCurrentPage() == i ? "active" : "" %>">
                                    <button class="page-link" type="submit" name="currentPage"
                                        value="<%= i %>" formaction="/reserve_dorm">
                                        <%= i %>
                                    </button>
                                </li>
                                <% } %>
                                    <li class="page-item <%= paginations.isLastPage() ? " disabled" : "" %>">
                                        <button class="page-link" type="submit" name="currentPage"
                                            value="<%= paginations.getNextPage() %>"
                                            formaction="/reserve_dorm">Next</button>
                                    </li>
                        </ul>
                    </nav>

            </div>
        </form>
    </div>
    
    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>