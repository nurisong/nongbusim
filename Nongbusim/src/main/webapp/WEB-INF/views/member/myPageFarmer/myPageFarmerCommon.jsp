<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="https://kit.fontawesome.com/aa839e973e.js" crossorigin="anonymous"></script>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기리스트</title>
<style>

	#myPage { 
			width: 1200px;
			margin: auto;
		}
	
	.outer {
		margin : auto;
	}
	
	
   * {
	  box-sizing: border-box;
	}
	
	.menuButton{ 
	    background-color: #bed655;
   		color: maroon;
   		width: 200px;
   		padding: 5px 10px;
   		text-align: center;
   		text-decoration: none;
   		display: inline-block;
   		cursor: pointer;
   		border: none;
   		
    }
    
    .menubutton:hover {background-color: lightgreen}


	.menubutton:active {
	
	  background-color: #3e8e41;	
	  box-shadow: 0 5px #666;	
	  transform: translateY(4px);	
	}
    
</style>
</head>
<body> 
<!-- 메뉴바 -->
<jsp:include page="../../common/menubar.jsp" />

<div id="myPage">
	<h3>마이페이지</h3>
	<div class="menuArea"  style="width:200px; height:150px; border:1px solid red; float:left;">
		<a class="menuButton" href="farmerMyBoardList.me">내가 작성한 게시글</a><br>
		<a class="menuButton" href="farmerMyProgramList.me">내가 작성한 프로그램</a><br>
		<a class="menuButton" href="updateFarmerForm.me">회원정보 수정</a><br>
		<a class="menuButton" href="calender.di">영농일지</a><br>
		<a class="menuButton" href="calender.ac">농작물 입출금</a><br>
		<a class="menuButton">농장정보등록</a>

	</div>
    
    
</div>
</body>
</html>


</body>
</html>