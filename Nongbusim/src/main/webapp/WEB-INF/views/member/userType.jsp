<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    </style>
</head>
<body>
<!-- 메뉴바 -->
<jsp:include page="../common/menubar.jsp"/>

<br>
<h3>회원가입</h3>
    <hr>
    <h4>회원분류 선택</h4>
    <table class="table table-bordered" id="table">
        <tr>
            <td rowspan="2"><img src="" alt="">이미지</td>
            <td>농부</td>
        </tr>
        <tr>
            <td><a href="farmerEnrollForm.me" id="link">농부 회원가입</a></td>
        </tr>
    </table>

    <table class="table table-bordered" id="table">
        <tr>
            <td rowspan="2"><img src="" alt="">이미지</td>
            <td>일반사용자</td>
        </tr>
        <tr>
            <td><a href="userEnrollForm.me" id="link">일반사용자 회원가입</a></td>
        </tr>
    </table>
</body>
</html>