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

		#container{
			padding-left:30%;
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
			          			<td class="sorry"><img class="heart" src="resources/images/deleteheart.png" alt="${ p.programNo }"></td>
			          		</tr>
			          	</c:forEach>
		        	</c:when>
		        	<c:otherwise>
		        		<tr>
		        			<td style="width:200px">찜한 게시글이 없습니다.</td>
		        			<td></td>
		        			<td></td>
		        			<td></td>
		        			<td></td>
		        		</tr>
		        		
		        	</c:otherwise>
		        </c:choose>
        </tbody>
    </table>
</body>
</html>