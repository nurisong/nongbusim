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
	<div class="selectDate">
		조회기간 &nbsp; &nbsp;
		<button>1개월</button>
		<button>3개월</button>
		<button>6개월</button>
		<button>1년</button>
		<input type="date"> ~ <input type="date">
	</div>
	<div class="selectCategory">
		품목 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select id="enrolledCategory">		
			<c:choose>
				<c:when test="${ not empty categoryList }">
					<c:forEach var="item"
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
			<option>가나다라마바사아</option>
			<option>가</option>
			<option>가</option>
			<option>가</option>
		</select>
	</div>	
	<div style="align:right">
		<button>검색</button>	
		<button type="reset" style="align:right">초기화</button>	
	</div>
</div>
</form>
<!-- categoryList -->




</script>
	

</body>
</html>
