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
<style>
	.form-group{
		width: 30%;
	}
</style>
<body>
<!-- 메뉴바 -->
<jsp:include page="../../common/menubar.jsp"/>

<!-- 사이드바 -->
<br>
<h3>회원정보 수정</h3>
  <hr>
    <form action="" id="form-div" method="post">
      <h4>기본정보</h4>
		<div class="form-group">
          <label for="name">* 성명 :</label>
          <input type="text" class="form-control" name="name" value="${ sessionScope.loginUser.name }">
        </div>
        <div class="form-group">
            <label for="pwd">* 비밀번호 :</label>
            <input type="password" class="form-control" placeholder="비밀번호는 8~18자리의 영문, 숫자, 특수문자 3종류 이상 혼합해야 합니다." name="memPwd">
        </div>
        <div class="form-group">
            <label for="email">이메일 :</label>
            <input type="email" class="form-control" name="email" value="${ sessionScope.loginUser.email }">
        </div>
        <div class="form-group">
            <label for="nickName">닉네임 :</label>
            <input type="text" class="form-control" name="nickName" value="${ sessionScope.loginUser.nickName }">
        </div>
       <div class="form-group">
          <label for="phone">전화번호  :</label>
          <input type="text" class="form-control" value="${ sessionScope.loginUser.phone }" name="phone">
       </div>
	
      <h4>영농정보</h4>
      <hr>
      <div class="form-group">
        <label for="farmerCode">* 농부코드 :</label>
        <input type="text" class="form-control" value="${ sessionScope.loginUser.farmerCode }" name="farmerCode" readonly>
      </div>
      <div class="form-group">
        <label for="career">* 영농경력  :</label>
        <input type="text" class="form-control" value="${ sessionScope.loginUser.career }" name="career">
      </div>
        <button type="submit" class="btn btn-success">확인</button>
        <button type="button" class="btn btn-secondary">취소</button>
      </form>
</body>
</html>