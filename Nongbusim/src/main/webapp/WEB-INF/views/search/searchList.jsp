<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.0.2/index.global.min.js"></script>
<title>통합검색</title>
</head>
<style>

 div p{
 	 overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  width: 100px;
  height: 20px;
 }
 
 * {
  box-sizing: border-box;
}

.outer{
	width:1000px;
	margin:auto;
}
</style>
<body>
<jsp:include page="../common/menubar.jsp" />
	<!-- 	mv.addObject("boardList", searchService.selectBoardList(keyword));
		mv.addObject("farmList", searchService.selectFarmList(keyword));
		 mv.addObject("infoBoardList", searchService.selectInfoBoardList(keyword));
		 mv.addObject("marketList", searchService.selectMarketList(keyword));
		 mv.addObject("programList", searchService.selectProgramList(keyword)); -->
	
	<div class="outer">
	<c:if test="${not empty boardList }">
		<div class="category">자랑게시판</div><br>
		<c:forEach var="board" items="${boardList }" > 
		<div class="board">
			<c:if test="${board.boardType eq 'S' }">
				<input type="hidden" name="boardNo" id="boardNo" value="${board.boardNo }">
				<input type="hidden" name="type" id="boardType" value="${board.boardType }">
				<div style="font-size:20px;">${board.boardTitle }</div>
				<div class="content">${board.boardContent }</div>
				<div>${board.createDate }</div>
			</c:if>
		</div>	
		</c:forEach>
	</c:if>
	<!-- S K Q M -->


		<c:if test="${not empty farmList }">
			<div class="farm category">농장목록<br>
			<c:forEach var="farm" items="${farmList }" > 		
					<input type="hidden" name="farmNo" id="farmNo" value="${farm.farmNo }">
					<div style="font-size:20px;">${farm.farmName }</div>
					<div class="content">${farm.address }</div>
					<div>${farm.crop }</div>
					<div>${farm.farmIntro }</div>		
			</c:forEach>
			</div>
		</c:if>

		<c:if test="${not empty marketList }">
			<div class="market category">농작물 거래목록
				<c:forEach var="market" items="${marketList }" > 		
						<input type="hidden" name="marketNo" id="marketNo" value="${market.marketNo }">
						<div style="font-size:20px;">${market.marketCategory }</div>
						<div style="font-size:20px;">${market.marketTitle }</div>
						<div class="content">${market.marketPrice }</div>
						<div>${market.marketIntro }</div>		
				</c:forEach>
			</div>
		</c:if>
		
	
		<c:if test="${not empty infoBoardList }">
			<div class="infoBoard category">공지/정보 목록<br>
				<c:forEach var="infoBoard" items="${infoBoardList }" > 		
						<input type="hidden" name="infoNo" id="infoNo" value="${infoBoard.infoNo }">
						<div style="font-size:20px;">${infoBoard.infoTitle }</div>
						<div>${infoBoard.infoContent }</div>	
				</c:forEach>
			</div>
		</c:if>
		
	
		
		<c:if test="${not empty programList }">
			<div class="program category">프로그램 목록
				<c:forEach var="program" items="${programList }" > 		
						<input type="hidden" name="programNo" id="programNo" value="${program.programNo }">
						<div style="font-size:20px;">${program.programName }</div>
						<div class="content">${program.programLecture}</div>
						<div>${program.programPlan }</div>	
				</c:forEach>
			</div>
		</c:if>
	
	

	
	
	
	
		<br><br>
				
		<div id="challCount">
			<div>
				<h3>챌린지 검색결과 개 </h3>
				<a href="${PageContext.contextPath }/search.cl?keyword="> 더보기 </a>
				<hr>
				<div>
				
					<div>
						<p>검색된 챌린지가 없습니다.</p>
					</div>
		
						<br><br>
						<div class="challengeList">
							<input type="hidden" value="">
							<div>
								<img id="ChallengeImg" src="" style="width:50px; height:50px">			
							</div>
							<div>
								<h4></h4>
							</div>
							<div>
								<p></p>	
							</div>
						</div>

				</div>
			</div>
		</div>
		<br><br><br><br><br>
		
		<div id="crowdCount">
			<div>
				<h3>크라우드 챌린지 검색 결과</h3>
				<a href="/search.cc?keyword="> 더보기 </a>
				<hr>
				<div>
					
						<div>
							<p>검색된 크라우드 챌린지가 없습니다</p>
						</div>

							<br><br>
							<div class="crowdList">
								<input type="hidden" value="">
								<div>
									<img id="crowdImg" src="" style="width:50px; height:50px">			
								</div>
								<div>
									<h4></h4>
								</div>
								<div>
									<p></p>	
								</div>
							</div>

				</div>
			</div>
		</div>
		<br><br><br><br><br>
		
		<div id="reviewCount">
			<div>
				<h3>후기 검색 결과</h3>
				<a href="#"> 더보기 </a>
				<hr>
				<div>
					
						<div>
							<p>검색된 후기가 없습니다.</p>
						</div>
			
							<br><br>
							<div class="reviewList">
								<input type="hidden" value="">
								<input type="hidden" value="">								
								<div>
									<img id="reviewImg" src="" style="width:50px; height:50px">			
								</div>
								<div>
									<h4></h4>
								</div>
								<div>
									<p></p>	
								</div>
							</div>

				</div>
			</div>
		</div>
		<br><br><br><br><br>
	
	
	
	</div>
	<script>
	$(function(){
   		$(document).on('click', '.board', function(){
   			
   			location.href ='${pageContext.request.contextPath}' +'/detail.bo?bno='+$('#boardNo').val()+'&type='+$('#boardType').val();
		});

		$(document).on('click', '.farm', function(){
   			
   			location.href ='${pageContext.request.contextPath}' +'/detail.fm?fno='+$('#farmNo').val();
   						
		});

		$(document).on('click', '.market', function(){
   			
   			location.href ='${pageContext.request.contextPath}' +'/detail.mk?marketNo='+$('#marketNo').val();
   						
		});

		$(document).on('click', '.program', function(){
   			
   			location.href ='${pageContext.request.contextPath}' +'/detail.pro?bno='+$('#programNo').val();
   						
		});

		$(document).on('click', '.infoBoard', function(){
   			
   			location.href ='${pageContext.request.contextPath}' +'/detail.if?ino='+$('#infoNo').val();
   						
		});
   		
		
		// 문자열 길이 자르는 함수..ㅠ
		var content = $('.content');
		for(var i=0; i<content.length; i++){
			var str = content[i];
			
	
		}
		
		
   	});
	
	</script>
</body>
</html>