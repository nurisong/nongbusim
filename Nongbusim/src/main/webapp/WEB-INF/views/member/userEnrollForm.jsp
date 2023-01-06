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
<title>일반사용자 회원가입</title>
    <style>
      .form-group{
        width: 30%;
      }
    </style>
</head>
<body>

<!-- 메뉴바 -->
<jsp:include page="../common/menubar.jsp"/>

<br>
<h3>회원가입</h3>
  <hr>
    <form action="userInsert.me" id="form-div" method="post">
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
            <label for="password">* 비밀번호 확인 :</label>
            <input type="password" class="form-control" placeholder="비밀번호는 8~18자리의 영문, 숫자, 특수문자 3종류 이상 혼합해야 합니다." name="memPwdChk">
        </div>
        <div class="form-group">
          <label for="pwd"> 성별 :</label>
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
          <label for="phone">전화번호  :</label>
          <input type="text" class="form-control" placeholder="-도 입력하세요" name="phone">
      </div>
        <button type="submit" class="btn btn-success">확인</button>
        <button type="button" class="btn btn-secondary">취소</button>
      </form>
      
      
      <script>
	      function idCheck(){
	      	$memId = $('#form-div input[name=memId]');
	      			
					$.ajax({
			            url : 'idCheck.me',
			            data : {checkId : $('#memId').val()},
			            success : function(result){
				           if(result == 'NNNNN'){
				            	alert('이미 존재하거나 탈퇴한 회원의 아이디입니다.');
				            	$memId.focus();
				           } else {
				            	alert('사용가능한 아이디입니다.');
				           }
			            },
			            error : function(){
			            	console.log("비동기식 요청 실패");
			            },
			            	complete : function(){
			            	console.log('아이디 중복체크');
			            }
			         })
			         
	    	}
      </script>
</body>
</html>