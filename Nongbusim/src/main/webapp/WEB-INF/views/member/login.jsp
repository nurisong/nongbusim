<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<h3>회원 로그인</h3>
<hr>
<form action="login.me" method="post">
	아이디 : <input type="text" name="memId" placeholder="아이디를 입력하세요."><br>
       비밀번호 : <input type="password" name="memPwd" placeholder="비밀번호를 입력하세요."><br>
    <button type="submit" class="btn btn-success">로그인</button>
</form>
<br>
<button class="btn btn-secondary">아이디 찾기</button>
<button class="btn btn-secondary">비밀번호 찾기</button>
<button class="btn btn-secondary">회원가입</button>
</body>
</html>