<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/aa839e973e.js" crossorigin="anonymous"></script>  
<title>Insert title here</title>
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
        <hr>
        <div class="menuArea"  style="width:200px; height:120px; border:1px solid red; float:left;">
            <a class="menuButton" href="">내가 작성한 게시글</a><br>
            <a class="menuButton" href="updateUserForm.me">회원정보 수정</a><br>
            <a class="menuButton" href="">찜한 게시글</a><br>
            <a class="menuButton" href="">참여 프로그램</a><br>   
        </div>
</body>
</html>