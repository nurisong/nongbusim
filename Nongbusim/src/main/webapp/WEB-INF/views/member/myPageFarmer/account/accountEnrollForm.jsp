<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>입출금장부  등록하기</title>
</head>

<style>
	.container{
		padding-left:25%;
		margin: 0px;
	}
	
	main {
		margin : auto;


	}
		.category-area{
		display: grid;
		grid-template-columns: 100px 300px;
 		grid-template-rows: repeat(5, 40px);
 		grid-template-areas:'a b '
							'c d'
							'e f'
							'g h'
							'i j';
		background-color: #f1f8e9;
		padding : 20px 20px;
	}
	.category-area > div{
		text-align:left;
	}
	
	.detail-area {
		padding: 20px 0px 0px 0px
	}

	
	.textBox{
		padding: 30px 30px;
		border: 10px 10px;
		margin: 20px 20px;
		background-color: lightgray;
		border-radius: 5px;
		align: left;
		width: 200%;
		height: 300%

	
	}

	textArea {
		width: 100%;
		height: 200px;
		padding: 10px;
		box-sizing: border-box;
		border: solid 2px green;
		border-radius: 5px;
		font-size: 16px;
		resize: both;
		}
	}
 	.button-area {
 		display:inline-block;
 		justify-content:center; 		

 	}
	
	 button, .button-area a {	 
	 	margin: 5px;
	    width: 80px;
	    heigh: 30px;
		font-size: 15px;
		color: white;
	    border: white;
	    background-color: #388e3c;
   		text-decoration: none;
   		text-align: center;
   		border-radius: 5px;   
 		
	}
	
	.file-area, .filebox {
		display:flex;
		justify-content: space-around;
		align-items: center;
		margin: 20px 10px;
	}	.container{
		padding-left:25%;
		margin: 0px;
	}
	
	main {
		margin : auto;


	}
		.category-area{
		display: grid;
		grid-template-columns: 100px 300px;
 		grid-template-rows: repeat(5, 40px);
 		grid-template-areas:'a b '
							'c d'
							'e f'
							'g h'
							'i j';
		background-color: #f1f8e9;
		padding : 20px 20px;
	}
	.category-area > div{
		text-align:left;
	}
	
	.detail-area {
		padding: 20px 0px 0px 0px
	}

	
	.textBox{
		padding: 30px 30px;
		border: 10px 10px;
		margin: 20px 20px;
		background-color: lightgray;
		border-radius: 5px;
		align: left;
		width: 200%;
		height: 300%

	
	}

	textArea {
		width: 100%;
		height: 200px;
		padding: 10px;
		box-sizing: border-box;
		border: solid 2px green;
		border-radius: 5px;
		font-size: 16px;
		resize: both;
		}
	}
 	.button-area {
 		display:inline-block;
 		justify-content:center; 		

 	}
	
	 button, .button-area a {	 
	 	margin: 5px;
	    width: 80px;
	    heigh: 30px;
		font-size: 15px;
		color: white;
	    border: white;
	    background-color: #388e3c;
   		text-decoration: none;
   		text-align: center;
   		border-radius: 5px;   
 		
	}
	
	.file-area, .filebox {
		display:flex;
		justify-content: space-around;
		align-items: center;
		margin: 20px 10px;
	}
	
	
/* 	----------------------------------------------- */
	
	
	
	
	.filebox .upload-name {
	
	   display: inline-block;
	   height: 40px;
	   padding: 0 10px;
	   vertical-align: middle;
	   border: 1px solid #dddddd;
	   width: 78%;
	   color: #999999;
	}
	
	.filebox label {
	    display: inline-block;
	    padding: 5px 10px;
	    color: #fff;
	    vertical-align: middle;
	    background-color: #999999;
	    cursor: pointer;
	    height: 40px;
	    width: 100px;
	    margin: 10px;
	    border-radius: 3%;
	}
	.filebox input[type="file"] {
	    position: absolute;
	    width: 0;
	    height: 0;
	    padding: 0;
	    overflow: hidden;
	    border: 0;
	}

  	.img-area img {
		width: 200px;
		height: 150px;
		border-radius: 5%;
		object-fit: cover;
	}
		  

	
	
</style>
<body>
<jsp:include page="../myPageFarmerCommon.jsp" />
<div class="container">
	<main>	
		<h3 "style=align:left;">🌱입출금장부 등록</h3>	<br>		
		<form action="insert.ac" id="enroll-form" method="post" enctype="multipart/form-data">
			<div class="category-area" align="center" width="1100px">
				<div style="grid-area:a;">✔등록일</div>
				<div style="grid-area:b;"><input id="createDate" name="createDate" type="date"></div>
				<div style="grid-area:c;">✔유형</div>
				
				<div style="grid-area:d;">
					<input type="radio" name="type" id="income" value="I" required><label for="income">수입</label>								
					<input type="radio" name="type" id="outcome" value="O"><label for="outcome">지출</label>									
				</div>	
				<div style="grid-area:e;" >✔카테고리</div>
				<div  style="grid-area:f;">
					<div style="display:inline-block;">
						<select id="accountCategory" name="accountCategory">		
							<c:choose>
							<%-- db에서 select해온 categroyList가 비어있지 않다면 반복문을 통해 select태그를 생성--%>
								<c:when test="${ not empty catAndGoods}">
									<option value="selectAll" selected>전체</option>				
									<c:forEach var="account" items="${catAndGoods}">
										<c:if test="${account.accountCategory ne ' '}">
											<option>${ account.accountCategory }</option>
										</c:if>
									</c:forEach>				
								</c:when>
								<c:otherwise>
									<option value="noCategory">등록된 카테고리가 없습니다.</option>
								</c:otherwise>
							</c:choose>
							<option id="enrollNewCategory" name="enrollNewCategory" value="newCategory">카테고리 신규입력</option>									
						</select>
					</div>
					<div>
						<input type="hidden" id="newCategory" name="newCategory">
					</div>
				</div>				
				<div  style="grid-area:g;" >✔품목</div>
				<div  style="grid-area:h;">
					<select id="goods" name="goods">		
						<c:choose>
						<%-- db에서 select해온 items(카테고리&품목이 담긴 hashmap)가 비어있지 않다면 반복문을 통해 select태그를 생성--%>
							<c:when test="${ not empty catAndGoods}">
								<option value="selectAll" selected>전체</option>				
								<c:forEach var="account" items="${catAndGoods}">
									<c:if test="${account.goods  ne ' '}">
										<option>${account.goods }</option>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<option value="noGoods">등록된 품목이 없습니다.</option>
							</c:otherwise>
						</c:choose>
							<option id="enrollNewGoods" name="enrollNewGoods" value="newGoods">품목 신규입력</option>									
							<input type="hidden" id="newGoods" name="newGoods">
						</select>
				</div>
			
				<div  style="grid-area:i;">✔금액</div>
				<div style="grid-area:j;"><input id="amount" name="amount" type="text" maxlength="20" onkeyup="inputNumberFormat(this);" placeholder="숫자만 입력해주세요" /></div>			
			</div>	
			<br><br>
			<h3>📸사진 등록하기<br></h3><br>
			<div class="file-area" stype="width:100%; height: 100%;">
				<div class="filebox">
				    <input class="upload-name"  id="upload-name1" value="첨부파일" placeholder="첨부파일" >
				    <label for="file1">파일찾기</label> 
				    <input type="file" name="upfiles" id="file1" onchange="loadImg(this,1);">
				</div>
				<div class="img-area">
						<img src="https://fl-1.cdn.flockler.com/embed/no-image.svg"  class="contentImg" id="contentImg1">
				</div>
			</div>
			<div class="file-area">	
				<div class="filebox">
				    <input class="upload-name"  id="upload-name2"  value="첨부파일" placeholder="첨부파일">
				    <label for="file2">파일찾기</label> 
				    <input type="file" name="upfiles" id="file2" onchange="loadImg(this,2);">
				</div>
				<div class="img-area">
				<img src="https://fl-1.cdn.flockler.com/embed/no-image.svg" class="contentImg" id="contentImg2">
				</div>
			</div>
			<div class="file-area">	
				<div class="filebox">
				    <input class="upload-name" id="upload-name3" value="첨부파일" placeholder="첨부파일" >
				    <label for="file3">파일찾기</label> 
				    <input type="file" name="upfiles"  id="file3" onchange="loadImg(this,3);">
				</div>
				<div class="img-area">
					<img src="https://fl-1.cdn.flockler.com/embed/no-image.svg" class="contentImg" id="contentImg3">
				</div>
			</div>
			<br><br>	
			<h3>🖌글 작성하기<br></h3><br>
			<div class="content-area">
				<div> 		
					<textarea name="accountContent"></textarea>
				</div>	
			</div>					
			<div class="button-area">
				<div><button class="myButton" id="enroll">등록하기</button></div>	
				<div><a style="padding:5px;"href="javascript:history.back();">돌아가기</a></div>	
			</div>
			
			<input type="hidden" name="nickName" value="${loginUser.nickName }" >
			<input type="hidden" name="memNo" value="${loginUser.memNo}" >									
	</form>
	</div>	
</main>
</div>
</body>
	<script>
	function loadImg(inputFile, num){
				
				
				if(inputFile.files.length ==1){
				
					 var reader = new FileReader();
					
					reader.readAsDataURL(inputFile.files[0]);
					 
					 reader.onload = function(e){
						 switch(num){
						case 1: 
							 $('#contentImg1').attr('src', e.target.result);
							 break;
						 case 2: 
							 $('#contentImg2').attr('src', e.target.result);
							 break;
						 case 3: 
							 $('#contentImg3').attr('src', e.target.result);
							 break;
						 
					 	}
						
					 }
				  } else {
					 switch(num){
					 case 1: 
						 $('#titleImg').attr('src', 'https://fl-1.cdn.flockler.com/embed/no-image.svg');
						 break;
					 case 2: 
						 $('#contentImg1').attr('src', 'https://fl-1.cdn.flockler.com/embed/no-image.svg');
						 break;
					 case 3: 
						 $('#contentImg2').attr('src', 'https://fl-1.cdn.flockler.com/embed/no-image.svg');
						 break;
					 case 4: 
						 $('#contentImg3').attr('src', 'https://fl-1.cdn.flockler.com/embed/no-image.svg');
						 break;
				 } 
				 
			}
	
		}			
	

		
		
		$("#file1").on('change',function(){
			  var fileName1 = $("#file1").val();
			  $("#upload-name1").val(fileName1);
		});
		
		$("#file2").on('change',function(){
			  var fileName2 = $("#file2").val();
			  $("#upload-name2").val(fileName2);
		});
		
		$("#file3").on('change',function(){
			  var fileName3 = $("#file3").val();
			  $("#upload-name3").val(fileName3);
			  

	});	
		
		

	$(function(){
	
		$('#accountCategory').change(function(){
			if($(this).val()=="newCategory"){
				$("#newCategory").attr("type", "text");
							
			} else {
				$("#newCategory").attr("type", "hidden");
					
			}
		})		
	
		$('#goods').change(function(){
			if($(this).val()=="newGoods"){
				$("#newGoods").attr("type", "text");
							
			} else {
				$("#newGoods").attr("type", "hidden");
					
			}
		});
		

	}); 
	
	
	// createDate에 오늘날짜를 넣기 위한 구문
	document.getElementById('createDate').valueAsDate = new Date();
	
	
	// 금액 input태그에 자동 콤마 생성
	function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    } 
    
    function inputNumberFormat(obj) {
        obj.value = comma(uncomma(obj.value));
    }
    
    function inputOnlyNumberFormat(obj) {
        obj.value = onlynumber(uncomma(obj.value));
    }
    
    function onlynumber(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
	}
	
// 등록하기 버튼을 누를 시, '000,000,000'으로된 amount input요소의 format을 숫자로 바꾼 후 submit 해주는 이벤트 핸들러
    $('#enroll').click(function(){
		if($('input:radio').is(':checked')){
	    	$('#amount').val(Number(uncomma($('#amount').val())));	    	
	    	$('#enroll-form').submit();
		} else {
			alert('수입/지출 여부를 선택해주세요');
		}   	

    });
   
    
    
</script>



</html>