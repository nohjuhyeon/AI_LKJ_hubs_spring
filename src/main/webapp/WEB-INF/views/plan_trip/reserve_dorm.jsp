<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yojulab.study_springboot.service.TourApiService.PlaceDetail" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reserve Dorm</title>
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
</head>

<body>
    <%-- Include header --%>
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>

    <div class="container mt-5 mb-5">
        <h1 class="text-center mt-5">Reserve Dorm</h1>
        <form action="">
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
            <div class="selector_box">
                <div class="border d-flex justify-content-end">
                    <select id="sortSelector" class="form-control">
                        <option>selector</option>
                        <option value="0">낮은가격순</option>
                        <option value="1">높은가격순</option>
                        <option value="2">가장 가까운 거리순</option>
                    </select>
                </div>
            </div>
            <%
                List<PlaceDetail> details = (List<PlaceDetail>) request.getAttribute("details");
                if (details != null && !details.isEmpty()) {
                    for (int i = 0; i < details.size(); i++) {
                        PlaceDetail detail = details.get(i);
            %>
            <div class="row align-items-stretch mb-3" style="border: 1px solid #555; border-radius: 15px; background-color: #ffffff;">
                <div class="col-md-3" style="border-right: 1px solid #555;">
                    <img src="<%=detail.getFirstimage()%>" alt="Dorm Image" class="img-fluid" style="width: 100%; height: auto;">
                </div>
                <div class="col-md-9 d-flex flex-column justify-content-center">
                    <div class="mb-2" style="margin-top: -10px;"><%=detail.getTitle()%></div>
                    <div class="d-flex justify-content-between align-items-baseline mb-2">
                        <h2><%=detail.getTitle()%></h2>
                        <h2>가격 정보 없음</h2>
                    </div>
                    <div class="justify-content-between row">
                        <div class="col-md-4" style="margin-top: 10px;"><%=detail.getAddr1()%></div>
                        <button id="addButton<%=i%>" class="btn btn-primary col-md-3" value="<%=detail.getTitle()%>/<%=detail.getAddr1()%>/<%=detail.getTel()%>/<%=detail.getHomepage()%>/<%=i%>">가격 비교하기</button>
                    </div>
                </div>
            </div>
            <%
                    }
                } else {
                    out.println("<p>No details available.</p>");
                }
            %>
            <div>
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <button type="submit" class="page-link">맨 처음</button>
                        </li>
                        <li class="page-item disabled">
                            <button type="submit" class="page-link">이전</button>
                        </li>
                        <li class="page-item active">
                            <button type="submit" class="page-link">1</button>
                        </li>
                        <li class="page-item disabled">
                            <button type="submit" class="page-link">다음</button>
                        </li>
                        <li class="page-item disabled">
                            <button type="submit" class="page-link">맨 끝</button>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row justify-content-end">
                <div class="col-3 position-fixed top-40 end-0 mb-3 ms-3 ml-3 bd-mode-toggl" style="top: 30%; width: 20%">
                    <li class="list-group-item list-group-item-primary">가격 비교하기</li>
                    <div class="scrollable-box-list" style="height: 50%;">
                        <ul id="itemList" class="list-group scrollarea">
                            <!-- 가격 비교 항목이 여기에 추가됩니다 -->
                        </ul>
                    </div>
                    <button type="submit" class=" list-group-item" style="top: 30%; width: 100%">예약 리스트에 추가하기</button>
                </div>
            </div>
        </form>
    </div>
    <script>
        var totalList = '<%= details %>';
        var added_items = [];
        function deleteListItem(event) {
            var listItem = event.target.closest('.list-group-item');
            listItem.remove();
        }
        document.querySelectorAll('.btn-primary').forEach(function(button) {
            button.addEventListener('click', function(event) {
                event.preventDefault();
                var clickedButton = event.target;
                var value = clickedButton.value;
                var values = value.split("/");

                if (added_items.includes(values[4])) {
                    return;
                }
                added_items.push(values[4]);

                var newItem = document.createElement("li");
                newItem.classList.add("list-group-item");

                var firstrow = document.createElement("div");
                firstrow.classList.add("row");

                var firstrow_col1 = document.createElement("div");
                firstrow_col1.classList.add("col");
                firstrow_col1.textContent = `이름 : ${values[0]}`;
                firstrow.appendChild(firstrow_col1);

                var secondrow = document.createElement("div");
                secondrow.classList.add("row");
                var secondrow_col1 = document.createElement("div");
                secondrow_col1.classList.add("col-6");
                secondrow_col1.textContent = `유형 : ${values[1]}`;
                var secondrow_col2 = document.createElement("div");
                secondrow_col2.classList.add("col-6");
                secondrow_col2.textContent = `위치 : ${values[2]}`;

                var thirdrow = document.createElement("div");
                thirdrow.classList.add("row");
                var thirdrow_col1 = document.createElement("div");
                thirdrow_col1.classList.add("col-8");
                var thirdrow_price = document.createElement("h4");
                thirdrow_price.textContent = `가격 : ${values[3]}`;
                thirdrow_col1.appendChild(thirdrow_price);
                var deleteButton = document.createElement("button");
                deleteButton.classList.add("btn");
                deleteButton.classList.add("btn-primary");
                deleteButton.textContent = "빼기";

                var thirdrow_col2 = document.createElement("div");
                thirdrow_col2.classList.add("col-4");
                var hidden_input = document.createElement("input");
                hidden_input.type = "hidden";
                hidden_input.value = values[4];
                hidden_input.name = added_items.length;
                newItem.appendChild(hidden_input);
                thirdrow_col2.appendChild(deleteButton);
                newItem.appendChild(firstrow);
                firstrow.appendChild(firstrow_col1);
                newItem.appendChild(secondrow);
                secondrow.appendChild(secondrow_col1);
                secondrow.appendChild(secondrow_col2);
                newItem.appendChild(thirdrow);
                thirdrow.appendChild(thirdrow_col1);
                thirdrow.appendChild(thirdrow_col2);
                itemList.appendChild(newItem);

                deleteButton.addEventListener('click', deleteListItem);
            });
        });
    </script>

    <%-- Include footer --%>
    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>
