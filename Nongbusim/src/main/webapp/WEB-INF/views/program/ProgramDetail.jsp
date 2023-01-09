<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 상세정보</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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

.prImg {
	background-img : url(${'resources/uploadFiles/2023010916202151331.png'});
}


</style>
</head>
<body>
 <jsp:include page="../common/menubar.jsp" />


<form action="">
	<div align="center">
    <h1>프로그램 상세 정보</h1>
    <table border="1">
        <tr>
            <th>프로그램 명</th>
            <td>${ p.programName }</td>
            <th>강사</th>
            <td>${ p.programLecture }</td>
        </tr>

        <tr>
            <th>교육 일정</th>
            <td>${ p.programPlan }</td>
            <th>장소</th>
            <td>${ p.programLocation }</td>
        </tr>

        <tr>
            <th>교육 시간</th>
            <td>${ p.programHour }</td>
            <th>모집 인원</th>
            <td>${ p.headcount }</td>
        </tr>

    </table>

    <h1>상세설명</h1>

    <input type="text" value="${ p.programDetail }" style="width: 800px; height:150px;" readonly>

    <h1>홍보 이미지</h1>


	 <img src="${p.changeName}" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
   
    <br><br>
    <button>신청</button>
</div>



</form>



</body>
</html>