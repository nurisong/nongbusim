<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../../../common/menubar.jsp" %>

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

	body { 
			width: 1200px;
			margin: auto;
		}
	
	.outer {
		margin : auto;
	}
	
	
   * {
	  box-sizing: border-box;
	}
	
	.item-area {
		display: inline-flex;
	}
	
	.img-area img {
		width: 250px;
		height: 250px;
		margin-left: 10px;
		margin-right: 10px;
		border-radius: 5%;
	}

	.list-text-area {
		margin-top: 10px;
	}

	.select-area {
		margin-right: 80px;
	}

	.item-area a {
		text-decoration: none;
		color: rgb(100, 100, 100);   
	}

	.item-area:hover a p {
		color: rgb(10, 10, 10);
	}

	.item-area h4 {
		color: rgb(81, 116, 220); 
	}

	.item-area:hover h4{
		color: rgb(49, 81, 179); 
	}

	.form-check-label input[type=radio] {
        display: none;
    }

    .form-check-label input[type="radio"] + span {
        display: inline-block;
        padding: 10px 10px;
        border: 1px solid #dfdfdf;
        background-color: #ffffff;
        text-align: center;
        cursor: pointer;
        margin-right: 20px;
        border-radius: 10%;
    }

    .form-check-label input[type="radio"]:checked + span {
        background-color: #007bff;
        color: #ffffff;
    }

    .title-area input {
        width: 100%;
    }
    
     .menuButton{ 
 		    background-color: #FFA500;
 		    width: 200px;
     		color: maroon;
     		padding: 5px 10px;
     		text-align: center;
     		text-decoration: none;
     		display: inline-block;
     		border: white;
   	
    }
    
    select{
         appearance: none;  background-size: 20px;
 		 padding: 5px 30px 5px 10px;
  		 border-radius: 4px;
 		 outline: 0 none;
 		 background : aliceblue;
    }
    
    
</style>
</head>
<body> 
	<h3>마이페이지</h3>
	<div class="menuArea"  style="width:200px; height:150px; border:1px solid red; float:left;">
		<button class="menuButton">내가 작성한 게시글</button><br>
		<button class="menuButton">회원정보 수정</button><br>
		<button class="menuButton">영농일지</button><br>
		<button class="menuButton">농작물 입출금</button><br>
		<button class="menuButton">농장정보등록</button>

	</div>
	<div class="boardArea" style="width:1000px; height:1000px; border:1px solid green; float:left"  >
		<h3>영농일지 등록</h3>
		


	</div>
    <br>
 	<div class="list-area" align="right">

    </div>
    <br><br>
    <div class="products" align="center" id="list">
    	
       <div class="clearfix"></div>
    </div>
    

       
    </script>

    
    

</body>
</html>


</body>
</html>