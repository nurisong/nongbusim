<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../../../common/menubar.jsp" %>
<%@ include file="../myPageFarmerCommon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>

<h1>영농일지 모아보기</h1>
<form action="" method="post">
<div class="selectArea">
	<div class="selectPeriod">
		조회기간 &nbsp; &nbsp;
		<button type="button" onclick="selectPeriod('oneMonth');">1개월</button>
		<button type="button" onclick="selectPeriod('threeMonths');">3개월</button>
		<button type="button" onclick="selectPeriod('sixMonths');">6개월</button>
		<button type="button" onclick="selectPeriod('oneYear');">1년</button>

		<input type="date" id="startDate" name="startDate"> ~ <input type="date" id="endDate" name="endDate">
	</div>
	<div class="selectCategory">
		품목 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select id="enrolledCategory">		
			<c:choose>
			<%-- db에서 select해온 categroyList가 비어있지 않다면 반복문을 통해 select태그를 생성--%>
				<c:when test="${ not empty categoryList }">
					<c:forEach var="category" items="${categoryList }">
						<option>${ category }</option>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<option value="noCategory">등록된 카테고리가 없습니다.</option>
				</c:otherwise>
			</c:choose>
			
		</select>
	</div>	
	<div style="align:right">
		<button onclick="selectCondition();">검색</button>	
		<button type="reset" style="align:right">초기화</button>	
	</div>
</div>
</form>
<script>

	function selectPeriod(period){
		
		var now = new Date();	
		console.log(now);
		
		switch(period){
		
		case 'oneMonth':
			var startDate = new Date(now.setMonth(now.getMonth() - 1));
			console.log(startDate);
			
			
			
			break;
		case 'threeMonths':
			$('#startDate').val = new Date(now.setMonth(now.getMonth() - 3));
			break;		
		case 'sixMonths':
			$('#startDate').val = new Date(now.setMonth(now.getMonth() - 6));
			break;		
		case 'oneYear':
			$('#startDate').val = new Date(now.setMonth(now.getYear - 1));
			break;		
		case threeMonths:
			$('#startDate').val = new Date(now.setMonth(now.getMonth() - 3));
			break;		
			
		
		}
		
		console.log($('#startDate').val );
	} 
</script>






	

</body>
</html>
