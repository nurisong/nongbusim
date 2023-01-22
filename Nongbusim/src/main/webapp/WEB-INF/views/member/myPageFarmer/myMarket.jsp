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
	
</style>
</head>
<body>
<!-- 사이드바 -->
<jsp:include page="myPageFarmerCommon.jsp"/>

    <div class="container">
        <h3>내가 작성한 마켓글</h3>
        <hr>
        <table id="boardList" class="table table-bordered table-sm" style="margin:0px">
          <thead>
            <tr style="text-align:center">
              <th>카테고리</th>
              <th>제목</th>
              <th>가격(원)</th>
              <th>작성일</th>
            </tr>
          </thead>
          <tbody style="cursor:pointer;">
          	<c:choose>
		        	<c:when test="${ not empty list }">
			            <c:forEach var="m" items="${ list }">
			          		<tr style="text-align:center">
			          			<td class="marketNo" hidden>${ m.marketNo }</td>
			          			<td>${ m.marketCategory }</td>
			          			<td>${ m.marketTitle }</td>
			          			<td>${ m.marketPrice }</td>
			          			<td>${ m.marketEnrollDate }</td>
			          		</tr>
			          	</c:forEach>
		        	</c:when>
		        	<c:otherwise>
		        		<tr>
							<td style="width:200px;" colspan="4";>작성한 게시글이 없습니다.</td>
		        		</tr>
		        	</c:otherwise>
		        </c:choose>
          </tbody>
        </table>
      </div>
      
      <script>
	      $(function(){
	          $('#boardList>tbody>tr>td').click(function(){
	             location.href = 'detail.mk?marketNo=' + $(this).parent().children().eq(0).text();          
	         })
         });
      </script>
</body>
</html>