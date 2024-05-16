<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reserve Transfer</title>
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

        .row.mb-2 {
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            padding: 10px;
        }

        .flex-container {
            display: flex;
            margin-top: 3px;
            align-items: flex-start;
            gap: 20px;
        }

        .flex-container label {
            margin-right: 21.5px;
            font-size: 16px;
            color: #555555;
        }

        .btn-primary:hover {
            background-color: #007bff;
            border-color: #007bff;
            color: #ffffff;
        }

        h4 {
            font-weight: 500;
            color: #333333;
        }

        img.img-fluid {
            border-radius: 8px;
        }
    </style>
</head>

<body>
    <div class="container">
        <form action="/plan_trip/reserve_transfer" method="get">
            <div class="row justify-content-center mt-5">
                <div class="col-6">
                    <select class="form-control" name="transfer_cate">
                        <option value="">전체</option>
                        <option value="car">렌트카</option>
                        <option value="bus">버스</option>
                        <option value="plane">비행기</option>
                        <option value="train">기차</option>
                    </select>
                </div>
                <div class="col-1">
                    <button type="submit" class="btn btn-primary">검색</button>
                </div>
            </div>
            <div class="row justify-content-center">
                <button class="col-2 m-2 mt-5 mb-2 btn btn-secondary" formaction="/">뒤로가기</button>
                <button class="col-2 m-2 mt-5 mb-2 btn btn-secondary" formaction="/plan_trip/reserve_dorm">건너뛰기</button>
                <button class="col-2 m-2 mt-5 mb-2 btn btn-primary" type="submit">다음</button>
            </div>
            <div class="selector_box">
                <div class="border d-flex justify-content-end">
                    <select id="sort_selector" class="form-control">
                        <option>selector</option>
                        <option value="0">낮은가격순</option>
                        <option value="1">높은가격순</option>
                        <option value="2">낮은별점순</option>
                        <option value="3">높은별점순</option>
                        <option value="4">가장 가까운 거리순</option>
                    </select>
                </div>
            </div>
        </form>
        <%
            String selectedTransferCate = request.getParameter("transfer_cate");
            List<Map<String, Object>> reserveTransferData = (List<Map<String, Object>>) request.getAttribute("reserveTransferData");
            if (reserveTransferData != null) {
                for (Map<String, Object> dict_total : reserveTransferData) {
                    String transferCate = (String) dict_total.get("transfer_cate");
                    if (selectedTransferCate == null || selectedTransferCate.isEmpty() || selectedTransferCate.equals(transferCate)) {
        %>
            <% if ("plane".equals(transferCate)) { %>
                <div class="row mb-2">
                    <div class="col-md-3">
                        <img src="<%= dict_total.get("airport_image") %>" alt="Tour Image" class="img-fluid">
                    </div>
                    <div class="col-md-9">
                        <div class="row justify-content-between">
                            <div class="airport_date_info col-md-6">
                                <h2><%= dict_total.get("airport_time") %></h2>
                            </div>
                            <div class="airport_price_info col-md-3">
                                <em><%= dict_total.get("airport_price") %></em>
                            </div>
                        </div>
                        <div class="row justify-content-between">
                            <h6 class="col-md-6"><%= dict_total.get("airport_name") %></h6>
                            <div class="col-md-4 justify-content-end row">
                                <button id="addButton" class="btn btn-primary col" formaction="/plan_trip/reserve_transfer/"
                                    name="transfer_id" value="<%= dict_total.get("id") %>" formmethod="get"> 예약 내역에 추가</button>
                            </div>
                        </div>
                    </div>
                </div>
            <% } else if ("car".equals(transferCate)) { %>
                <div class="row mb-2">
                    <div class="col-md-3">
                        <img src="<%= dict_total.get("car_image") %>" alt="Tour Image" class="img-fluid">
                    </div>
                    <div class="col-md-9">
                        <div class="row justify-content-between">
                            <div class="rentcar_date_info col-md-6">
                                <h1><%= dict_total.get("store_name") %></h1>
                            </div>
                            <div class="rentcar_price_info col-md-3">
                                <em><%= dict_total.get("car_price") %></em>
                            </div>
                        </div>
                        <div class="row justify-content-between">
                            <h3 class="col-md-4"><%= dict_total.get("car_name") %></h3>
                            <div class="col-md-4 justify-content-end row">
                                <button id="addButton" class="btn btn-primary col" formaction="/plan_trip/reserve_transfer/"
                                    name="transfer_id" value="<%= dict_total.get("id") %>" formmethod="get"> 예약 내역에 추가</button>
                            </div>
                        </div>
                    </div>
                </div>
            <% } else if ("train".equals(transferCate)) { %>
                <div class="row mb-2">
                    <div class="col-md-3">
                        <img src="images/korail.png" alt="Tour Image" class="img-fluid" style="width: 100%;">
                    </div>
                    <div class="col-md-9">
                        <div class="row justify-content-between">
                            <div class="korail_info col-md-6">
                                <h1>코레일</h1>
                            </div>
                            <div class="train_data_info col-md mb-4 mt-6">
                                <div>출발지 : <%= dict_total.get("train_departure") %></div>
                                <div>출발시간 : <%= dict_total.get("train_departure_time") %></div>
                            </div>
                            <div class="train_data_info col-md mb-4 mt-6">
                                <div>도착지 : <%= dict_total.get("train_arrival") %></div>
                                <div>도착시간 : <%= dict_total.get("train_arrival_time") %></div>
                            </div>
                            <div class="train_data_info col-md mb-4 mt-6">
                                <div>구분 : <%= dict_total.get("train_category") %></div>
                                <div>열차번호 : <%= dict_total.get("train_number") %></div>
                            </div>
                        </div>
                        <div class="row justify-content-between">
                            <button type="button" class="btn btn-primary col-md-2 ms-3" onclick="openKorailPopup();">금액 확인</button>
                            <script>
                                function openKorailPopup() {
                                    var url = "https://www.letskorail.com/ebizprd/EbizPrdTicketPr11121_i1.do?&txtRtnDvCd=N&txtChtrDvCd1=1&txtTrnClsfCd1=00&txtTrnGpCd1=100&txtDptRsStnCd1=0001&txtArvRsStnCd1=0020&txtRunDt1=20240120&txtTrnNo1=00001&txtStndSeatCnt1=000112&txtFreeSeatCnt1=-00001";
                                    var windowFeatures = "menubar=yes,location=yes,resizable=yes,scrollbars=yes,status=yes";
                                    window.open(url, "_blank", windowFeatures);
                                }
                            </script>
                            <div class="col-md-4 justify-content-end d-flex">
                                <button id="addButton" class="btn btn-primary col" formaction="/plan_trip/reserve_transfer/"
                                    name="transfer_id" value="<%= dict_total.get("id") %>" formmethod="get"> 예약 내역에 추가</button>
                            </div>
                        </div>
                    </div>
                </div>
            <% } else if ("bus".equals(transferCate)) { %>
                <div class="row mb-2">
                    <div class="col-md-3">
                        <img src="images/bus.jpg" alt="Tour Image" class="img-fluid" style="width: 100%; height: 100%">
                    </div>
                    <div class="col-md-9">
                        <div class="row justify-content-between">
                            <div class="korail_info col-md-6">
                                <h1>고속버스</h1>
                            </div>
                            <div class="train_data_info col-md mb-4 mt-6">
                                <div style="border-style: ridge;">출발지 : <%= dict_total.get("bus_departure") %></div>
                                <div style="border-style: ridge;">도착지 : <%= dict_total.get("bus_arrival") %></div>
                                <div style="border-style: ridge;">출발시간 : <%= dict_total.get("bus_departure_time") %></div>
                            </div>
                        </div>
                        <div class="row justify-content-between">
                            <div class="col-md-4 ms-3">
                                <div>성인 요금 : <%= dict_total.get("charge_adult") %></div>
                                <div>초등생 요금 : <%= dict_total.get("charge_child") %></div>
                                <div>중고등 요금 : <%= dict_total.get("charge_youth") %></div>
                            </div>
                            <div class="col-md-4 justify-content-end d-flex">
                                <button id="addButton<%= reserveTransferData.indexOf(dict_total) %>" class="btn btn-primary col"
                                    formaction="/plan_trip/reserve_transfer/" name="transfer_id"
                                    value="<%= dict_total.get("transfer_cate") %>,<%= dict_total.get("charge_adult") %>,<%= dict_total.get("bus_departure_time") %>,<%= dict_total.get("bus_departure") %>,<%= dict_total.get("bus_arrival") %>"
                                    formmethod="get"> 예약 내역에 추가</button>
                            </div>
                        </div>
                    </div>
                </div>
            <% } %>
        <% 
                    }
                }
            }
        %>
    </div>
    <script>
        var added_items = [];
        function deleteListItem(event) {
            var listItem = event.target.closest('.list-group-item');
            listItem.remove();
        }

        var deleteButtons = document.querySelectorAll('.btn-primary');
        deleteButtons.forEach(function(button) {
            button.addEventListener('click', deleteListItem);
        });
    </script>
</body>

</html>
<%@ include file="/WEB-INF/views/templates/footer.jsp" %>
