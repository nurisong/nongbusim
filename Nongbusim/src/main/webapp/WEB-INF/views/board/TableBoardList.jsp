<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판리스트</title>
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

            <h1>게시판</h1>
            <br><br>
            <button class="btn btn-secondary" id="insert-btn">글작성</button>
            <br><br><br>
            <table class="table">
                <thead class="thead-light" align="center">
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>좋아요</th>
                    <th>조회수</th>
                </thead>
                <tbody align="center">
                    <tr>
                        <td>boardNo</td>
                        <td>boardTitle</td>
                        <td>boardWriter</td>
                        <td>createDate</td>
                        <td>like</td>
                        <td>count</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>


</body>
</html>