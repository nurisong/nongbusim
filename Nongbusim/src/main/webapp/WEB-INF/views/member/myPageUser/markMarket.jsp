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
			padding-left:25%;
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
<jsp:include page="myPageUserCommon.jsp" />
 <div class="container">
    <h3>찜한 마켓</h3>
	<hr>
    <table id="boardList"  class="table table-hover" align="center">
        <thead>
            <tr>
                <th>카테고리</th>
                <th>제목</th>
                <th>가격</th>
                <th>작성일</th>
                <th>찜</th>
            </tr>
        </thead>
        <tbody>
				<c:choose>
		        	<c:when test="${ not empty list }">
			            <c:forEach var="m" items="${ list }">
			          		<tr style="text-align:center">
			          			<td>${ m.marketCategory }</td>
			          			<td>${ m.marketTitle }</td>
			          			<td>${ m.marketPrice }</td>
			          			<td>${ m.marketEnrollDate }</td>
			          			<td class="sorry"><img class="heart" src="resources/images/deleteheart.png" alt="${ m.marketNo }"></td>
			          		</tr>
			          	</c:forEach>
		        	</c:when>
		        	<c:otherwise>
		        		<tr>
		        			<td style="width:200px" colspan="5">찜한 게시글이 없습니다.</td>
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
                    if($(this).attr("src") == "resources/images/deleteheart.png"){
							console.log( $(this).attr("alt"));
                        $.ajax({
                            url : 'wish.pr',
                            data :{
                                programNo : $(this).attr("alt")
                            },
                            
                            success: function() {
                                console.log($btn1);
                                $btn1.attr("src", "resources/images/heart2.png");
                            },

                            error: function(){
                                        console.log('ajax 통신 실패!');
                                    }
                    });


                    }else{
                        $.ajax({
                            url : 'wishDelete.pr',
                            data :{
                                programNo : $(this).attr("alt")
                            },
                            success: function() {
                                console.log($btn1);
                                $btn1.attr("src", "resources/images/deleteheart.png");
                            },
                            error:function(){
                                        console.log('ajax 통신 실패!');
                                    }
                    	});

                    }
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