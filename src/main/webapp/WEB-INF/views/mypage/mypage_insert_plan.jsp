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
    <link rel="stylesheet" href="/insert_plan.css">
    <title>여행 계획 관리</title>
</head>
<body>
    <!-- Menu -->
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>
    <div class="container-fluid" style="margin-top: 5%;">
        <div class="row" style="margin-top: 10%; margin-bottom: 10%;">
          <div class="col-md-3">
            <h3 style="margin-bottom: 20px;">마이페이지</h3>
            <ul class="list-unstyled">
                <form class="row justify-content-start" style="margin-left: 10px; margin-top: 50px;">
                    <li>
                        <button class="col-9 themed-grid-col btn btn-light" style="font-size: 15px; margin: 10px;"
                            formaction="/mypageInfo" method="">개인정보수정</button>
                    </li>
                    <li>
                        <button class="col-9 themed-grid-col btn btn-light" style="font-size: 15px; margin: 10px;"
                            formaction="/mypageInsert_plan" method="">나의 여행계획 관리</button>
                    </li>
                    <li>
                        <button class="col-9 themed-grid-col btn btn-light" style="font-size: 15px; margin: 10px;"
                            formaction="/mypageReview" method="">나의 여행 후기 관리</button>
                    </li>
                    <li>
                        <button class="col-9 themed-grid-col btn btn-light" style="font-size: 15px; margin: 10px;"
                            formaction="/mypagePlan_list" method="">내가 찜한 여행기</button>
                    </li>
                    <li>
                        <button class="col-9 themed-grid-col btn btn-light" style="font-size: 15px; margin: 10px;"
                        formaction="/mypageReserve_list" method="">예약내역</button>
                    </li>
                </form>
            </ul>
          </div>
          <div class="col-md-8 offset-md-1">
            <h2>나의 여행계획 관리</h2>
            <div class="rounded-panel" style="border: 1px solid #ccc; padding: 20px; margin-bottom: 20px;">
              <div style="display: flex; align-items: center; position: relative;">
                <div class="image-preview" style="flex: 0 0 200px; height: 200px; width: 200px; background-color: #f0f0f0; margin-right: 20px;">
                  이미지 미리보기
                </div>
                <div style="flex: 1; border-left: 1px solid #ccc; padding-left: 20px; margin-bottom: 20px;">
                  <div><strong>여행기 제목: </strong>부산 여행 <span style="float: right;" class="fas fa-trash"></span> </div>
                  <div style="border-top: 1px solid #ccc; margin: 20px 0;"></div>
                  <div><strong>여행기 테마: </strong>식도락 여행</div>
                  <div style="border-top: 1px solid #ccc; margin: 20px 0;"></div>
                  <div><strong>여행기 작성 날짜: </strong>2023-03-15</div>
                  <div class="plan-button-container">
                    <button class="btn btn-primary btn-sm plan-button">계획 보러가기</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="rounded-panel" style="border: 1px solid #ccc; padding: 20px; margin-bottom: 20px;">
                <div style="display: flex; align-items: center; position: relative;">
                  <div class="image-preview" style="flex: 0 0 200px; height: 200px; width: 200px; background-color: #f0f0f0; margin-right: 20px;">
                    이미지 미리보기
                  </div>
                  <div style="flex: 1; border-left: 1px solid #ccc; padding-left: 20px; margin-bottom: 20px;">
                    <div><strong>여행기 제목: </strong>부산 여행 <span style="float: right;" class="fas fa-trash"></span> </div>
                    <div style="border-top: 1px solid #ccc; margin: 20px 0;"></div>
                    <div><strong>여행기 테마: </strong>식도락 여행</div>
                    <div style="border-top: 1px solid #ccc; margin: 20px 0;"></div>
                    <div><strong>여행기 작성 날짜: </strong>2023-03-15</div>
                    <div class="plan-button-container">
                      <button class="btn btn-primary btn-sm plan-button">계획 보러가기</button>
                    </div>
                  </div>
                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>