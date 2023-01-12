<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>비밀번호 찾기</title>
</head>
<body>
        <h3>비밀번호 찾기</h3>
        <hr>
        <form method="post" action="findPwd.me">
           	 아이디 : <input type="text" name="memId"><br>
           	 이름 : <input type="text" name="name"><br>
           	 이메일 : <input type="email" name="email">
            <button type="submit" class="btn btn-success">비밀번호 찾기</button>
        </form>

</body>
</html>