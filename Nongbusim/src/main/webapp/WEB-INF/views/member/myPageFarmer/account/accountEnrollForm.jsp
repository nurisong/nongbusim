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
	   width: 50%;
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
		<h1>입출금 장부등록</h1>
			<form action="" id="enroll-form" method="post" enctype="multipart/form-data">
				<div class="outer" >
					<table id="accountEnrollForm">
						<tr>
							<td colpan="3">
								<div>✔유형</div>
								
								<input type="radio" id="income" name="income" checked> 수입
								<input type="radio" id="outcome" name="outcome" > 지출
							</td>	
						</tr>	
						<tr>
							<td colpan="3">
								<div>✔일자</div>
								<input type="date" name="transferDate" required>
							</td>	
						</tr>	
						<tr>
							<td colpan="3">
								<div>✔작성일</div>
								<input type="date" name="enrollDate">
							</td>	
						</tr>	
						<tr>
							<td colpan="3">
								<div>✔분류</div>
								<input type="text" name="category" required>
							</td>	
						</tr>	
						<tr>
							<td colpan="3">
								<div>✔품목</div>
								<input type="text" name="goods" required>
							</td>	
						</tr>	
						<tr>
							<td colpan="3">
								<div>✔금액</div>
								<input type="text" id="number" name="amount" required>
							</td>	
						</tr>	
						
						<tr>
							<td>					
								<div class="accountDetail">글 작성하기<br>		
							</td>			
						</tr>		
						<tr>
							<td>
								<div class="selectText"> 		
									<textarea id="textContent" name="textContent" type="text"></textarea>
								</div>					
							</td>			
						</tr>	
					</table>		
					<table>
						<tr>
							<td>
								<div class="accountDetail">🎞사진 등록하기<br>
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
					<div align="center">
									<button class="myButton" type="submit">등록하기</button>	
									<a class="myButton" href="javascript:history.back();">돌아가기</a>	
					</div>
					<input type="hidden" name="userNo" value="" >
							
			</form>
	</div>
	
	<script>
	
	 // input id=number일 경우 숫자 세자리마다 콤마 넣어주기
		const input = document.querySelector('#number');     
		input.addEventListener('keyup', function(e) { 
		    let value = e.target.value;                 
			value = Number(value.replaceAll(',', ''));
			if(isNaN(value)) {         //NaN인지 판별
			    input.value = 0;   
			 } else {                   //NaN이 아닌 경우
			    const formatValue = value.toLocaleString('ko-KR');
			    input.value = formatValue;
			 }
		}); 
	
	
	
	</script>
	
	
	
</body>
</body>
</html>