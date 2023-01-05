<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.outer{
    font-family: 'Pretendard-Regular';
}
.main-area{
    width: 1200px;
    padding: 50px;
}
#insert-btn{
    float: right;
}
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

    <div class="outer" align="center">
        <div class="main-area">

            <h1>정보 게시판</h1>
            <br><br>
            <button class="btn btn-secondary" id="insert-btn">글작성</button>
            <br><br><br>
            <table class="table">
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
                </tbody>
            </table>
        </div>
    </div>


</body>
</html>