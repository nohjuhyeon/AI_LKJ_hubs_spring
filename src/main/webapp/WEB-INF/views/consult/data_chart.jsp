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
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>

    <h1 class="mt-5 mb-4 text-center">데이터 현황 차트</h1>

    <nav class="navbar bg-body-tertiary" id="chart_nav">
        <div class="container-fluid d-flex justify-content-center">
            <form action="${submitUrl}" method="POST" class="d-flex" role="search">
                <select name="select_region" class="form-select me-2 text-center" aria-label="지역 선택" style="width: 300px;">
                    <c:forEach items="${regions}" var="region">
                        <option value="${region}">${region}</option>
                    </c:forEach>
                </select>
                <button type="submit" class="btn btn-primary">검색</button>
            </form>
        </div>
    </nav>

    <div id="chartsContainer">
        <div class="container" id="visitorChart"></div>
        <div class="container" id="consume_transition_chart"></div>
        <div class="container" id="month_trend_Chart"></div>
        <div class="container" id="consume_chart"></div>
        <div class="container" id="conceptchart"></div>
    </div>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
        console.log("${dataConsumeJson}"); // 이 코드를 추가하여 실제로 어떤 문자열이 출력되는지 확인
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawCharts);
    
        function drawCharts() {
            try {
                var dataConsume = JSON.parse('${dataConsumeJson}'.replace(/&quot;/g, '\"'));
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Category');
                data.addColumn('number', 'Value');
    
                dataConsume.forEach(function(item) {
                    data.addRow([item.category, item.value]);
                });
    
                var options = {
                    title: '소비 데이터 차트',
                    width: 400,
                    height: 300
                };
    
                var chart = new google.visualization.BarChart(document.getElementById('consume_chart'));
                chart.draw(data, options);
            } catch (e) {
                console.error('Error parsing JSON!', e);
            }
        }
    </script>

    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>
