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
<title>Insert title here</title>
    <style>

			.container{
				padding-left:30%;
				margin: 0px;
			}
    
    		#boardList {text-align:center;}
            #boardList>tbody>tr:hover {cursor:pointer;}
    
            .heart{
            
            width: 30px;
            height: 30px;         
            top:20px;
            right : 5px;
            }
        </style>
</head>
<body>

<!-- 메뉴바 -->
<jsp:include page="myPageUserCommon.jsp" />
<div class="container">
	<h3>찜한 프로그램</h3>
		<hr>
		<table id="boardList" class="table table-hover" align="center">
	        <thead>
	            <tr>
	                <th>지역</th>
	                <th>프로그램명</th>
	                <th>일정</th>
	                <th>모집인원</th>
	                <th>신청</th>
	                <th>찜</th>
	            </tr>
	        </thead>
	        <tbody>
	        
		        <c:choose>
		        	<c:when test="${ not empty list }">
			            <c:forEach var="p" items="${ list }">
			          		<tr style="text-align:center">
			          		
			          			<td class="bno" hidden>${p.programNo }</td>
			          			<td>${ p.programLocation }</td>
			          			<td>${ p.programName }</td>
			          			<td>${ p.programPlan }</td>
			          			<td>${ p.headcount }</td>
			          			<td>${ p.signUp }</td>
			          			<td class="sorry"><img class="heart" src="resources/images/heart2.png" alt="${ p.programNo }"></td>
			          		</tr>
			          	</c:forEach>
		        	</c:when>
		        	<c:otherwise>
		        	    <tr>
		        			<td style="width:200px" colspan="6">찜한 게시글이 없습니다.</td>
		        		</tr>
		        	</c:otherwise>
		        </c:choose>
	        </tbody>
	    </table>
   </div>
  
       <script>
            $(function(){
                $('.heart').click(function(){
                    var $btn1 = $(this);
                     console.log($(this).attr("alt"));

                    console.log($(this).attr("src"));

                        $.ajax({
                            url : 'wishDelete.pr',
                            data :{
                                programNo : $(this).attr("alt"),
                                memNo : ${loginUser.memNo}
                            },
                            
                            success: function() {
                                console.log($btn1);
                                location.reload();
                            },

                            error:function(){
                                        console.log('ajax 통신 실패!');
                                    }
                    });
                });
            })
              
               $(function(){
            	   
                  $('#boardList>tbody>tr>td').not('.sorry').click(function(){
                	  
                     location.href = 'detail.pro?bno=' + $(this).parent().children().eq(0).text();
                  })
                  
                // mark 테이블에서 조회해서 markNoList에서 borarNo 가져와서 현재 하트 IMG ALT에 있는 programNo랑 비교헤서 하트 바꿔줌,  비교해서 같은 값이 있으면 check값 증가
                $('.heart').each(function() {
                    var check2 = 0;
                    <c:forEach items="${ markNoList }" var="m">
                    
                        if(${m.boardNo} == $(this).attr("alt")) {check2 = check2 + 1}

                    </c:forEach>

                    console.log(check2);
                    
                    if(check2 > 0) {
                        $(this).attr("src", "resources/images/heart2.png");
                    }
                    else {
                        $(this).attr("src", "resources/images/deleteheart.png");
                    }
                });
               });
      </script>
</body>
</html>