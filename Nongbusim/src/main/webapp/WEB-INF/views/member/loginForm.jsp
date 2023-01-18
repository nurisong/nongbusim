<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

* {
    font-family: 'Noto Sans KR', sans-serif;
}

body {
    background-color: #1BBC9B;
}

.area {
    margin: auto;
    width: 300px;
    background-color: rgb(191, 221,183) ;
    border-radius: 5px;
    text-align: center;
    padding: 20px;
}

input {
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
    border-radius: 5px;
    border: none;
}

.in {
    margin-bottom: 10px;
}

.btn_1 {
    background-color:rgb(143, 177, 134) ;
    margin-bottom: 30px;
    border:none;
    width: 100%;
    color: white;
}

.btn_2{
    background-color: rgb(191, 221,183) ;
    border:none;
}





</style>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<!-- 메뉴바 -->
<jsp:include page="../common/menubar.jsp"/>

<br>




<div class="area" align="center">

    <h3>로그인</h3>
<hr>
<form action="login.me" method="post">
	 <input type="text" class="in" name="memId" placeholder="아이디를 입력하세요."><br>
     <input type="password" class="in" name="memPwd" placeholder="비밀번호를 입력하세요."><br>
    <button type="submit" class="btn_1">로그인</button>
</form>

<button type="submit" class="btn_2" onclick="location.href='findIdForm.me';">아이디 찾기</button>
<!-- <button type="submit" class="btn btn-secondary" onclick="location.href='findPwdForm.me';">비밀번호 찾기</button> -->
<button type="submit" class="btn_2" onclick="location.href='userType.me';">회원가입</button>


</div>


</body>
</html>