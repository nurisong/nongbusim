<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/aa839e973e.js" crossorigin="anonymous"></script>  
<title>마이페이지-참여 프로그램</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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


        /* 리스트 스타일 시작 */
        .content {
                background-color:rgb(247, 245, 245);
                width:80%;
                margin:auto;
            }
            .innerOuter {
                border:1px solid lightgray;
                width:80%;
                margin:auto;
                padding:5% 10%;
                background-color:white;
            }
    
            #boardList {text-align:center;}
            #boardList>tbody>tr:hover {cursor:pointer;}
    
            #pagingArea {width:fit-content; margin:auto;}
            
            #searchForm {
                width:80%;
                margin:auto;
            }
            #searchForm>* {
                float:left;
                margin:5px;
            }
            
            .heart{
            
            width: 30px;
            height: 30px;
         
            top:20px;
            right : 5px;
            }
            .select {width:20%;}
            .text {width:53%;}
            .searchBtn {width:20%;}
        
    </style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp" />
    <div id="myPage">
        <h3>마이페이지</h3>
        <hr>
        <div class="menuArea"  style="width:200px; height:120px; border:1px solid red; float:left;">
            <a class="menuButton" href="">내가 작성한 게시글</a><br>
            <a class="menuButton" href="">회원정보 수정</a><br>
            <a class="menuButton" href="">찜한 게시글</a><br>
            <a class="menuButton" href="">참여 프로그램</a><br>   
        </div>

        <div class="content" align="center">

            
          
            <br>
            <div class="innerOuter" style="padding:5% 10%;">

                

          
            <table id="boardList"  class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>프로그램명</th>
                        <th>교육기간</th>
                        <th>상세보기</th>
                        <th>후기</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <c:forEach items="${ list }" var="b">
                    	<tr>
                    	   <td>딸기 조아</td>
                    	   <td>2023.01.12~2023.01.13</td>
                    	   <td></td>
                    	   <td>50 명</td>
                    	</tr>
                    
                    </c:forEach>
                    
                </tbody>
            </table>
            </div>
        </div>
        
        
         <div id="pagingArea">
                <ul class="pagination">
                
                	<c:choose>
                		<c:when test="${pi.currentPage eq 1 }">
                   	 		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                		 <li class="page-item "><a class="page-link" href="list.bo?cpage=${ pi.currentPage - 1 }">Previous</a></li>
                		</c:otherwise>	
                	 </c:choose>
                	 
                	<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                		 <li class="page-item "><a class="page-link" href="list.bo?cpage=${p}">${ p }</a></li>
                	
                	</c:forEach>
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq pi.maxPage }">
                			<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                		
                		</c:when>
                		<c:otherwise>
                		
                			<li class ="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage + 1 }">NEXT</a>
                		</c:otherwise>
                		
                	</c:choose>
                </ul>
            </div>

</body>
</html>