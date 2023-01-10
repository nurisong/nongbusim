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

            <h1>나의 농장</h1>

            <form id="searchForm" action="search.if" method="get" align="center">
                <div class="select">
                    <select class="custom-select" name="condition">
                        <option value="writer">전체</option>
                        <option value="title">보도자료</option>
                        <option value="content">농업정보</option>
                        <option value="content">농촌소식</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>

            <c:if test="${loginUser.status eq a}">
                <a class="btn btn-secondary" id="insert-btn" href="insert.if">글작성</a>
            </c:if>
            
            <br><br><br>
            <div class="board-area">
                <table class="table info-table">
                    <thead class="thead-light" align="center">
                        <th>no</th>
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>첨부파일</th>
                        <th>등록일</th>
                        <th>조회수</th>
                    </thead>
                    <tbody align="center">
                        <tr>
                            <td>1</td>
                            <td>보도기사</td>
                            <td>그런일이 있었답니다</td>
                            <td>0</td>
                            <td>2023-01-05</td>
                            <td>102</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>보도기사</td>
                            <td>그런일이 있었답니다</td>
                            <td>0</td>
                            <td>2023-01-05</td>
                            <td>102</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>보도기사</td>
                            <td>그런일이 있었답니다</td>
                            <td>0</td>
                            <td>2023-01-05</td>
                            <td>102</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>보도기사</td>
                            <td>그런일이 있었답니다</td>
                            <td>0</td>
                            <td>2023-01-05</td>
                            <td>102</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>보도기사</td>
                            <td>그런일이 있었답니다</td>
                            <td>0</td>
                            <td>2023-01-05</td>
                            <td>102</td>
                        </tr>
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


</body>
</html>