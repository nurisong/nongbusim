<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 리스트</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                                                                                       
    <style>
        	.container{
	    	padding-left:25%;
   			margin: 0px;
        	}
            .content {
                background-color:rgb(247, 245, 245);
                width : 100%;
                margin:left;
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
            #searchForm {
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
   <jsp:include page="myPageFarmerCommon.jsp" />
      <div class="container"> 
        <div class="content" align="center">
               <br>
                <h2>내가 작성한 프로그램</h2>
                <br>
            <br>
            <div class="innerOuter" style="padding:5% 10%;">

            <table id="boardList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>지역</th>
                        <th>프로그램명</th>
                        <th>일정</th>
                        <th>모집인원</th>
                        <th>신청</th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
					<c:when test="${ not empty list }">
                
	                    <c:forEach items="${ list }" var="p">
	                    <tr>
	                    	
	                    	
	                        <td class="bno" hidden>${ p.programNo }</td>
	                        <td class="test">${ p.programLocation }</td>
	                        <td class="test">${ p.programName }</td>
	                        <td class="test">${ p.programPlan }</td>
	                        <td class="test">${ p.headcount }</td>
	                        <c:choose>
	                            <c:when test="${p.headcount le p.nowHeadCount}">
	                                <td class="test">마감</td>
	                            </c:when>
	                            <c:otherwise>
	                                <td class="test">진행중</td>
	                            </c:otherwise>
	                        </c:choose>
	                     </tr>
	                    </c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td style="width:200px">작성한 프로그램이 없습니다.</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</c:otherwise>                
                </c:choose>
                </tbody>
            </table>
            </div>
        </div>
       </div> 
        
          <script>
               $(function(){
                  $('#boardList>tbody>tr>td').click(function(){
                     location.href = 'detail.pro?bno=' + $(this).parent().children().eq(0).text();
                  })
                });                  
          </script>
</body>
</html>