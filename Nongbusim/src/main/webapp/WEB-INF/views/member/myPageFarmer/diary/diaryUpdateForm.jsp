<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>영농일지 수정</title>	
</head>

<style>
  .container{
		padding-left:25%;
		margin: 0px;
	}
	
	main {
		margin : auto;
		display: block;
		box-sizing: border-box;
		width: 800px;
		font-family:Pretendard-Regular;


	}
		.category-area{
		display: grid;
		grid-template-columns: 100px 300px;
 		grid-template-rows: repeat(2, 40px);
 		grid-template-areas:'a b '
							'c d';
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
	
	.myAButton {
		padding: 3px 10px;
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
		<h3 "style=align:left;" >🌿영농일지 수정</h3><br>
			<form action="update.di" id="enroll-form" method="post" enctype="multipart/form-data">
				<div class="category-area" align="center" width="1100px">
					<div style="grid-area:a;">✔등록일</div>
					<div style="grid-area:b;"><input name="createDate" type="date" value="${diary.createDate }"></div>
					<div style="grid-area:c;">✔카테고리</div>
					<div style="grid-area:d;">
						<select id="diaryCategory" name="diaryCategory">		
							<c:choose>
								<%-- db에서 select해온 categroyList가 비어있지 않다면 반복문을 통해 select태그를 생성--%>
								<c:when test="${ not empty categoryList }">
									<c:forEach var="category" items="${categoryList }">
										<option>${ category.diaryCategory }</option>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<option value="noCategory">등록된 카테고리가 없습니다.</option>
								</c:otherwise>
							</c:choose>
							<option id="enrollNew" name="enrollNew" value="enrollNew">카테고리 신규입력</option>									
						</select>
						<input type="hidden" id="newCategory" name="newCategory">
					</div>
				</div><br><br>	
				<h3>📸사진 수정하기<br></h3><br>
				<!-- dAtList를 돌면서 수정전 파일이 존재할 경우 퍄일번호, 파일명을 input태그에 담아 넘김-->
				<c:if test="${ dAtList ne null}">
					<c:forEach var="at" items="${ dAtList}" varStatus="status">
						<input type="hidden" name="beforeFileNo${status.count}" value="${at.fileNo }">
						<input type="hidden" name="beforeFileName${status.count}" value="${at.originName }">
						<input type="hidden" name="beforeFileChangeName${status.count}" value="${at.changeName }">
					</c:forEach> 
				</c:if>
			
				<c:if test="${ dAtList ne null }">
					<c:forEach var="at" items="${ dAtList}" varStatus="status">
						<div class="file-area" stype="width:100%; height: 100%;">		
							<div class="filebox">
						    	<input class="upload-name" id="upload-name${status.count}" value="${at.originName}" >
						    	<label for="reUpfile${status.count}">파일찾기</label>		
								<input type="file" name="reUpfiles" id="reUpfile${status.count}" onchange="loadImg(this,${status.count})">
							</div>
							<div class="img-area">
								<img width="150" height="120" id="contentImg${status.count}" src="${at.changeName }">
							</div>	
						</div>		
					</c:forEach>
					<c:forEach var="at" begin="${fn:length(dAtList)+1}" end="3" varStatus="status">
						<div class="file-area" stype="width:100%; height: 100%;">			
							<div class="filebox">
						    	<input class="upload-name" id="upload-name${fn:length(dAtList)+status.count}" value="첨부파일" placeholder="첨부파일" >
						    	<label for="reUpfile${fn:length(dAtList)+status.count}">파일찾기</label> 						
								<input type="file" name="reUpfiles" id="reUpfile${fn:length(dAtList)+status.count}" onchange="loadImg(this,${fn:length(dAtList)+status.count})">
							</div>
							<div class="img-area">
								<img width="150" height="120" id="contentImg${fn:length(dAtList)+status.count}" src="https://t3.ftcdn.net/jpg/04/34/72/82/240_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg">
							</div>
						</div>		
					</c:forEach>
				</c:if>			
				<h3>🖌글 작성하기<br></h3><br>
				<div class="content-area">			
					<div> 		
						<textarea name="diaryContent">${diary.diaryContent}</textarea>
					</div>					
				</div>
				<div class="button-area">
					<button class="myButton" id="update">수정하기</button>	
					<a class="myAButton" href="javascript:history.back();">돌아가기</a>	
				</div>
				<input type="hidden" name="nickName" value="${loginUser.nickName }" >
				<input type="hidden" name="memNo" value="${loginUser.memNo}" >
				<input type="hidden" name="diaryNo" value="${diary.diaryNo}" >
				</form>
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
						 $('#titleImg').attr('src', 'https://t4.ftcdn.net/jpg/05/17/53/57/240_F_517535712_q7f9QC9X6TQxWi6xYZZbMmw5cnLMr279.jpg');
						 break;
					 case 2: 
						 $('#contentImg1').attr('src', 'https://t4.ftcdn.net/jpg/05/17/53/57/240_F_517535712_q7f9QC9X6TQxWi6xYZZbMmw5cnLMr279.jpg');
						 break;
					 case 3: 
						 $('#contentImg2').attr('src', 'https://t4.ftcdn.net/jpg/05/17/53/57/240_F_517535712_q7f9QC9X6TQxWi6xYZZbMmw5cnLMr279.jpg');
						 break;
					 case 4: 
						 $('#contentImg3').attr('src', 'https://t4.ftcdn.net/jpg/05/17/53/57/240_F_517535712_q7f9QC9X6TQxWi6xYZZbMmw5cnLMr279.jpg');
						 break;
				 } 
			}	
		}			
	

		
		// file 사진이 변경되면 input태그에 변경된 파일명을 넣어주는 함수
		$("#reUpfile1").on('change',function(){
			  var fileName1 = $("#reUpfile1").val();
			  $("#upload-name1").val(fileName1);
		});
		
		$("#reUpfile2").on('change',function(){
			  var fileName2 = $("#reUpfile2").val();
			  $("#upload-name2").val(fileName2);
		});
		
		$("#reUpfile3").on('change',function(){
			  var fileName3 = $("#reUpfile3").val();
			  $("#upload-name3").val(fileName3);
			  

	});	
			
		
		
		
	//  "카테고리 신규입력" 클릭시  input:hidden 상태 바꾸기
	// 기타 카테고리 클릭시 input:hidden으로 되돌리기
	$(function(){
	
		$('#diaryCategory').change(function(){
			if($(this).val()=="enrollNew"){
				$("#newCategory").attr("type", "text");
							
			} else {
				$("#newCategory").attr("type", "hidden");
					
			}
		})		
	}); 
	
/* 	// createDate에 오늘날짜를 넣기 위한 구문
	document.getElementById('createDate').valueAsDate = new Date();
	
 */	
</script>

</html>