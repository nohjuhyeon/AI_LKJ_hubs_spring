<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recommend Region</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/main.css">
    <style>
        fieldset {
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

        .search-button {
            margin-left: auto;
            margin-top: 20px;
            width: 150px;
            height: 170px;
            font-size: 18px;
        }

        .border {
            background-color: #c9cfd4;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .community-content {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 10px 0;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 12px;
            box-shadow: 0 2px 4px rgba(221, 238, 240, 0.1);
            transition: background-color 0.3s, border-color 0.3s, color 0.3s;
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
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>

    <form action="/event/recommend_region" method="get">
        <div class="row">
            <div class="flex-container col-7">
                <fieldset class="mt-4">
                    <div class="ml-3">
                        <legend class="mt-2">여행 컨셉</legend>
                        <input type="checkbox" id="total_concept" name="concept" value="total_concept" />
                        <label for="total_concept">전체</label>
                        <input type="checkbox" id="nature" name="concept_01" value="자연관광" />
                        <label for="nature">자연 관광</label>
                        <input type="checkbox" id="cultural" name="concept_02" value="문화관광" />
                        <label for="cultural">문화 관광</label>
                        <input type="checkbox" id="leisure" name="concept_03" value="레저스포츠" />
                        <label for="leisure">레저 스포츠</label>
                        <input type="checkbox" id="history" name="concept_04" value="역사관광" />
                        <label for="history">역사 관광</label>
                    </div>
                </fieldset>
            </div>
            <div class="flex-container col-5">
                <fieldset class="mt-4">
                    <div class="ml-3">
                        <legend class="mt-2">계절</legend>
                        <input type="checkbox" id="total_season" name="season" value="total_season" />
                        <label for="total_season">전체</label>
                        <input type="checkbox" id="spring" name="season_01" value="spring" />
                        <label for="spring">봄</label>
                        <input type="checkbox" id="summer" name="season_02" value="summer" />
                        <label for="summer">여름</label>
                        <input type="checkbox" id="fall" name="season_03" value="fall" />
                        <label for="fall">가을</label>
                        <input type="checkbox" id="winter" name="season_04" value="winter" />
                        <label for="winter">겨울</label>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="flex-container mb-5">
            <fieldset class="mt-4">
                <div class="ml-4">
                    <legend class="mt-2">지역</legend>
                    <input type="checkbox" id="total_region" name="region" value="total_region">
                    <label for="total_region">전체</label>
                    <input type="checkbox" id="seoul" name="region_01" value="서울">
                    <label for="seoul">서울 특별시</label>
                    <input type="checkbox" id="gyeonggi" name="region_02" value="경기" />
                    <label for="gyeonggi">경기</label>
                    <input type="checkbox" id="Incheon" name="region_03" value="인천" />
                    <label for="Incheon">인천 광역시</label>
                    <input type="checkbox" id="Gangwon" name="region_04" value="강원" />
                    <label for="Gangwon">강원</label>
                    <input type="checkbox" id="Gyeongsangnam-do" name="region_05" value="경남" />
                    <label for="Gyeongsangnam-do">경상남도</label>
                    <input type="checkbox" id="Gyeongsangbuk-do" name="region_06" value="경북" />
                    <label for="Gyeongsangbuk-do">경상북도</label>
                    <input type="checkbox" id="Gwangju" name="region_07" value="광주" />
                    <label for="Gwangju">광주 광역시</label>
                    <input type="checkbox" id="Daegu" name="region_08" value="대구" />
                    <label for="Daegu">대구 광역시</label>
                    <input type="checkbox" id="Daejeon" name="region_09" value="대전" />
                    <label for="Daejeon">대전 광역시</label>
                    <input type="checkbox" id="busan" name="region_10" value="부산" />
                    <label for="busan">부산 광역시</label>
                    <input type="checkbox" id="Sejong" name="region_11" value="세종" />
                    <label for="Sejong">세종 특별시</label>
                    <input type="checkbox" id="Ulsan" name="region_12" value="울산" />
                    <label for="Ulsan">울산 광역시</label>
                    <input type="checkbox" id="Jeollanam-do" name="region_13" value="전남" />
                    <label for="Jeollanam-do">전라남도</label>
                    <input type="checkbox" id="Jeollabuk-do" name="region_14" value="전북" />
                    <label for="Jeollabuk-do">전라북도</label>
                    <input type="checkbox" id="Chungcheongnam-do" name="region_15" value="충남" />
                    <label for="Chungcheongnam-do">충청남도</label>
                    <input type="checkbox" id="Chungcheongbuk-do" name="region_16" value="충북" />
                    <label for="Chungcheongbuk-do">충청북도</label>
                    <input type="checkbox" id="Jeju" name="region_17" value="제주" />
                    <label for="Jeju">제주 특별자치도</label>
                </div>
            </fieldset>
            <button type="submit" class="btn btn-primary search-button">검색</button>
        </div>
    </form>

    <div id="attractions-container">
        <% 
            List<Map<String, Object>> attractions = (List<Map<String, Object>>) request.getAttribute("attractions");
            if (attractions != null && !attractions.isEmpty()) {
                for (Map<String, Object> attraction : attractions) {
        %>
                    <div class="container p-3 my-3 border">
                        <div class="row align-items-start">
                            <div class="col-md-3">
                                <img src="<%= attraction.get("attraction_img") %>" alt="<%= attraction.get("attraction_name") %>" class="img-fluid wide-image" style="height: 239px; width: 239px;">
                            </div>
                            <div class="col-md-9">
                                <div class="row">
                                    <div class="col-md-4">
                                        <h4 class="border community-content"><%= attraction.get("attraction_name") %></h4>
                                    </div>
                                    <div class="col-md-4">
                                        <h4 class="border community-content"><%= attraction.get("region") %></h4>
                                    </div>
                                    <div class="col-md-4">
                                        <h4 class="border community-content"><%= attraction.get("destination_type") %></h4>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <h4 class="border community-content"><%= attraction.get("address") %></h4>
                                    </div>
                                </div>
                                <div class="row align-items-center">
                                    <div class="col-md-9">
                                        <h4 class="border community-content"><%= attraction.get("attraction_content") %></h4>
                                    </div>
                                    <div class="col-md-3">
                                        <a href="<%= attraction.get("attraction_link") %>" class="btn btn-primary btn-lg d-flex align-items-center mt-2" style="height: 100px; width: 180px;">자세히 보러가기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        <% 
                }
            }
        %>
    </div>

    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('total_concept').addEventListener('change', function () {
            const isChecked = this.checked;
            document.querySelectorAll('input[name^="concept"]').forEach(checkbox => {
                checkbox.checked = isChecked;
            });
        });

        document.querySelectorAll('input[name^="concept"]').forEach(checkbox => {
            checkbox.addEventListener('change', function () {
                const allChecked = Array.from(document.querySelectorAll('input[name^="concept"]')).every(checkbox => checkbox.checked);
                document.getElementById('total_concept').checked = allChecked;
            });
        });

        document.getElementById('total_season').addEventListener('change', function () {
            const isChecked = this.checked;
            document.querySelectorAll('input[name^="season"]').forEach(checkbox => {
                checkbox.checked = isChecked;
            });
        });

        document.querySelectorAll('input[name^="season"]').forEach(checkbox => {
            checkbox.addEventListener('change', function () {
                const allChecked = Array.from(document.querySelectorAll('input[name^="season"]')).every(checkbox => checkbox.checked);
                document.getElementById('total_season').checked = allChecked;
            });
        });

        document.getElementById('total_region').addEventListener('change', function () {
            const isChecked = this.checked;
            document.querySelectorAll('input[name^="region"]').forEach(checkbox => {
                checkbox.checked = isChecked;
            });
        });

        document.querySelectorAll('input[name^="region"]').forEach(checkbox => {
            checkbox.addEventListener('change', function () {
                const allChecked = Array.from(document.querySelectorAll('input[name^="region"]')).every(checkbox => checkbox.checked);
                document.getElementById('total_region').checked = allChecked;
            });
        });
    });
</script>

</body>
</html>
