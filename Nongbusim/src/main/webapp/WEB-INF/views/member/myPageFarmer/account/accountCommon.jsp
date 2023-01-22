
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
<title>가계부</title>
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
<jsp:include page="../myPageFarmerCommon.jsp" />
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