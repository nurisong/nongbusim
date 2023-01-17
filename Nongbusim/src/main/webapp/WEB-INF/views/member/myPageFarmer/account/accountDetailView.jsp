<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../myPageFarmerCommon.jsp" />>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<style>

	
	body { 
		width: 1200px;
		margin: auto;
	
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
	
	#accountTable div {
		padding: 20px;
		width : 800px;
		height: 500px;
		background-color: #EAEAEA;
		border-radius: 5px;
	
	
	}
</style>


</head>
<body>
	<form action="updateForm.ac" method="post">
		<input type="hidden" name="memNo" value="${ loginUser.memNo }">
		<input type="hidden" name="ano" value="${ account.accountNo }">				
	<h1 align ="left">&nbsp;&nbsp;🗓영농일지 상세보기</h1>
	<br>
	<div class="outer"><br>	
		<table id="detail-area" align="center" width="1100px">
			<tr>
				<td  class="likeButton" >
					<div>유형
					</div>
				</td>
				<td>
					<div>
						${account.type }
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<div>✔등록일</div>
					<input id="createDate" type="text" value="${account.createDate }"disabled>
				</td>	
			</tr>
			<tr>
				<td  class="likeButton" >
					<div>카테고리
					</div>
				</td>
				<td>
					<div>
						${account.accountCategory }
					</div>
				</td>
			</tr>
			<tr>
				<td  class="likeButton" >
					<div>품목
					</div>
				</td>
				<td>
					<div>
						${account.goods }
					</div>
				</td>
			</tr>
			<tr>	
				<td  class="likeButton" >
					<div>
						금액
					</div>
				</td>
				<td>${account.amount }</td>
			</tr>
		</table>
		<table id="accountTable">
			<tr>	
				<td><h3>소비내역</h3></td>
			</tr>
			<tr>
				<td style="padding:30px" colspan="3">
					<div>
					${account.accountContent }
					</div>
				</td>
			</tr>
 			<c:if test="${not empty aAtList }" >
				<tr>
					<td><h3>업로드이미지</h3></td>
				</tr>
				<tr>			
					<c:forEach var="item" items="${ aAtList}">
						<td>
							<img width="180" height="150" onclick="window.open(this.src);" src="${item.changeName }">					
						</td>
					</c:forEach>
				</tr>
			</c:if>
		</table>
		
		<br>
		<div align="center">
			<a href="${pageContext.request.contextPath }/list.ac" class= "likeButton">목록으로</a><br><br>	
			<button class="myButton">수정하기</button>
		</form>	
		<form action="delete.ac" >
			<input type="hidden" name="accountNo" value="${account.accountNo }">
			<button class="myButton">삭제하기</button>
		</form>
		</div>	
	</div><br><br><br>
</body>
	
</html>