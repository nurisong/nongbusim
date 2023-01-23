<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	<div class="outer">
		<h2>에 관련된 검색결과는 총건 입니다.</h2>
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
   		
   		$(document).on('click', '.challengeList', function(){
   			
   			location.href = '/detail.ch?cno='+ $(this).children().eq(0).val()
   						
   		});
   		
		$(document).on('click', '.crowdList', function(){
   			
   			location.href = '/detail.cc?cno='+ $(this).children().eq(0).val()
   						
   		});
		
		$(document).on('click', '.reviewList', function(){
   			
   			location.href = '/detail.re?cno='+ $(this).children().eq(0).val() + '&rno=' + $(this).children().eq(1).val()
   						
   		});
		
		
   	})
	
	</script>
</body>
</html>