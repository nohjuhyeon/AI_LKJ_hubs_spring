<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <head>
        <meta charset="UTF-8">
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
        <link rel="styleshhet" herf="/common.css">
</head>

<body>
    <c:set var="requestParams" value="${param}"/>
    <div class="container-fluid mt-5 mb-5">
        <form action="${formAction}" method="get">
            <div class="row justify-content-center mt-5">
                <div class="col-6">
                    <select class="form-control" name="dorm_cate">
                        <option value="">전체</option>
                        <option value="hotel" ${requestParams.dorm_cate == 'hotel' ? 'selected' : ''}>호텔</option>
                        <option value="motel" ${requestParams.dorm_cate == 'motel' ? 'selected' : ''}>모텔</option>
                        <option value="guest_house" ${requestParams.dorm_cate == 'guest_house' ? 'selected' : ''}>게스트하우스</option>
                    </select>
                </div>
                <div class="col-1">
                    <button type="submit" class="btn btn-primary">검색</button>
                </div>
            </div>
            <div class="row justify-content-center">
                <button class="col-2 m-2 mt-5 mb-2 btn btn-primary" type="button" onclick="window.location.href='/plan_trip/reserve_transfer/'">뒤로가기</button>
                <button class="col-2 m-2 mt-5 mb-2 btn btn-primary" type="button" onclick="window.location.href='/plan_trip/reserve_tour/'">건너뛰기</button>
                <button class="col-2 m-2 mt-5 mb-2 btn btn-primary" type="submit">다음</button>
            </div>
        </form>
        <c:forEach var="dict_dorm" items="${list_dorm}">
            <div class="row align-items-stretch mb-3" style="border: 1px solid #555; border-radius: 15px; background-color: #ffffff;">
                <div class="col-md-3" style="border-right: 1px solid #555;">
                    <img src="${dict_dorm.dorm_image}" alt="Dorm Image" class="img-fluid" style="width: 100%; height: auto;">
                </div>
                <div class="col-md-9 d-flex flex-column justify-content-center">
                    <div class="mb-2">${dict_dorm.dorm_cate}</div>
                    <div class="d-flex justify-content-between align-items-baseline mb-2">
                        <h2>${dict_dorm.dorm_name}</h2>
                        <h2>${dict_dorm.dorm_price}</h2>
                    </div>
                    <div class="justify-content-between row">
                        <div class="col-md-4">${dict_dorm.dorm_address}</div>
                        <button class="btn btn-primary col-md-3">가격 비교하기</button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</body>

</html>
