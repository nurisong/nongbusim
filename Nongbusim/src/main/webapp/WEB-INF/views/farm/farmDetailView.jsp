<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농부심</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1d40107f1ef7cb9b23f17d054938c10e&libraries=services"></script>

<style>
    *>a{ color: black; }
    .outer{
        padding: 50px;
        width: 100%;
        font-family: 'Pretendard-Regular';
    }
    .main-area{ width: 900px; }
    .farm-area{ height: 300px; }
    .name-info{ margin: 30px 0px 50px 0px; }
    .name-area{
        width: 40%;
        display: inline-block;
        padding-top: 20px;
    }
    .info-area{
        width: 60%;
        /* background-color: aquamarine; */
        display: inline-block;
        float: right;
        padding-left: 30px;
    }
    .farm-info-icon{ width: 18px; }
    .info{
        text-align: left;
        background-color: rgb(235, 235, 235);
        width: 400px;
        height: 90px;
        border-radius: 5px;
        padding: 20px;
        padding-left: 30px;
    }
    .fotorama{ width: 800px; }
    .bottom-area{
        text-align: left;
        padding: 30px;
    }
    .program-area, .sale-area, .map-area{ padding: 20px; }
    .program-area tbody a{ color: black; }
    .crop-img{ width: 200px; }
    .intro-area{
        padding-left: 50px;
        text-align: left;
        margin: 60px 0px 30px 0px;
    }
    .intro-content{
        height: 100px;
        background-color: rgb(235, 235, 235);
        padding: 30px;
        border-radius: 5px;
    }
    #update-btn{
        margin-left: 640px;
        background-color: green;
        display: inline-block;
    }
    .program-table{ text-align: center; }
    .map-area>div{ display: inline-block; }
    #map-text-area{
        float: right;
        padding-top: 50px;
        padding-left: 30px;
        height: 350px;
        width: 50%;
    }

.container {
  position: relative;
  width: 24%;
  display: inline-block;
  padding: 0px;
  margin: 3px;
}

.image {
  display: block;
  width: 100%;
  height: 200px;
}

.textbox {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  width: 100%;
  opacity: 0;
  transition: .5s ease;
  background-color: rgb(68, 68, 68);
}

.container:hover .textbox { opacity: 0.9; }

.text {
  color: white;
  font-size: 20px;
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  text-align: center;
}
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

	<div class="outer" align="center">

        <c:if test="${loginUser.memNo == farm.farmer}">
            <a class="btn btn-secondary" id="update-btn" onclick="postFormSubmit(1);">농장 정보 수정하기</a>
            <a class="btn btn-secondary" id="del-btn" onclick="postFormSubmit(2);">삭제하기</a>
        </c:if>

        <div class="main-area">
            <div class="name-info">
                <h1 class="name-area">${farm.farmName}</h1>
                <div class="info-area">
                    <div class="info">
                        <span><img class="farm-info-icon" src="resources/images/marker-icon.png"></span>
                        <span>${farm.address}</span>
                        <br>
                        <span><img class="farm-info-icon" src="resources/images/phone-icon.png"></span>
                        <span>${farm.phone}</span>
                        <br>
                    </div>
                </div>
            </div>

            <hr style="width: 800px;">
            
            <br><br>
            <div class="fotorama">
                <c:forEach var="at" items="${atList}">
                    <img src="${at.changeName}">
                </c:forEach>
            </div>
            
            <div class="intro-area">
                <h4>소개글</h4>
                <br>
                <div class="intro-content">
                    ${farm.farmIntro}
                </div>
            </div>

            <div class="bottom-area">
                <div class="program-area">

                    <h4>진행중인 프로그램</h4>
                    <br>
                    <table class="table program-table">
                        <thead class="thead-light">
                            <tr>
                                <th style="width: 490px;">프로그램명</th>
                                <th>날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="pg" items="${programList}">
                                <tr>
                                    <td><a href="detail.pro?bno=${pg.programNo}">${pg.programName}</a></td>
                                    <td>${pg.programPlan}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="sale-area">
                    <h4>판매중인 작물</h4>
                    <br>
                    <table>
                        <tr>
                            <c:forEach var="mk" items="${mkList}">
                                <c:forEach var="at" items="${mkAtList}">
                                    <c:if test="${mk.marketNo eq at.boardNo}">
                                        <div class="container">
                                            <img src="${at.changeName}" class="image">
                                            <div class="textbox">
                                                <div class="text">
                                                    ${mk.marketTitle} <br>
                                                    ${mk.marketPrice}원 <br>
                                                    <a href="detail.mk?marketNo=${mk.marketNo}">
                                                        > 더보기
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                            

                            <!-- <c:forEach var="mk" items="${mkList}">
                                <c:forEach var="at" items="${mkAtList}">
                                    <td><a href="detail.mk?marketNo=${mk.marketNo}"><img class="crop-img" src="${at.changeName}"></a></td>
                                </c:forEach>
                            </c:forEach>
                            <td><img class="crop-img" src="https://images.unsplash.com/photo-1622943316951-33fd198b660f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3RyYXdiZXJyeXxlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60"></td>
                            <td><img class="crop-img" src="https://images.unsplash.com/photo-1622943316951-33fd198b660f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3RyYXdiZXJyeXxlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60"></td>
                            <td><img class="crop-img" src="https://images.unsplash.com/photo-1622943316951-33fd198b660f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3RyYXdiZXJyeXxlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60"></td>
                             -->    
                        </tr>
                    </table>
                </div><br>

                <div class="map-area">
                    <h4>찾아오시는 길</h4>
                    <br>
                    <div id="map" style="width:50%;height:350px;"></div>
                    <div id="map-text-area">
                        <div>
                            <span><img class="farm-info-icon" src="resources/images/marker-icon.png"></span> ${farm.address}
                        </div>
                        <div>
                            <span><img class="farm-info-icon" src="resources/images/car-icon.png"></span>  <a class="btn btn-secondary" id="link-kakaomap">길찾기</a>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>

    <form action="" method="post" id="postForm">
        <input type="hidden" name="fno" value="${farm.farmNo}">
    </form>

    <script>
        function postFormSubmit(num){

            if(num==1){
                $('#postForm').attr('action', 'updateForm.fm').submit();
            }
            else{
                if(confirm('삭제하시겠습니까?')){
                    $('#postForm').attr('action', 'delete.fm').submit();
                }        
            }
        }

        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
            level: 3 //지도의 레벨(확대, 축소 정도)
        };

        // 지도를 생성합니다
        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch('${farm.address}', function (result, status) {

            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);

                var iwContent = '<div style="padding:5px;">${farm.farmName}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

                // 인포윈도우를 생성합니다
                var infowindow = new kakao.maps.InfoWindow({
                    position : iwPosition, 
                    content : iwContent 
                });
                
                // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                infowindow.open(map, marker); 

                $('#link-kakaomap').click(function(){
                    console.log('https://map.kakao.com/link/to/' + '${farm.farmName},' + coords.Ma + "," + coords.La);
                    $(this).attr('href', 'https://map.kakao.com/link/to/' + '${farm.farmName},' + coords.La + ',' + coords.Ma );
                    
                })
            }
        });   

        
    </script>
</body>
</html>