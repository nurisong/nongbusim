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
<form action="ajaxSelectDiaryList" method="post">
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
		<button type="submit">검색</button>
		<button type="reset" style="align:right">초기화</button>	
	</div>
</div>
</form>
<script>

	function selectPeriod(period){
		
		var startDate ;
		var now = new Date();	
		console.log(now);
		
		console.log("now"+dateFormat(now));
		$('#endDate').val= dateFormat(now);
		
		
		switch(period){
		
		case 'oneMonth':
			startDate = new Date(now.setMonth(now.getMonth() - 1));			
			break;
		case 'threeMonths':
			startDate = new Date(now.setMonth(now.getMonth() - 3));
			break;		
		case 'sixMonths':
			startDate = new Date(now.setMonth(now.getMonth() - 6));
			break;		
		case 'oneYear':
			startDate = new Date(now.setMonth(now.getYear() - 1));
			break;		
	
			
		
		}
	
		
		console.log("startDate"+dateFormat(startDate));
		$('#startDate').val = dateFormat(startDate);
		
	} 
	
	
	
	//날짜를 yyyy-mm-dd로 바꿔주는 함수
	function dateFormat(date) {
		let dateFormat2 = date.getFullYear() +
		'-' + ( (date.getMonth()+1) < 9 ? "0" + (date.getMonth()+1) : (date.getMonth()+1) )+
		'-' + ( (date.getDate()) < 10 ? "0" + (date.getDate()) : (date.getDate()) );
	return dateFormat2;
	}
	
	
</script>






	

</body>
</html>
