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
<jsp:include page="../common/menubar.jsp"/>

<br>
<h3>회원가입</h3>
  <hr>
    <form action="farmerInsert.me" id="form-div" method="post">
      <h4>기본정보</h4>
        <div class="form-group">
          <label for="name">* 성명 :</label>
          <input type="text" class="form-control" name="name">
        </div>
        <div class="form-group">
            <label for="id">* 아이디 :</label>
            <input type="text" class="form-control" placeholder="아이디는 특수문자 제외 5자 이상 12자리 이하로 입력하여 주세요." name="memId">
            <button type="button" class="btn btn-success" onclick="idCheck();">중복확인</button>
        </div>
        <div class="form-group">
            <label for="pwd">* 비밀번호 :</label>
            <input type="password" class="form-control" placeholder="비밀번호는 8~18자리의 영문, 숫자, 특수문자 3종류 이상 혼합해야 합니다." name="memPwd">
        </div>
          <div class="form-group">
            <label for="pwdChk">* 비밀번호 확인 :</label>
            <input type="password" class="form-control" placeholder="비밀번호는 8~18자리의 영문, 숫자, 특수문자 3종류 이상 혼합해야 합니다." name="memPwdChk">
        </div>
        <div class="form-group">
          <label for="gender">* 성별 :</label>
          <input type="radio" id="Female" value="F" name="gender">여자
          <input type="radio" id="Male" value="M" name="gender">남자
        </div>
        <div class="form-group">
            <label for="email">이메일 :</label>
            <input type="email" class="form-control" name="email">
        </div>
        <div class="form-group">
            <label for="nickName">닉네임 :</label>
            <input type="text" class="form-control" name="nickName">
        </div>
        <div class="form-group">
          <label for="phone">* 전화번호  :</label>
          <input type="text" class="form-control" placeholder="-도 입력하세요" name="phone">
      </div>

      <h4>영농정보</h4>
      <hr>
      <div class="form-group">
        <label for="farmerCode">* 농부코드 :</label>
        <input type="text" class="form-control" name="farmerCode">
      </div>
      <div class="form-group">
        <label for="career">* 영농경력  :</label>
        <input type="text" class="form-control" placeholder="년월일을 적어주세요" name="career">
      </div>
        <button type="submit" class="btn btn-success">확인</button>
        <button type="button" class="btn btn-secondary">취소</button>
      </form>
</body>
</html>