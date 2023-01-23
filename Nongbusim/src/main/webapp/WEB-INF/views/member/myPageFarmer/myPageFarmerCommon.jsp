<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/aa839e973e.js" crossorigin="anonymous"></script>   
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@600;700&display=swap" rel="stylesheet">
</head>
<style>

	 body{
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
	}
	
	#myPage { 
		padding: 20px 0px 0px 0px;		
		width: 1200px;
		margin: auto;
		height: 100%;
	}


	
	.outer {
		margin : auto;
	}
	
	
   * {
	  box-sizing: border-box;
	}
	
	.menuButton{ 
	    background-color: none;
   		color: darkgray;
   		width: 200px;
   		padding: 5px 10px;
   		text-align: left;
   		text-decoration: none;
   		display: inline-block;
   		border: none;
   		
    }

        
    .menuButton:hover {
   		cursor: pointer;
   		color: #424242;
	  	transform: translateY(2px);	
 
    }
	
</style>
</head>
<body> 
<!-- 메뉴바 -->
<jsp:include page="../../common/menubar.jsp" />

<div id="myPage">
	<h3 style="color:#616161">마이페이지</h3>
	
	<div class="menuArea"  style="width:200px; height:150px; float:left;">
		<a class="menuButton" href="farmerMyBoardList.me">내가 작성한 게시글</a><br>
		<a class="menuButton" href="farmerMyProgramList.me">내가 작성한 프로그램</a><br>
		<a class="menuButton" href="farmerMyMarketList.me">내가 작성한 마켓글</a><br>
		<a class="menuButton" href="updateFarmerForm.me">회원정보 수정</a><br>
        <a class="menuButton" href="markProgram.me">찜한 프로그램</a><br>
        <a class="menuButton" href="markMarket.me">찜한 마켓</a><br>
        <a class="menuButton" href="myProgramlist.re">참여 프로그램</a><br>   
		<a class="menuButton" href="calView.di">영농일지</a><br>
		<a class="menuButton" href="calView.ac">농작물 입출금</a><br>
		<a class="menuButton" href="myList.fm">나의농장</a>
	</div>
    
    
</div>
</body>
</html>
