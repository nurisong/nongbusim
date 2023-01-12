<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농부심 | 정보 게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.outer{font-family: 'Pretendard-Regular';}
.main-area{
    width: 1200px;
    padding: 50px;
}
.info-menu{
    color: rgb(178, 178, 178);
}
.info-menu>a:hover{
    text-decoration: none;
    color: rgb(142, 141, 141);
}
#insert-btn{float: right;}
#insert-btn:hover{cursor: pointer;}
.info-table>tbody>tr:hover{cursor: pointer;}
.board-area{height: 350px;}
.custom-select{width: 100px;}
.form-control{width: 300px;}
.select, .text{display: inline-block;}
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

    <div class="outer" align="center">
        <div class="main-area">

            <h1>정보 게시판</h1>
            
            <div class="info-menu">
                <a href="list.if">전체</a> | 
                <a href="search.if?ctg=보도자료">보도자료</a> | 
                <a href="search.if?ctg=농업정보">농업정보</a> | 
                <a href="search.if?ctg=농촌소식">농촌소식</a>
            </div>
            <br><br>

            <form id="searchForm" action="search.if" method="get" align="center">
                <div class="select">
                    <select class="custom-select" name="condition">
                        <option value="all">전체</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>

            <c:if test="${loginUser.status eq a}">
                <a class="btn btn-secondary" id="insert-btn" href="enrollForm.if">글작성</a>
            </c:if>
            
            <br><br><br>
            <div class="board-area">
                <table class="table info-table">
                    <thead class="thead-light" align="center">
                        <th>no</th>
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>등록일</th>
                        <th>조회수</th>
                    </thead>
                    <tbody align="center">
                        <c:forEach var="info" items="${infoList}">
                            <tr>
                                <td class="ino">${info.infoNo}</td>
                                <td>${info.category}</td>
                                <td>${info.infoTitle}</td>
                                <td>${info.createDate}</td>
                                <td>${info.count}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <br><br>
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

    <script>
        $('.info-table>tbody>tr').click(function(){
            location.href="detail.if?ino=" + $(this).children('.ino').text();

        });

    </script>

</body>
</html>