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
        background-color: #FFFFFF;
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
    <div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-5 align-items-center justify-content-center">
        <form style="width: 80%;" method="post">
            {%for concept in concept_list%}
            <div class="container p-4 my-3 alert" style="border: 1px solid #007BFF;border-radius: 10px; background-color: #FFFFFF;">
                <div class="row">
                    <h3 class="col">CONCEPT {{loop.index}} : {{concept}}</h3>
                    <input type="hidden" name="concept_list" value="{{ concept_list|join(',') }}">
                    <button class="btn btn-outline-primary col-md-3" style="height: 100%;" formaction="/plan_trip/trip_plan/"
                        name="trip_concept" value={{loop.index}} formmethod="post">계획 짜러 가기</button>
                </div>
            </div>
            {%endfor%}
            <!-- <div class="container p-4 my-3 alert" style="border: 1px solid #007BFF;border-radius: 10px; background-color: #FFFFFF;">
                <div class="row">
                    <h3 class="col">CONCEPT {{concept_list|length+1}} : 사용자 설정</h3>
                    <button class="btn btn-outline-primary col-md-3" style="height: 100%;" formaction="/plan_trip/trip_plan/"
                        name="trip_concept" value= '상관없음' method="">계획 짜러 가기</button>
                </div>
            </div> -->
            <div class="container">
                <div class="row">
                    <div class="col text-right">
                        <button class="btn btn-primary col-md-3" style="height: 100%;" formaction="/plan_trip/reserve_tour/"
                            name="trip_concept" value="trip_concept_user">뒤로 가기</button>
                    </div>
                </div>
            </div>
            <input type="hidden" name="datediff" value={{datediff}}>
            <input type="hidden" name="arrive" value="{{ form_data['arrive'] }}">
        </form>
    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>