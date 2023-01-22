<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/aa839e973e.js" crossorigin="anonymous"></script>  
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<title>Insert title here</title>

<style>
	h3{
        margin: 28px 0px;
    }
    body{
       font-family: 'Pretendard-Regular';
       src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
       font-weight: 400;
       font-style: normal;
   }
   
   #myPage { 
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
<jsp:include page="../../common/menubar.jsp" />

    <div id="myPage">
        <h3 style="color:#616161">마이페이지</h3>
        <hr>
        <div class="menuArea"  style="width:200px; height:140px; border:1px solid red; float:left;">
            <a class="menuButton" href="userMyBoardList.me">내가 작성한 게시글</a><br>
            <a class="menuButton" href="userMyMarketList.me">내가 작성한 마켓글</a><br>
            <a class="menuButton" href="updateUserForm.me">회원정보 수정</a><br>
            <a class="menuButton" href="markProgram.me">찜한 프로그램</a><br>
            <a class="menuButton" href="markMarket.me">찜한 마켓</a><br>
            <a class="menuButton" href="myProgramlist.re">참여 프로그램</a><br>   
        </div>
</body>
</html>