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
    <title>데이터 현황 차트</title>
</head>
<body>
    <!-- Menu -->
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>

    <h1 class="mt-5 mb-4 text-center">데이터 현황 차트</h1>

    <nav class="navbar bg-body-tertiary" id="chart_nav">
        <div class="container-fluid d-flex justify-content-center">
            <form:form action="${submitUrl}" method="POST" class="d-flex" role="search">
                <form:select path="select_region" class="form-select me-2 text-center" aria-label="지역 선택" style="width: 300px;">
                    <form:options items="${regions}" />
                </form:select>
                <button type="submit" class="btn btn-primary">검색</button>
            </form:form>
        </div>
    </nav>

    <div id="chartsContainer">
        <div class="container" id="visitorChart"></div>
        <div class="container" id="consume_transition_chart"></div>
        <div class="container" id="month_trend_Chart"></div>
        <div class="container" id="consume_chart"></div>
        <div class="container" id="conceptchart"></div>
    </div>

    <script>
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawCharts);
    
        function drawCharts() {
            var dataConsume = JSON.parse('${dataConsume}'); // 서버로부터 전달된 JSON 문자열을 파싱
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Category');
            data.addColumn('number', 'Value');
    
            dataConsume.forEach(function (item) {
                data.addRow([item.name, item.value]);
            });
    
            var options = {
                title: '소비 데이터 차트',
                width: 400,
                height: 300
            };
    
            var chart = new google.visualization.BarChart(document.getElementById('consume_chart'));
            chart.draw(data, options);
        }
    </script>

    <!-- Footer -->
    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>
