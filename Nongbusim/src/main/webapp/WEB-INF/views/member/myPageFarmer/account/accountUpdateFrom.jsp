<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<jsp:include page="../myPageFarmerCommon.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
  
	.textBox{
		padding: 10px 10px;
		border: 10px 10px;
		margin: 20px 20px;
		background-color: lightgray;
		border-radius: 5%;
		align: left;
		width: 100%;
		height: 200%;

	
	}
	
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
	
	 textarea {	
	   width: 800px;
	   height: 200px;
  	}
  	
	 .selectText{
  	
  	 	margin-left: 20px;
  	
  	}
  	.img-area img {
		width: 200px;
		height: 150px;
		border-radius: 5%;
		object-fit: cover;
	}
		  
	.myButton{ 
			font-size: 10px;
 		    border: white;
 		    background-color: #FFA500;
     		color: maroon;
     		padding: 10px 15px;
     		text-align: center;
     		text-decoration: none;
     		display: inline-block;
     		border-radius: 5px;   	
    }
	
</style>
<body>
	<div class="boardArea" style="width:1000px; height:1000px; border:1px solid green; float:left"  >	
		<h1>🗓영농일지 수정</h1>
			<form action="update.di" id="enroll-form" method="post" enctype="multipart/form-data">
				<div class="outer" >
					<table id="diaryEnrollForm">		
						<tr>
							<td colspan="3">
								<div>✔등록일</div>
								<input name="createDate" type="date" value="${diary.createDate }">
							</td>	
						</tr>
						<tr>
							<td colpan="3">
								<div>✔카테고리</div>
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
							</td>	
						</tr>
					</table>
					<table id="img-area" align="center" width="1100px">		
						<!-- dAtList를 돌면서 수정전 파일이 존재할 경우 퍄일번호, 파일명을 input태그에 담아 넘김-->
						<c:if test="${ dAtList ne null}">
							<c:forEach var="at" items="${ dAtList}" varStatus="status">
								<input type="hidden" name="beforeFileNo${status.count}" value="${at.fileNo }">
								<input type="hidden" name="beforeFileName${status.count}" value="${at.originName }">
								<input type="hidden" name="beforeFileChangeName${status.count}" value="${at.changeName }">
								
								
								
							</c:forEach> 
						</c:if>
					
					
					
					
						<tr>
							<c:if test="${ dAtList ne null }">
								<c:forEach var="at" items="${ dAtList}" varStatus="status">
									<tr>
										<td>
											<div class="filebox">
										    	<input class="upload-name" id="upload-name${status.count}" value="${at.originName}" >
										    	<label for="reUpfile${status.count}">파일찾기</label> 
							
												<input type="file" name="reUpfiles" id="reUpfile${status.count}" onchange="loadImg(this,${status.count})">
										</div>
										</td>
										<td>
											<div class="img-area">
												<img width="150" height="120" id="contentImg${status.count}" src="${at.changeName }">
											</div>	
										</td>
									</tr>
								</c:forEach>
								<c:forEach var="at" begin="${fn:length(dAtList)+1}" end="3" varStatus="status">
									<tr>
										<td>
											<div class="filebox">
										    	<input class="upload-name" id="upload-name${fn:length(dAtList)+status.count}" value="첨부파일" placeholder="첨부파일" >
										    	<label for="reUpfile${fn:length(dAtList)+status.count}">파일찾기</label> 						
												<input type="file" name="reUpfiles" id="reUpfile${fn:length(dAtList)+status.count}" onchange="loadImg(this,${fn:length(dAtList)+status.count})">
											</div>
										</td>
										<td>
											<div class="img-area">
												<img width="150" height="120" id="contentImg${fn:length(dAtList)+status.count}" src="https://t3.ftcdn.net/jpg/04/34/72/82/240_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg">
											</td>
										</div>		
									</tr>								
								</c:forEach>
							</c:if>			
					</table>
					
					
					<table>
							<tr>
								<td>					
									<div class="diaryDetail">글 작성하기<br></div>		
								</td>			
							</tr>		
							<tr>
								<td>
									<div class="selectText"> 		
										<textarea id="textContent" name="diaryContent">${diary.diaryContent}</textarea>
									</div>					
								</td>			
							</tr>			
							<tr>
								<td>
									<div align="center">
									<button class="myButton" type="submit">수정하기</button>	
									<a class="myButton" href="javascript:history.back();">돌아가기</a>	
									</div>
								</td>			
							</tr>
							<tr>
								<td>
									<input type="hidden" name="nickName" value="${loginUser.nickName }" >
									<input type="hidden" name="memNo" value="${loginUser.memNo}" >
									<input type="hidden" name="diaryNo" value="${diary.diaryNo}" >
									
								</td>			
							</tr>
						</table>
					</div>			
			</form>
	</div>
	
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
</body>

</html>