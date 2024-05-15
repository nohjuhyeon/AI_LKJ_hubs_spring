<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.google.gson.Gson" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reserve Dorm</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .selector_box {
            margin-top: 20px;
        }
        .scrollable-box-list {
            max-height: 300px;
            overflow-y: auto;
        }
    </style>
</head>

<body>
    <div class="container">
        <form action="">
            <div class="row justify-content-center mt-5">
                <div class="col-6">
                    <select class="form-control" name="dorm_cate">
                        <option value="" <%= request.getParameter("dorm_cate") == null ? "selected" : "" %>>전체</option>
                        <option value="hotel" <%= "hotel".equals(request.getParameter("dorm_cate")) ? "selected" : "" %>>호텔</option>
                        <option value="motel" <%= "motel".equals(request.getParameter("dorm_cate")) ? "selected" : "" %>>모텔</option>
                        <option value="guest_house" <%= "guest_house".equals(request.getParameter("dorm_cate")) ? "selected" : "" %>>게스트하우스</option>
                    </select>
                </div>
                <div class="col-1">
                    <button type="submit" class="btn btn-primary" formaction="/consult/reserve_dorm" formmethod="get">검색</button>
                </div>
            </div>
            <div class="row justify-content-center">
                <button class="col-2 m-2 mt-5 mb-2" formaction="/plan_trip/reserve_transfer/" class="">뒤로가기</button>
                <button class="col-2 m-2 mt-5 mb-2" formaction="/plan_trip/reserve_tour/" class="">건너뛰기</button>
                <button class="col-2 m-2 mt-5 mb-2" formaction="/plan_trip/reserve_tour/" type="submit" class="">다음</button>
            </div>
            <div class="selector_box">
                <div class="border d-flex justify-content-end">
                    <select id="">
                        <option>selector</option>
                        <option value="0">낮은가격순</option>
                        <option value="1">높은가격순</option>
                        <option value="2">가장 가까운 거리순</option>
                    </select>
                </div>
            </div>
            <%
                List<Map<String, Object>> reserveDormData = (List<Map<String, Object>>) request.getAttribute("reserveDormData");
                Gson gson = new Gson();
                String reserveDormDataJson = gson.toJson(reserveDormData);
                String addedItemsJson = gson.toJson(request.getAttribute("addedItems"));
                if (reserveDormData != null) {
                    for (int i = 0; i < reserveDormData.size(); i++) {
                        Map<String, Object> dict_dorm = reserveDormData.get(i);
            %>
            <div class="row align-items-stretch mb-3" style="border: 1px solid #555; border-radius: 15px; height: 70%; background-color: #ffffff;">
                <div class="col-md-3" style="border-right: 1px solid #555;">
                    <img src="<%= dict_dorm.get("dorm_image") %>" alt="Dorm Image" class="img-fluid" style="width: 100%; height: auto;">
                </div>
                <div class="col-md-9 d-flex flex-column justify-content-center">
                    <div class="mb-2" style="margin-top: -10px;"><%= dict_dorm.get("dorm_cate") %></div>
                    <div class="d-flex justify-content-between align-items-baseline mb-2">
                        <h2><%= dict_dorm.get("dorm_name") %></h2>
                        <h2><%= dict_dorm.get("dorm_price") %></h2>
                    </div>
                    <div class="justify-content-between row">
                        <div class="col-md-4" style="margin-top: 10px;"><%= dict_dorm.get("dorm_address") %></div>
                        <button id="addButton<%= i %>" formaction="/plan_trip/reserve_dorm/" class="btn btn-primary col-md-3"
                                value="<%= dict_dorm.get("dorm_name") %>/<%= dict_dorm.get("dorm_cate") %>/<%= dict_dorm.get("dorm_address") %>/<%= dict_dorm.get("dorm_price") %>/<%= dict_dorm.get("id") %>"
                                formmethod="get"> 가격 비교하기</button>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
            <!-- 페이징 처리 부분은 직접 구현이 필요합니다 -->
            <div class="row justify-content-end">
                <div class="col-3 position-fixed top-40 end-0 mb-3 ms-3 ml-3 bd-mode-toggl" style="top: 30% ;width: 20%">
                    <li class="list-group-item list-group-item-primary">가격 비교하기</li>
                    <div class="scrollable-box-list" style="height: 50%;">
                        <ul id="itemList" class="list-group scrollarea">
                            <%
                                List<Map<String, Object>> checkDormData = (List<Map<String, Object>>) request.getAttribute("checkDormData");
                                if (checkDormData != null) {
                                    for (int i = 0; i < checkDormData.size(); i++) {
                                        Map<String, Object> check_element = checkDormData.get(i);
                            %>
                            <li class="list-group-item">
                                <input type="hidden" value="<%= check_element.get("id") %>" name="<%= i %>">
                                <div class="row">
                                    <div class="col">이름 : <%= check_element.get("dorm_name") %></div>
                                </div>
                                <div class="row">
                                    <div class="col-6">유형 : <%= check_element.get("dorm_cate") %></div>
                                    <div class="col-6">위치 : <%= check_element.get("dorm_address") %></div>
                                </div>
                                <div class="row">
                                    <div class="col-8">
                                        <h4>가격 : <%= check_element.get("dorm_price") %></h4>
                                    </div>
                                    <div class="col-4"><button class="btn btn-primary">빼기</button></div>
                                </div>
                            </li>
                            <%
                                    }
                                }
                            %>
                        </ul>
                    </div>
                    <button type="submit" class=" list-group-item" style="top: 30% ;width: 100%">예약 리스트에 추가하기</button>
                </div>
            </div>
        </form>
    </div>

    <script>
        var totalList = JSON.parse('<%= reserveDormDataJson %>');
        var added_items = JSON.parse('<%= addedItemsJson %>');
        var itemList = document.getElementById("itemList");

        function deleteListItem(event) {
            var listItem = event.target.closest('.list-group-item');
            listItem.remove();
        }

        var deleteButtons = document.querySelectorAll('.btn-primary');
        deleteButtons.forEach(function(button) {
            button.addEventListener('click', deleteListItem);
        });

        for (var i = 1; i <= totalList.length; i++) {
            var buttonId = "addButton" + i;
            var button = document.getElementById(buttonId);

            button.addEventListener("click", function(event) {
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
            });
            console.log(button);
        }
    </script>
</body>
</html>