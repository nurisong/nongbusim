<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 등록</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
table td{

border: 1px solid rgb(175, 171, 171);

height: 30px;
}

button:active {
box-shadow: 1px 1px 0 rgb(0,0,0,0.5);
position: relative;
background-color: #b7cf72;

}

table {

width: 460px;

}

table th{
   background-color:rgb(228, 228, 228);
}

.table_Area td{
text-align: center;
}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
<div align="center">

	<br><br>
   <h1>교육 프로그램 등록</h1>
      <form action="">
         <table border="1">
            <tr>
               <th>프로그램명</th>
               <td><input type="text"></td>
            </tr>
            <tr>
               <th>교육일정</th>
               <td><input type="date"></td>
            </tr>
            <tr>
               <th>교육시간</th>
               <td><input type="time"></td>
            </tr>
            <tr>
               <th>강사</th>
               <td><input type="text"></td>
            </tr>
            <tr>
               <th>장소</th>
               <td><input type="text"></td>
            </tr>
            <tr>
               <th>모집인원</th>
               <td><input type="text"></td>
            </tr>
            <tr>
               <th>상세설명</th>
               <td><input type="text"></td>
            </tr>
            <tr>
               <th>홍보이미지</th>
               <td><input type="file"></td>
            </tr>
         </table>
      </form>
      <br>

      <button>등록</button>

  </div>

</body>
</html>