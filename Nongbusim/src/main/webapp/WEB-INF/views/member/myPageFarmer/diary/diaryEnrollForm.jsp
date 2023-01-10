<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../../../common/menubar.jsp" %>
<%@ include file="../myPageFarmerCommon.jsp" %>
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
		<h1>🗓영농일지 등록</h1>
			<form action="insert.di" id="enroll-form" method="post" enctype="multipart/form-data">
				<div class="outer" >
					<table id="diaryEnrollForm">
	<!-- 								
						<c:choose>							
							<c:when test="${not empty param.endDate}">		
								<input type="date" required value="${param.endDate }">
							</c:when>
							<c:otherwise>
								<input type="date" required value="${param.startDate }">
							</c:otherwise>
						</c:choose>
 -->						
						<tr>
							<td colpan="3">
								<div>✔등록일</div>
								<input id="createDate" type="date" disabled>
							</td>	
						</tr>
						<tr>
							<td colpan="3">
								<div>✔카테고리</div>
										<select id="enrolledCategory">		
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
								
								카테고리 신규등록: <input id="newCategory" type="text" disabled>
							</td>	
						</tr>
						
						<tr>
							<td>
								<div class="diaryDetail">🎞사진 등록하기<br>
							</td>
						</tr>
						<tr>
							<td>
								<div class="filebox">
								    <input class="upload-name"  id="upload-name1" value="첨부파일" placeholder="첨부파일" >
								    <label for="file1">파일찾기</label> 
								    <input type="file" name="file1" id="file1" onchange="loadImg(this,1);">
								</div>
							</td>
							<td>
								<div class="img-area">
									<img src=""  class="contentImg" id="contentImg1">
								</div>
							</td>
						</tr>	
				
						<tr>
							<td>		
								<div class="filebox">
								    <input class="upload-name"  id="upload-name2"  value="첨부파일" placeholder="첨부파일" ">
								    <label for="file2">파일찾기</label> 
								    <input type="file" name="file2" id="file2" onchange="loadImg(this,2);">
								</div>
							<td>
									<div class="img-area">
									<img src="" class="contentImg" id="contentImg2">
									</div>
							</td>
									
						</tr>			
						<tr>
							<td>
								<div class="filebox">
								    <input class="upload-name" id="upload-name3" value="첨부파일" placeholder="첨부파일" >
								    <label for="file3">파일찾기</label> 
								    <input type="file" name="file3"  id="file3" onchange="loadImg(this,3);">
								</div>
								<td>
									<div class="img-area">
									<img src="" class="contentImg" id="contentImg3">
									</div>
								</td>	
							</td>			
						</tr>
					</table>
					<table>
							<tr>
								<td>					
									<div class="diaryDetail">글 작성하기<br>		
								</td>			
							</tr>		
							<tr>
								<td>
									<div class="selectText"> 		
										<textarea id="textContent" name="diaryContent" type="text"></textarea>
									</div>					
								</td>			
							</tr>			
							<tr>
								<td>
									<div align="center">
									<button class="myButton" type="submit">등록하기</button>	
									<a class="myButton" href="javascript:history.back();">돌아가기</a>	
									</div>
								</td>			
							</tr>
							<tr>
								<td>
									<input type="hidden" name="nickname" value="" >
									
								</td>			
							</tr>
						</table>
					</div>			
			</form>
	</div>
	
	<script>
		// "등록일(id=enrollDate)" 날짜를 현재날짜로 설정
			document.getElementById('enrollDate').valueAsDate = new Date();
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
		

	</script>
</body>

</html>