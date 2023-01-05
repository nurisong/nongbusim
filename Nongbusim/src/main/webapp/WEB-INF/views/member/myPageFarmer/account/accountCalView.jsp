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
    
     .myButton{ 
 		    background-color: #FFA500;
     		color: maroon;
     		padding: 5px 10px;
     		text-align: center;
     		text-decoration: none;
     		display: inline-block;
     		border-radius: 5px;
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
	<div class="outer" align="center">
        <div class="header">
       		<h1>🙌후기게시판 목록</h1>
       	</div>
       	
    	 <div class="category-area" align="left">     
	    	<select class="select" name="selectCategory" id="selectCategory" onchange="changeOrder();">
		        <option selected>전체보기</option>
		        <option>루틴만들기</option>
		        <option>스터디</option>
		        <option>외국어</option>
		        <option>운동</option>
		        <option>멘탈케어</option>
		        <option>취미</option>
		        <option>기타</option>
		    </select>
		    
		    <select class="select" name="selectOrder" id="selectOrder" onchange="changeOrder();">
		        <option value="reviewCount" selected>인기순</option>
		        <option value="upload">최신순</option>
		        <option value="userLike">좋아요순</option>
		    </select>
	  	 </div>
    </div>
    <br>
 	<div class="list-area" align="right">

    </div>
    <br><br>
    <div class="products" align="center" id="list">
    	
        <div class="clearfix"></div>
    </div>
    

    <script>
        function changeOrder(){
        	var selectCategory = $('#selectCategory').val();
        	var selectOrder = $('#selectOrder').val();
        	
        	
        	
        	$.ajax({
                url : 'list.ore',
                data : {
                    selectCategory : selectCategory,
                    selectOrder : selectOrder
                },
                success : function(list) {
                  console.log(list);
                	
                    var result = '';
					
                    for(var i=0; i<list.length ; i++) {
                    
                    result 
                    +='<div class="item-area">'
                    + '<a href="<%= contextPath %>/detail.re?cno=' + list[i].challNo +'&rno='+list[i].reviewNo+'">'
                    + '<div class="img-area">'
                    + '<img src="' + list[i].reviewThumbnail + '">'
                    + '<p>' + list[i].reviewTitle + '</p>'
                    + '<p> <i class="fa-solid fa-heart" onclick="updateLike();" style="color:red"></i> 좋아요 &nbsp;&nbsp;'+ list[i].countLike  + '</p>'
                    + '<p id="selectCountLike"> </p>'
	                + '</div>' + '</a>'
               		+ '<input type="hidden" id="reviewNo" name="reviewNo" value="'+list[i].reviewNo+'">'
                    +'</div>'
                    
                    }
                    $('#list').html(result);
                },
                error : function() {
                    console.log('실패');
                }
            })

        }
    

        $(function() {
   
            changeOrder();
    	});		
   
        
        
       
    </script>

    
    

</body>
</html>


</body>
</html>