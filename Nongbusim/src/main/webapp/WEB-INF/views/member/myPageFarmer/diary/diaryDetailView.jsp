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
<title>영농일지 상세보기</title>
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
 		grid-template-rows: repeat(3, 40px);
 		grid-template-areas:'a b '
							'c d'
							'e f';
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

 	.button-area {
 		display:flex;
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

	
	/* 이미지 슬라이드 */
	li> img {
		width: 640px;
    	height: 460px;
		object-fit: cover;
	}
	
	.slider{
    width: 640px;
    height: 480px;
    position: relative;
    margin: 0 auto;
    overflow: hidden; /* 현재 슬라이드 오른쪽에 위치한 나머지 슬라이드 들이 보이지 않도록 가림 */
	}
	.slider input[type=radio]{
	    display: none;
	}
	ul.imgs{
	    padding: 0;
	    margin: 0;
	    list-style: none;   
	   
	}
	ul.imgs li{
	    position: absolute;
	    left: 640px;
	    transition-delay: 1s; /* 새 슬라이드가 이동해 오는 동안 이전 슬라이드 이미지가 배경이 보이도록 지연 */
	
	    padding: 0;
	    margin: 0;
	}
		
	.bullets{
	    position: absolute;
	    left: 50%;
	    transform: translateX(-50%);
	    bottom: 20px;
	    z-index: 2;
	}
	.bullets label{
	    display: inline-block;
	    border-radius: 50%;
	    background-color: rgba(0,0,0,0.55);
	    width: 20px;
	    height: 20px;
	    cursor: pointer;
	}
	/* 현재 선택된 불릿 배경 흰색으로 구분 표시 */
	.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
	    background-color: #fff;
	}
	.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
	    background-color: #fff;
	}
	.slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
	    background-color: #fff;
	}
	.slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
	    background-color: #fff;
	}
		
	.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
	    left: 0;
	    transition: 0.5s;
	    z-index:1;
	}
	.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
	    left: 0;
	    transition: 0.5s;
	    z-index:1;
	}
	.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
	    left: 0;
	    transition: 0.5s;
	    z-index:1;
	}
	.slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
	    left: 0;
	    transition: 0.5s;
	    z-index:1;
	}
		
	
</style>


</head>
<body>
<jsp:include page="../myPageFarmerCommon.jsp" />
<div class="container">
	<main>
	
		<h3 "style=align:left;">🌿영농일지 보기</h3>	<br>	
		<hr style="width: 700px; color:lightgray">
		<div class="category-area" align="center" width="1100px">
			<div style="grid-area:a;">✔등록일</div>
			<div style="grid-area:b;"><input id="createDate" type="text" value="${diary.createDate }" disabled></div>	
			<div style="grid-area:c;">카테고리</div>
			<div style="grid-area:d;">${diary.diaryCategory }</div>
			<div style="grid-area:e;" >작성자</div>
			<div  style="grid-area:f;">${ diary.nickName }</div>
		</div><br><br>
		<div class="detail-area">
			<div><h3>일지내용</h3></div>
			<div style="background-color:#f5f5f5; width:100%; padding: 40px 20px;">${diary.diaryContent }</div><br><br><br>
					<c:if test="${not empty dAtList }" >
				<div><h3>업로드이미지</h3></div>
				<div class="slider">					
					<c:forEach var="item" items="${ dAtList}"  varStatus="status" >
						<c:choose>
							<c:when test="${status.count eq 1 }">
							 	<input type="radio" name="slide" id="slide${status.count}" checked>
						 	</c:when>
						 	<c:otherwise>
						 		<input type="radio" name="slide" id="slide${status.count}">
						 	</c:otherwise>	
						 </c:choose>
					</c:forEach>
					<ul id="imgholder" class="imgs">		 
					<c:forEach var="item" items="${ dAtList}"  varStatus="status" >	 
						  <li><img onclick="window.open(this.src);" src="${item.changeName }"></li>	
					</c:forEach>
					</ul>
					<div class="bullets">	
						<c:forEach var="item" items="${ dAtList}"  varStatus="status" >	 
							   <label for="slide${status.count}">&nbsp;</label>
						</c:forEach>	  		
					</div>
				</div>		 
			</c:if>
		</div>
	</form><br>	
	<div class="button-area">
		<form action="list.di" method="post" >
			<div><button>목록으로</button></div>
		</form>
		<form action="updateForm.di" method="post" >
			<input type="hidden" name="dno" value="${diary.diaryNo }">	
			<div><button>수정하기</button></div>
		</form>	
		<form action="delete.di" method="post" >
			<input type="hidden" name="diaryNo" value="${diary.diaryNo }">
			<input type="hidden" name="att" value="${dAtList}">
		</form>			
		<form action="delete.di" >
			<input type="hidden" name="diaryNo" value="${diary.diaryNo }">
			<input type="hidden" name="att" value="${dAtList}">		
			<button class="myButton">삭제하기</button>
		</form>
	</div>
	</main>
</div><br><br><br>
</body>
	
</html>
	
	
</html>