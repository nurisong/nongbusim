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
<style>
.outer{font-family: 'Pretendard-Regular';}
.main-area{
    width: 1200px;
    padding: 50px;
}
.main-area>h1{
    float: left;
}
#insert-btn{float: right;}
#insert-btn:hover{cursor: pointer;}
.farm-table>tbody>tr:hover{cursor: pointer;}
.farm-area{height: 350px;}
.custom-select{width: 100px;}
.form-control{width: 300px;}
.select, .text{display: inline-block;}
#no-farm{
    width: 1100px;
    height: 200px;
    font-size: 18px;
    background-color: rgb(223, 223, 223);
    border-radius: 5px;
}
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

    <div class="outer" align="center">
        <div class="main-area">

            <h1>나의 농장</h1>

            <br><br><br>

            <a class="btn btn-secondary" id="insert-btn" href="enrollForm.fm">+ 신규 농장 등록</a>
            
            <br><br><br>
            <div class="farm-area">
                <c:choose>
                    <c:when test="${ not empty farmList }">
                        <!-- farmList가 있으면 -->
                        <table class="table farm-table">
                            <thead class="thead-light" align="center">
                                <th>농장 이름</th>
                                <th>주소</th>
                                <th>연락처</th>
                            </thead>
                            <tbody align="center">

                            <c:forEach var="f" items="${ farmList }">
                                <tr>
                                    <input type="hidden" id="farmNo" value="${f.farmNo}">
                                    <td>${f.farmName}</td>
                                    <td>${f.address}</td>
                                    <td>${f.phone}</td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <br>
                        <!-- 비어있으면 -->
                        <div id="no-farm">
                            <br><br><br>
                            등록한 농장이 존재하지 않습니다.
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <script>
        $(function(){
            $('.farm-table>tbody>tr').click(function(){
                // console.log($(this).children().eq(0).val());
                location.href = "detail.fm?fno=" + $(this).children().eq(0).val();
            })

        })
    </script>
</body>
</html>