<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../myPageFarmerCommon.jsp" %>
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
<div id="myPage">
	<h3>마이페이지</h3>
	<div class="menuArea"  style="width:200px; height:150px; border:1px solid red; float:left;">
		<button class="menuButton">내가 작성한 게시글</button><br>
		<button class="menuButton">회원정보 수정</button><br>
		<button class="menuButton">영농일지</button><br>
		<button class="menuButton">농작물 입출금</button><br>
		<button class="menuButton">농장정보등록</button>

	</div>

    <br>
 	<div class="list-area" align="right">

    </div>
    <br><br>
    <div class="products" align="center" id="list">
    	
       <div class="clearfix"></div>
    </div>
    

       
    </script>

    
    
</div>
</body>
</html>


</body>
</html>