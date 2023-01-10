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
  
    <p>약관 동의</p>
    <p>회원가입을 위해서 아래 내용 약관을 읽고 동의해 주세요.</p>
    
    <div class="chk_group">
    
    <input type="checkbox" id="chk_all">전체 동의
    <br>
    <input type="checkbox" id="chk1" class="normal">회원 이용약관(필수)
    <button type="button" class="btn btn-secondary">자세히</button>
    <br>
    <input type="checkbox" id="chk2" class="normal">개인정보수집활용에 관한 동의(필수)
    <button type="button" class="btn btn-secondary">자세히</button>
    <br>
    <input type="checkbox" id="chk3" class="normal">고객 서비스 제공을 위한 동의(선택)
    <button type="button" class="btn btn-secondary">자세히</button>
    <br>
    <input type="checkbox" id="chk4" class="normal">고객 서비스 제공을 위한 업무위탁(필수)
    <button type="button" class="btn btn-secondary">자세히</button>
    
    </div>
    <br>

    	유의사항
    <ol>
        <ul>
            <li>필수 약관에 동의는 회원가입에 필수적이므로 이에 동의하셔야 이후 절차를 진행할 수 있습니다.</li>
            <li>수집에 동의하지 않으시는 경우 서비스에 제한이 있을 수 있습니다.</li>
        </ul>
    </ol>
    
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
          <label for="phone">전화번호  :</label>
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
      
      
      <script>
      
      	function validate(){
      		var memId = document.getElemetById('memId');
      		var memPwd = document.getElemetById('memPwd');
      		var chkPwd = document.getElemetById('chkPwd');
      		
      		// 아이디 유효성
      		var regExp = /^[a-zA-Z0-9]{5,15}$/;
            if(!regExp.test(memId.value)){
                alert('적합하지 않은 아이디입니다. 다시 입력해주세요.');
                memId.select();
                return false;
            }
            
            // 비밀번호 유효성
            regExp = /^[a-zA-z0-9]{6,18}$/;
            if(!regExp.test(memPwd.value)){
                alert('적합하지 않은 비밀번호입니다. 다시 입력해주세요.');
               	memPwd.select();
                return false;
            }
            
            // 비밀번호 일치여부
            var memPwd = document.getElementById('memPwd').value;
            var chkPwd = document.getElementById('chkPwd').value;
            
            if(memPwd != memPwd){
            	alert('비밀번호가 일치하지 않습니다.');
            	return false;
            }
      	}
      	
      	// 비밀번호 일치
      	function validate2(){
      		var memPwd = $('#memPwd').val();
      		var chkPwd = $('#chkPwd').val();
      		
      		if(memPwd != chkPwd){
      			alert('비밀번호가 일치하지 않습니다. 다시 입력하세요.');
      			return false;
      		}
      	}
      
      	// 아이디 중복체크
	    function idCheck(){
			$.ajax({
			          url : 'idCheck.me',
			          data : {"memId" : $('#memId').val()},
			          success : function(result){
				      if(result == 1){
				          alert('중복된 아이디입니다.');
				       } else {
				          alert('사용가능한 아이디입니다.');
				       }
			        }
			     })
			         
	    	}
	    			
	   		// 체크박스 전체 선택
	    	$(".chk_group").on("click", "#chk_all", function(){
	    		var checked = $(this).is(":checked");
	    		
	    		if(checked){
	    			$(this).parents(".chk_group").find('input').prop("checked", true);
	    		} else{
	    			$(this).parents(".chk_group").find('input').prop("checked", false);
	    		}
	    	});
	    	
	    	// 체크박스 개별 선택
	    	$(".chk_group").on("click", ".normal", function() {
	    	  var checked = $(this).is(":checked");

	    	  if (!checked) {
	    	  	$("#chk_all").prop("checked", false);
	    	  }
	    	});
      </script>
</body>
</html>