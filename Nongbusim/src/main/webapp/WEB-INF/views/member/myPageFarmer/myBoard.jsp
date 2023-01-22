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
        <h3>내가 작성한 게시글</h3>
        <hr>
        <table id="boardList" class="table table-bordered table-sm">
          <thead>
            <tr style="text-align:center">
              <th>게시판</th>
              <th>제목</th>
              <th>작성자</th>
              <th>작성일</th>
              <th>조회수</th>
              <th>좋아요</th>
            </tr>
          </thead>
          <tbody>
          	<c:choose>
		        	<c:when test="${ not empty list }">
			            <c:forEach var="b" items="${ list }">
			          		<tr style="text-align:center; cursor:pointer;">
			          			<td class="bno" hidden>${ b.boardNo }</td>
			          			<td style="width:150px">${ b.boardType }</td>
			          			<td>${ b.boardTitle }</td>
			          			<td style="width:150px">${ b.boardWriter }</td>
			          			<td style="width:150px">${ b.createDate }</td>
			          			<td>${ b.count }</td>
			          			<td>${ b.boardLike }</td>	
			          		</tr>
          				</c:forEach>
		        	</c:when>
		        	<c:otherwise>
		        		<tr>
		        			<td style="width:200px;" colspan="6";>작성한 게시글이 없습니다.</td>
		        		</tr>
		        	</c:otherwise>
		    </c:choose>
          </tbody>
        </table>
      </div>
      
     <script>
	        	$(function(){
					$('#boardList>tbody>tr').click(function(){
						location.href = 'detail.bo?type=${type}&bno=' + $(this).children('.bno').text();
					})
	        	});
      </script>
</body>
</html>