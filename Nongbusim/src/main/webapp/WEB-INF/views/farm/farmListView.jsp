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
    .farm-list-area{
        width: 900px;
    }
    #farm-list-title{
        /* float: left; */
        margin-right: 500px;
        margin-bottom: 50px;
    }
    .local-area{
        background-color: rgb(235, 235, 235);
        width: 800px;
        padding: 30px;
        border-radius: 5px;
    }
    ul, li{
        margin: 0px;
        padding: 0px;
        list-style: none;
    }
    .area-selection-list{
        /* float: left; */
        width: 700px;
    }
    .area-selection-list li{
        display: inline-block;
        width: 23%;
    }
    #all-select-btn{
        margin-right: 600px;
        margin-bottom: 20px;
    }
    .farm-main-title>h3{
        display: inline-block;
        font-family: 'Pretendard-Regular';
        margin-top: 20px;
    }
    .farm-main-title{
        margin: 20px 490px 20px 0px;
    }
    .farm-info-table{
        width: 800px;
    }
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
    .crop-img{
        width: 100px;
    }
    .farm-info-table dt, .farm-info-table dd{
        display: inline;
    }
    .farm-info-table h3{
        font-weight: bold;
    }
    .farm-info-icon{
        width: 18px;
    }
    .farm-info h4 {
        font-weight: bold;
    }
    .farm-info a{
        color: black;
    }
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

	<div class="outer" align="center">

        <div class="farm-list-area">
            <h1 id="farm-list-title">농장리스트</h1>

            <div class="local-area">
                <button class="btn btn-secondary" id="all-select-btn">전체보기</button>
                
                <div class="area-selection-list">
                    <ul>
                        <li>서울</li>
                        <li>경기</li>
                        <li>충청</li>
                        <li>강원</li>
                        
                        <li>서울</li>
                        <li>경기</li>
                        <li>충청</li>
                        <li>강원</li>

                        <li>서울</li>
                        <li>경기</li>
                        <li>충청</li>
                        <li>강원</li>

                        <li>서울</li>
                        <li>경기</li>
                        <li>충청</li>
                        <li>강원</li>
                    </ul>
                </div>
            </div>

            <div class="farm-main-area">
                <div class="farm-main-title">
                    <h3>농장 전체 조회</h3>
                    <span>(총 ${farmList.size()}개)</span>
                </div>
                <hr style="width: 800px;">
    
                <div class="farm-area">
                    <table class="farm-info-table">
                        <c:forEach var="f" items="${farmList}">
                            <tr>
                                <td>
                                    <c:forEach var="at" items="${atList}">
                                        <c:if test="${f.farmNo eq at.boardNo}">
                                            <a href="detail.fm?fno=${f.farmNo}">
                                                <img class="farm-img" src="${at.changeName}">
                                            </a>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td class="farm-info">
                                    <dl>
                                        <a href="detail.fm?fno=${f.farmNo}"><h4>${f.farmName}</h4></a><br>
                                        <dt><img class="farm-info-icon" src="resources/images/marker-icon.png"></dt>
                                        <dd>${f.address}<br></dd>
                                        <dt><img class="farm-info-icon" src="resources/images/phone-icon.png"></dt>
                                        <dd>${f.phone}<br><br></dd>
                                        <dt>대표 작물</dt>
                                        <dd>
                                            <div><a href="">${f.crop}</a></div>
                                            <br>
                                        </dd>

                                        <!-- 프로그램이 있을 경우 -->
                                        <c:if test="${not empty farm.programName}">
                                        </c:if>

                                        <dt>진행중인 프로그램</dt>
                                        <dd>
                                            <div><a href="">${f.programName}</a></div>
                                            <br>
                                        </dd>

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
                </div>
            </div>

            <br>
            <!-- 페이지처리하는 영역-->
            <div id="market_page">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </div>

        </div>


    </div>
</body>
</html>