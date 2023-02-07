<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농부심 | 농장 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .outer{
        padding: 50px;
        width: 100%;
        font-family: 'Pretendard-Regular';
    }
    .farm-area{ min-height: 300px; }
    .farm-list-area{ width: 900px; }
    #farm-list-title{
        margin-right: 500px;
        margin-bottom: 50px;
    }
    .search-area{
        background-color: rgb(235, 235, 235);
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.05);
        width: 800px;
        padding: 30px;
        border-radius: 5px;
    }
    ul, li{
        margin: 0px;
        padding: 0px;
        list-style: none;
    }
    .area-selection-list{ width: 700px; }
    .area-selection-list li{
        display: inline-block;
        width: 20%;
    }
    #all-select-btn{
        margin-right: 400px;
        margin-bottom: 20px;
    }
    .farm-main-title>h3{
        display: inline-block;
        font-family: 'Pretendard-Regular';
        margin-top: 20px;
    }
    .farm-main-title{ margin: 20px 490px 20px 0px; }
    .farm-info-table{ width: 800px; }
    .farm-info-table tr{
        height: 310px;
        border-bottom: 1px solid rgb(227, 227, 227);
    }
    .farm-img{
        width: 300px;
        height: 300px;
    }
    .farm-info{
        width: 700px;
        padding: 20px;
    }
    .crop-img{ width: 100px; }
    .farm-info-table dt, .farm-info-table dd{ display: inline; }
    .farm-info-table h3{ font-weight: bold; }
    .farm-info-icon{ width: 18px; }
    .farm-info h4 { font-weight: bold; }
    .farm-info a{ color: black; }
    #search-input{
        width: 300px;
        display: inline-block;
    }
    .local-area{
        background-color: rgb(248, 248, 248);
        border-radius: 5px;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.05);
        width: 680px;
    }
    .area-selection-list a{ color: black; }
    .search-title{
        font-size: 23px;
        margin-right: 500px;
    }
    .custom-select{ width: 100px; }
    #order-area{
        margin-top: 40px;
        margin-right: 50px;
    }
    #page-area a{ color: black; }
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

	<div class="outer" align="center">

        <div class="farm-list-area">
            <h1 id="farm-list-title">농장리스트</h1>

            <div class="search-area">
                
                <br>
                <form action="list.fm" method="get">
                    <input type="hidden" name="lco" value="${map.localCode}">

                    <select class="custom-select" name="condition" id="condition-select">
                        <option value="all">전체</option>
                        <option value="farmName">농장 이름</option>
                        <option value="crop">작물</option>
                    </select>
                    <input type="text" class="form-control" name="keyword" id="search-input">
                    <button type="submit" class="btn btn-secondary">검색</button>
                </form>
                
                
                <br><br>
                <div class="search-title">지역별 조회</div>
                <div class="local-area">
                    <br>
                    <a href="list.fm" class="btn btn-secondary" id="all-select-btn">전체보기</a>
                    <div class="area-selection-list">
                        <ul> 
                            <li><a href="list.fm?lco=su">서울</a></li>
                            <li><a href="list.fm?lco=gg">경기</a></li>
                            <li><a href="list.fm?lco=ic">인천</a></li>
                            <li><a href="list.fm?lco=gw">강원</a></li><br>
                            <li><a href="list.fm?lco=cc">충청</a></li>
                            <li><a href="list.fm?lco=gs">경상</a></li>
                            <li><a href="list.fm?lco=jl">전라</a></li>
                            <li><a href="list.fm?lco=jj">제주</a></li>
                        </ul>
                        <br>
                    </div>
                    <br>
                </div>
                <br>
            </div>

            <div>
                <div id="order-area" style="float: right;">
                    <select class="custom-select" id="order-select" name="order" onchange="location.href=this.value">
                        <option name="recent" value="list.fm?lco=${map.localCode}&condition=${map.condition}&keyword=${map.keyword}&order=recent" selected>최신순</option>
                        <option name="name" value="list.fm?lco=${map.localCode}&condition=${map.condition}&keyword=${map.keyword}&order=name">이름순</option>
                    </select>
                </div>
            </div>

            <div class="farm-main-area">
                <div class="farm-main-title">
                    <h3>농장 조회</h3>
                    <span>(총 ${pi.listCount}개)</span>
                </div>
                <hr style="width: 800px;">
    
                <div class="farm-area">
                    <table class="farm-info-table">
                        <c:forEach var="farm" items="${farmList}">
                            <tr>
                                <td>
                                     <a href="detail.fm?fno=${farm.farmNo}">
                                         <img class="farm-img" src="${farm.mainImg}">
                                     </a>
                                </td>
                                <td class="farm-info">
                                    <dl>
                                        <a href="detail.fm?fno=${farm.farmNo}"><h4>${farm.farmName}</h4></a><br>
                                        <dt><img class="farm-info-icon" src="resources/images/marker-icon.png"></dt>
                                        <dd>${farm.address}<br></dd>
                                        <dt><img class="farm-info-icon" src="resources/images/phone-icon.png"></dt>
                                        <dd>${farm.phone}<br><br></dd>
                                        <dt>대표 작물</dt>
                                        <dd>
                                            <div>${farm.crop}</div>
                                            <br>
                                        </dd>

                                        <!-- 프로그램이 있을 경우 -->
                                        <dt>진행중인 프로그램</dt>
                                                <dd>
                                                    <div><a href="detail.pro?bno=${farm.programNo}">${farm.programName}</a></div>
                                                </dd>
                                        <br>


                                        <!-- <dt>판매중인 작물<br></dt>
                                        <dd>
                                            <img class="crop-img" src="https://images.unsplash.com/photo-1622943316951-33fd198b660f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3RyYXdiZXJyeXxlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60" alt="">
                                            <img class="crop-img" src="https://images.unsplash.com/photo-1622943316951-33fd198b660f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3RyYXdiZXJyeXxlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60" alt="">
                                            <img class="crop-img" src="https://images.unsplash.com/photo-1622943316951-33fd198b660f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3RyYXdiZXJyeXxlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60" alt="">
                                        </dd> -->
                                        
                                    </dl>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <c:if test="${empty farmList}">
                        <div><br><br><br>
                            일치하는 검색 결과가 없습니다.</div>
                        </c:if>
                    </div>
                </div>

            <br>
            <!-- 페이지처리하는 영역-->
            <div id="page-area">
                <ul class="pagination justify-content-center">
                    <c:if test="${pi.currentPage ne 1}">
                        <li class="page-item"><a class="page-link" href="list.fm?cpage=${pi.currentPage - 1}&lco=${map.localCode}&condition=${map.condition}&keyword=${map.keyword}&order=${map.order}">이전</a></li>
                    </c:if>

                    <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                        <li class="page-item"><a class="page-link" href="list.fm?cpage=${p}&lco=${map.localCode}&condition=${map.condition}&keyword=${map.keyword}&order=${map.order}">${p}</a></li>
                    </c:forEach>    
                    
                    <c:if test="${pi.maxPage ne pi.currentPage}">
                        <li class="page-item"><a class="page-link" href="list.fm?cpage=${pi.currentPage + 1}&lco=${map.localCode}&condition=${map.condition}&keyword=${map.keyword}&order=${map.order}">다음</a></li>
                    </c:if>
                </ul>
            </div>

        </div>


    </div>

    <script>
        $(function(){
            $('#order-select option[name=' + "${map.order}" + ']').prop('selected',true);
            $('#condition-select').val('${map.condition}').prop('selected', true);
            $('#search-input').val('${map.keyword}');
        })
    </script>
</body>
</html>