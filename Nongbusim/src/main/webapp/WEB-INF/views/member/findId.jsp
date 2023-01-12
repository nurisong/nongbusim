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
    <title>아이디 찾기</title>
</head>
<body>

<!-- 메뉴바 -->
<jsp:include page="../common/menubar.jsp" />
        <h3>아이디 찾기</h3>
        <hr>
        <form method="post" action="findId.me">
	            이름 : <input type="text" name="name" required><br>
	            이메일 : <input type="email" name="email" required>
            <button type="submit" class="btn btn-success">아이디 찾기</button>
        </form>
</body>
</html>