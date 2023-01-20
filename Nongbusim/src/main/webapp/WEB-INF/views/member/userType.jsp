<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        #link{
            text-decoration: none;
            color: black;
        }

        #table{
            display: inline;
            text-align: center;
            margin-right: 30px;
        }


        body {
    min-height: 600px;
        }

        body {
            position:relative;
            z-index:1;
        }
        body:after {
            background-image:url(resources/images/farm.PNG);
            top:0;
            left:0;
            position:absolute;
            background-size:100%;
            opacity:0.6!important;
            filter:alpha(opacity=50);
            z-index:-1;
            content:"";
            width:100%;
            height:800px;
        }

    </style>
</head>
<body>
<!-- 메뉴바 -->
<jsp:include page="../common/menubar.jsp"/>

<br>
<div align="center">
    <h3>회원가입</h3>
    <hr>
    <h4>회원분류 선택</h4>
    <table class="table table-bordered" id="table" border="1">
        <tr>
            <td rowspan="2"><img src="resources/images/nb.PNG" style="width: 150px; height:180px;" alt=""></td>
            <td><img src="resources/images/농부가입.PNG" style="width: 200px; height:140px;" alt=""></td>
        </tr>

        
        <tr>
            <td> <button onclick="location.href='farmerEnrollForm.me' ">회원가입</button></td>
        </tr>
    </table>

    <table class="table table-bordered" id="table" border="1">
        <tr>
            <td rowspan="2"><img src="resources/images/user.PNG" style="width: 150px; height:180px;" alt=""></td>
            <td> <td><img src="resources/images/일반일반.PNG" style="width: 200px; height:140px;" alt=""></td></td>
        </tr>
        <tr>
           
            <td> <button onclick="location.href='userEnrollForm.me' ">회원가입</button></td>
        </tr>
    </table>







</div>
</body>
</html>