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
<title>Insert title here</title>
<title>게시글 상세보기</title>
<style>

	
	body { 
		width: 1200px;
		margin: auto;
	
	}

	.container{
		padding-left:25%;
	}

	.outer {
		border: 1px dashed gray;
		margin : auto 10px;
		padding: 30px;
	

	}


	.list-area{
		text-align :center; 
		border : 1px solid white;
	}
	
	.list-area>tbody>tr:hover{
		cursor : pointer;
		background: darkgreen
	}
	
	.certExp>div {	
		align: left;
		display: inline-block;
		margin 10px;
		border: 1px solid red;

	}
	.certDetail {
	
	}
	.selectPhoto{
		align :center;			
		display: inline-block;
		margin-right: 10px;
		border: 1px solid red;
		
	}

	.likeButton {
		display: inline-block;
        padding: 10px 10px;
        background-color:aliceblue;		
        text-align: center;
        cursor: pointer;
        margin-right: 20px;
        border-radius: 5px;
        width: 150px;
        font-weight: bolder;
		
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
	
	 th, td {

	padding-top: 10px;
    padding-bottom: 20px;
    padding-right: 20px;
    padding-left: 20px;
    }
    
    img {
    	border-radius: 5px;
    
    }
    	
    	
   .myButton{ 
 		    background-color: #FFA500;
     		color: maroon;
     		padding: 5px 10px;
     		text-align: center;
     		text-decoration: none;
     		display: inline-block;
     		border-radius: 5px;
   			border : none;
    }
    .likeButton {
        padding: 10px 10px;
        background-color:aliceblue;	
        text-align: center;
        cursor: pointer;
        margin-right: 20px;
        border-radius: 5px;

	}
	#likeIcon{

	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	
	}
	
	.outer img{
		 width: 250px;
        height: 150px;
        border-radius: 5px;		
		object-fit: cover;
	
	}
	
	#likeTable td{
		
		padding: 5px 5px 5px 5px
	
	}
	
	#reviewTable div {
		padding: 20px;
		width : 800px;
		height: 500px;
		background-color: #EAEAEA;
		border-radius: 5px;
	
	
	}
</style>


</head>
<body>
<jsp:include page="../myPageFarmerCommon.jsp" />
<div class="container">
	<form action="updateForm.di" method="post">
		<input type="hidden" name="memNo" value="${ loginUser.memNo }">
		<input type="hidden" name="dno" value="${ diary.diaryNo }">				
	<h1 align ="left">&nbsp;&nbsp;🗓영농일지 상세보기</h1>
	<br>
	<div class="outer"><br>		<table id="detail-area" align="center" width="1100px">
			<tr>
				<td colspan="3">
					<div>✔등록일</div>
					<input id="createDate" type="text" value="${diary.createDate }"disabled>
				</td>	
			</tr>
				<tr>
				<td  class="likeButton" >
					<div>카테고리
					</div>
				</td>
				<td>
					<div>
						${diary.diaryCategory }
					</div>
				</td>
			</tr>
			<tr>	
				<td  class="likeButton" >
					<div>
						등록일 
					</div>
				</td>
				<td>${diary.createDate }</td>
			</tr>
			<tr>
				<td  class="likeButton" >작성자</td>
				<td>${ diary.nickName }</td>
			</tr>
		</table>
		<table id="reviewTable">
			<tr>	
				<td><h3>일지내용</h3></td>
			</tr>
			<tr>
				<td style="padding:30px" colspan="3">
					<div>
					${diary.diaryContent }
					</div>
				</td>
			</tr>
 			<c:if test="${not empty dAtList }" >
				<tr>
					<td><h3>업로드이미지</h3></td>
				</tr>
				<tr>			
					<c:forEach var="item" items="${ dAtList}">
						<td>
							<img width="180" height="150" onclick="window.open(this.src);" src="${item.changeName }">					
						</td>
					</c:forEach>
				</tr>
			</c:if>
		</table>
		
		<br>
		<div align="center">
			<a href="${pageContext.request.contextPath }/list.di" class= "likeButton">목록으로</a><br><br>	
			<button class="myButton">수정하기</button>
		</form>	
		<form action="delete.di" >
			<input type="hidden" name="diaryNo" value="${diary.diaryNo }">
			<button class="myButton">삭제하기</button>
		</form>
		</div>	
	</div><br><br><br>
</body>
	
</html>