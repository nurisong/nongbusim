<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 상세정보</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>

table{

     border-color:rgb(228, 228, 228);
   }

table td {
    width: 300px;
    height: 50px;
}

table th {
    background-color:rgb(228, 228, 228);
    width: 100px;
    height: 50px;
}


</style>
</head>
<body>
 <jsp:include page="../common/menubar.jsp" />

<div align="center">
    <h1>프로그램 상세 정보</h1>
    <table border="1">
        <tr>
            <th>프로그램 명</th>
            <td>귤 따자고</td>
            <th>강사</th>
            <td>이영준</td>
        </tr>

        <tr>
            <th>교육 일정</th>
            <td>2023.01.01</td>
            <th>장소</th>
            <td>제주도 농ssssss장</td>
        </tr>

        <tr>
            <th>교육 시간</th>
            <td>10:00~12:00</td>
            <th>모집 인원</th>
            <td>50</td>
        </tr>

    </table>

    <h1>상세설명</h1>

    <input type="text" style="width: 800px; height:150px;" readonly>

    <h1>홍보 이미지</h1>

    <input type="text" style="width: 800px; height:250px;" readonly>

    <br><br>
    <button>신청</button>
</div>


</body>
</html>