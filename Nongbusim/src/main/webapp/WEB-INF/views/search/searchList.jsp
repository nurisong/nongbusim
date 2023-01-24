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

	
	main {
		width:1200px;
		margin:auto;
		background-color: #f5f5f5;
		padding: 40px;
	}
	div p{
		overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 100px;
	height: 20px;
	}
 
	details {
		background-color: white;
		border-radius: 2%;
		border: 1px solid #e0e0e0;
		padding: 10px;
	}
	
	
	
	
	.article-title {
		font-size:20px;
	 	padding-left:50px;
	 	font-weight: bolder;
	 }
	 
	 
	.category{
		font-size: 30px;
		padding: 30px 0px 0px 0px;
		display: flex;
		justify-content:center;
		flex-direction:row;
	}

	.article-title+div{
		display:flex;  padding:20px;
	}
	
	.content{
		width:600px;
		padding:10px;
		border:1px solid darkgray;
		font: 400 1rem/1.5rem 'NotoSansKR';
		margin: 30px 100px 30px 10px;
		border-radius: 2%;
	}
	
	.mk-content{
		width:600px;
		padding:10px 0px 0px 30px;
		font: 400 1rem/1.5rem 'NotoSansKR';
		border-radius: 2%;
	}
	
	
	main img {

		width: 250px;
		height: 200px;
		border-radius: 5%;
		object-fit: cover;
	}
	
	details summary::marker {

	  color: darkgray;
	  font-size: 30px;
	}
	details[open] > summary:before {
	  transform: rotate(90deg);
	}
	summary:before {
	  border-width: .4rem;
	  border-style: solid;
	  border-color: transparent transparent transparent #fff;
	  position: absolute;
	  top: 1.3rem;
	  left: 1rem;
	  transform: rotate(0);
	  transform-origin: .2rem 50%;
	  transition: .25s transform ease;
	}
	
	
</style>
<body>
<jsp:include page="../common/menubar.jsp" />
<main>	
	<!-- S 자랑게시판 -->
	<c:if test="${not empty boardList }">
		<div class="category">자랑게시판</div><br>
		<details>
			<summary>
			<c:set var="chknum" value="1" />
			<c:set var="pointer" value="1" />
			<c:forEach var="board" items="${boardList }" varStatus="status" > 
				
				<div class="board flex">
				<c:if test="${chknum lt 4}">
					<c:if test="${board.boardType eq 'S' }">
						<input type="hidden" name="boardNo" class="boardNo" value="${board.boardNo }">
						<input type="hidden" name="type" id="boardType" value="${board.boardType }">
						<div class="article-title">${board.boardTitle }</div>
						<div style="display:flex;  padding:30px;">
							<div>
								<div class="box">				
									<div class="content">${board.boardContent }</div>
								</div>
								<div style="padding:20px;">${board.createDate }</div>
							</div>	 
							<div>
								<c:set var="chk" value="true" />
			                        <c:forEach items="${ atList }" var="at">
			                        	<c:if test="${chk}">
					                        <c:if test="${ board.boardNo == at.boardNo and at.boardType eq 'S'}">
					                                 <img src="${ at.changeName }" alt="">
					                        <c:set var="chk" value="false" />
					                        </c:if>					                        
					                     </c:if>  
			                   		 </c:forEach>
			                </div>
			            <c:set var="chknum" value="${chknum+1}" />  
			            
						<c:set var="pointer" value="${status.count+1}" />  
					</c:if> 
				</c:if>
			     </div> 
			        
			</c:forEach>
		</summary>
			<c:forEach var="board" items="${boardList }" begin="${pointer}" > 
				<div class="board">
					<c:if test="${board.boardType eq 'S' }">
						<input type="hidden" name="boardNo" class="boardNo" value="${board.boardNo }">
						<input type="hidden" name="type" id="boardType" value="${board.boardType }">
						<div class="article-title">${board.boardTitle }</div>
						<div style="display:flex;  padding:20px;">
							<div>
								<div class="box">				
									<div class="content">${board.boardContent }</div>
								</div>
								<div style="padding:20px;">${board.createDate }</div>
							</div>	
							<div>
								<c:set var="chk" value="true" />
								<c:forEach items="${ atList }" var="at">
									<c:if test="${chk}">
				                        <c:if test="${ board.boardNo == at.boardNo and at.boardType eq 'S'}">
				                                 <img src="${ at.changeName }" alt="">
				                        	<c:set var="chk" value="false" />
					                        </c:if>	
				                        </c:if>
			                    </c:forEach>
			                </div>
			            </div>        
					</c:if>
				</div>
			</c:forEach>
		</details>	
	</c:if>
	
	
	
	<!-- K 노하우게시판 -->
		<c:if test="${not empty boardList }">
		<div class="category">노하우게시판</div><br>
		<details>
			<summary>
				<c:set var="chknum" value="1" />
	<c:set var="pointer" value="1" />
	<c:forEach var="board" items="${boardList }" varStatus="status" > 
				<div class="board flex">
					<c:if test="${chknum lt 4}">
					<c:if test="${board.boardType eq 'K' }">
					
						<input type="hidden" name="boardNo" class="boardNo" value="${board.boardNo }">
						<input type="hidden" name="type" id="boardType" value="${board.boardType }">
						<div class="article-title">${board.boardTitle }</div>
						<div style="display:flex;  padding:30px;">
							<div>
								<div class="box">				
									<div class="content">${board.boardContent }</div>
								</div>
								<div style="padding:20px;">${board.createDate }</div>
							</div>	
							<div>
								<c:set var="chk" value="true" />
								<c:forEach items="${ atList }" var="at">
									<c:if test="${chk}">
				                        <c:if test="${ board.boardNo == at.boardNo and at.boardType eq 'K'}">
				                                 <img src="${ at.changeName }" alt="">
				                        	<c:set var="chk" value="false" />
					                        </c:if>	
				                        </c:if>
			                    </c:forEach>
			                </div>
			            </div>			            
					 <c:set var="chknum" value="${chknum+1}" />  								            
					<c:set var="pointer" value="${status.count+1}" />  									
					</c:if> 			                    
					</c:if>
				</div>
			</c:forEach>
			</summary>
			<c:forEach var="board" items="${boardList }" begin="${pointer}"> 
				<div class="board">
					<c:if test="${board.boardType eq 'K' }">
						<input type="hidden" name="boardNo" class="boardNo" value="${board.boardNo }">
						<input type="hidden" name="type" id="boardType" value="${board.boardType }">
						<div class="article-title">${board.boardTitle }</div>
						<div style="display:flex;  padding:30px;">
							<div>
								<div class="box">				
									<div class="content">${board.boardContent }</div>
								</div>
								<div style="padding:20px;">${board.createDate }</div>
							</div>	
							<div>
								<c:set var="chk" value="true" />
								<c:forEach items="${ atList }" var="at">
									<c:if test="${chk}">
				                        <c:if test="${ board.boardNo == at.boardNo and at.boardType eq 'K'}">
				                                 <img src="${ at.changeName }" alt="">
				                        	<c:set var="chk" value="false" />
					                        </c:if>	
				                        </c:if>
			                    </c:forEach>
			                </div>
			            </div>        
					</c:if>
				</div>
			</c:forEach>
		</details>	
	</c:if>
	
	<!-- Q 질문게시판 -->
		<c:if test="${not empty boardList }">
		<div class="category">질문게시판</div><br>
		<details>
			<summary>
			<c:set var="chknum" value="1" />
			<c:set var="pointer" value="1" />
			<c:forEach var="board" items="${boardList }" varStatus="status" > 				
				<div class="board flex">
					<c:if test="${chknum lt 4}">
					<c:if test="${board.boardType eq 'Q' }">
						<input type="hidden" name="boardNo" class="boardNo" value="${board.boardNo }">
						<input type="hidden" name="type" id="boardType" value="${board.boardType }">
						<div class="article-title">${board.boardTitle }</div>
						<div style="display:flex;  padding:30px;">
							<div>
								<div class="box">				
									<div class="content">${board.boardContent }</div>
								</div>
								<div style="padding:20px;">${board.createDate }</div>
							</div>	
							<div>
								<c:set var="chk" value="true" />
								<c:forEach items="${ atList }" var="at">
									<c:if test="${chk}">
				                        <c:if test="${ board.boardNo == at.boardNo and at.boardType eq 'Q'}">
				                                 <img src="${ at.changeName }" alt="">
				                        	<c:set var="chk" value="false" />
					                        </c:if>	
				                        </c:if>
			                    </c:forEach>
			                </div>
			            </div>   
			             <c:set var="chknum" value="${chknum+1}" />  			            
					<c:set var="pointer" value="${status.count+1}" />  
					</c:if>      
					</c:if>
				</div>
			</c:forEach>
			</summary>
			<c:forEach var="board" items="${boardList }" begin="${pointer}" > 
				<div class="board">
					<c:if test="${board.boardType eq 'Q' }">
						<input type="hidden" name="boardNo" class="boardNo" value="${board.boardNo }">
						<input type="hidden" name="type" id="boardType" value="${board.boardType }">
						<div class="article-title">${board.boardTitle }</div>
						<div style="display:flex;  padding:30px;">
							<div>
								<div class="box">				
									<div class="content">${board.boardContent }</div>
								</div>
								<div style="padding:20px;">${board.createDate }</div>
							</div>	
							<div>
								<c:forEach items="${ atList }" var="at">
			                        <c:if test="${ board.boardNo == at.boardNo and at.boardType eq 'Q'}">
			                                 <img src="${ at.changeName }" alt="">
			                        </c:if>
			                    </c:forEach>
			                </div><div>
								<c:set var="chk" value="true" />
								<c:forEach items="${ atList }" var="at">
									<c:if test="${chk}">
				                        <c:if test="${ board.boardNo == at.boardNo and at.boardType eq 'Q'}">
				                                 <img src="${ at.changeName }" alt="">
				                        	<c:set var="chk" value="false" />
					                        </c:if>	
				                        </c:if>
			                    </c:forEach>
			                </div>
			            </div>        
					</c:if>
				</div>
			</c:forEach>
		</details>	
	</c:if>
	<!-- M멘토구하기 -->
		<c:if test="${not empty boardList }">
		<div class="category">멘티멘토게시판</div><br>
		<details>
			<summary>
			<c:set var="chknum" value="1" />
			<c:set var="pointer" value="1" />
			<c:forEach var="board" items="${boardList }" varStatus="status" > 				
				<div class="board flex">
					<c:if test="${chknum lt 4}">
					<c:if test="${board.boardType eq 'M' }">
						<input type="hidden" name="boardNo" class="boardNo" value="${board.boardNo }">
						<input type="hidden" name="type" id="boardType" value="${board.boardType }">
						<div class="article-title">${board.boardTitle }</div>
						<div>
							<div>
								<div class="box">				
									<div class="content">${board.boardContent }</div>
								</div>
								<div style="padding:20px;">${board.createDate }</div>
							</div>	
							<div>
								<c:set var="chk" value="true" />
								<c:forEach items="${ atList }" var="at">
									<c:if test="${chk}">
				                        <c:if test="${ board.boardNo == at.boardNo and at.boardType eq 'M'}">
				                                 <img src="${ at.changeName }" alt="">
				                        	<c:set var="chk" value="false" />
					                        </c:if>	
				                        </c:if>
			                    </c:forEach>
			                </div>
			            </div>
			             <c:set var="chknum" value="${chknum+1}" />  			            
						<c:set var="pointer" value="${status.count+1}" />  
					</c:if>     
					</c:if>
				</div>
			</c:forEach>
			</summary>
			<c:forEach var="board" items="${boardList }" begin="${pointer}" > 
				<div class="board">
					<c:if test="${board.boardType eq 'M' }">
						<input type="hidden" name="boardNo" class="boardNo" value="${board.boardNo }">
						<input type="hidden" name="type" id="boardType" value="${board.boardType }">
						<div class="article-title">${board.boardTitle }</div>
						<div style="display:flex;  padding:30px;">
							<div>
								<div class="box">				
									<div class="content">${board.boardContent }</div>
								</div>
								<div style="padding:20px;">${board.createDate }</div>
							</div>	
							<div>
								<c:set var="chk" value="true" />
								<c:forEach items="${ atList }" var="at">
									<c:if test="${chk}">
				                        <c:if test="${ board.boardNo == at.boardNo and at.boardType eq 'M'}">
				                                 <img src="${ at.changeName }" alt="">
				                        	<c:set var="chk" value="false" />
					                        </c:if>	
				                        </c:if>
			                    </c:forEach>
			                </div>
			            </div>        
					</c:if>
				</div>
			</c:forEach>
		</details>	
	</c:if>
	
	<!-- 농작물거래 게시판 -->

	<c:if test="${not empty marketList }">
		<div class="market category">농작물 거래목록</div>
		<details>
			<summary>
			    <c:forEach var="market" items="${ marketList}" begin="1" end="3"> 		
			        <div class="market">
			                <input type="hidden" name="marketNo" class="marketNo" value="${market.marketNo }">
			                <div class="article-title">${market.marketTitle }</div>
			                <div>
			                    <div class="box">		
			                        <div class="mk-content">카테고리&nbsp;&nbsp; ${market.marketCategory}</div>
			                        <div class="mk-content">가격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;${market.marketPrice}원</div>
			                        <div class="mk-content">작성일&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;${market.marketEnrollDate}</div>
			                    </div>	
			                    <div>
			                    <c:set var="chk" value="true" />
			                        <c:forEach items="${ atList }" var="at">
			                        	<c:if test="${chk}">
			                  				<c:if test="${ (market.marketNo eq at.boardNo) and (at.boardType eq 'mk')}">
			                                	<img src="${ at.changeName }" alt="">
			                                	<c:set var="chk" value="false" />
			                               </c:if> 	
			                            </c:if>
			                         </c:forEach>								
			                    </div>
			                </div>		
			            </div>	
			    </c:forEach>
			</summary>
		    <c:forEach var="market" items="${marketList }" begin="4"> 		
		            <div class="market">
		                <input type="hidden" name="marketNo" class="marketNo" value="${market.marketNo }">
		                <div class="article-title">${market.marketTitle }</div>
		                <div>
		                    <div class="box">		
		                        <div class="content">카테고리 &nbsp;&nbsp;&nbsp; ${market.marketCategory}</div>
		                        <div class="content">가격 &nbsp;&nbsp;&nbsp;${market.marketPrice}원</div>
		                    </div>	
		                    <div>
			                    <c:set var="chk" value="true" />
			                        <c:forEach items="${ atList }" var="at">
			                        	<c:if test="${chk}">
			                  				<c:if test="${ (market.marketNo eq at.boardNo) and (at.boardType eq 'mk')}">
			                                	<img src="${ at.changeName }" alt="">
			                                	<c:set var="chk" value="false" />
			                               </c:if> 	
			                            </c:if>
			                         </c:forEach>								
			                    </div>
		                </div>		
		            </div>		
		    </c:forEach>	
				
		
		</details>	
	</c:if>
		
				
	<c:if test="${not empty programList }">
		<div class="program category">프로그램 목록</div>
			<details>
				<summary>
					<c:forEach var="program" items="${programList }" begin="1" end="3" >
						<div class="program"> 		
							<input type="hidden" name="programNo" class="programNo" value="${program.programNo }">
							<div class="article-title">${program.programName }</div>
							<div>
								<div class="box">	
									<div>&nbsp;&nbsp;&nbsp;강사명&nbsp; :&nbsp; ${program.programLecture}</div>
									<div class="content">${program.programDetail}</div>
									<div>&nbsp;&nbsp;&nbsp;진행일시 :&nbsp;${program.programPlan }</div>	
									
								</div>	
								<div>
									<img src="${program.changeName}">
								</div>	
							</div>
						</div>
					</c:forEach>
				</summary>
					<c:forEach var="program" items="${programList }" begin="4" >
						<div class="program"> 		
							<input type="hidden" name="programNo" class="programNo" value="${program.programNo }">
							<div class="article-title">${program.programName }</div>
							<div>
								<div class="box">	
									<div>${program.programLecture}</div>
									<div class="content">${program.programDetail}</div>
									<div>${program.programPlan }</div>	
									
								</div>	
								<div>
									<img src="${program.changeName}">
								</div>	
							</div>
						</div>
					</c:forEach>
			</details>		
	</c:if>
	
		
	<c:if test="${not empty farmList }">
		<div class="category">농장목록<br></div>
			<details>
				<summary>
					<c:forEach var="farm" items="${farmList }" begin="1" end="3"> 		
						<div class="farm">
								<input type="hidden" name="farmNo" class="farmNo" value="${farm.farmNo }">
								<div class="article-title">${farm.farmName }</div>
								<div>
									<div class="box">		
										<div class="content">주소 &nbsp;&nbsp;&nbsp; ${farm.address }</div>
										<div class="content">작물 &nbsp;&nbsp;&nbsp;${farm.crop }</div>
									</div>	
									<div>
										 <c:set var="chk" value="true" />
										<c:forEach items="${ atList }" var="at">
											<c:if test="${chk}">
						                        <c:if test="${ farm.farmNo eq at.boardNo and at.boardType eq 'F'}">
						                            <img src="${ at.changeName }" alt="">
						                            <c:set var="chk" value="false" />
			                              		 </c:if> 	
						                        </c:if>
						                 </c:forEach>								
									</div>
								</div>		
							</div>	
					</c:forEach>
				</summary>
					<c:forEach var="farm" items="${farmList }" begin="4"> 		
							<div class="farm">
								<input type="hidden" name="farmNo" class="farmNo" value="${farm.farmNo }">
								<div class="article-title">${farm.farmName }</div>
								<div>
									<div class="box">		
										<div class="content">주소 &nbsp;&nbsp;&nbsp; ${farm.address }</div>
										<div class="content">작물 &nbsp;&nbsp;&nbsp;${farm.crop }</div>
									</div>	
										<div>
										 <c:set var="chk" value="true" />
										<c:forEach items="${ atList }" var="at">
											<c:if test="${chk}">
						                        <c:if test="${ farm.farmNo eq at.boardNo and at.boardType eq 'F'}">
						                            <img src="${ at.changeName }" alt="">
						                            <c:set var="chk" value="false" />
			                              		 </c:if> 	
						                        </c:if>
						                 </c:forEach>								
									</div>
								</div>		
							</div>		
					</c:forEach>	
			</details>	
	</c:if>
	<c:if test="${not empty infoBoardList }">
		<div class="infoBoard category">공지/정보 목록<br></div>
			<details>
				<summary>
					<c:forEach var="infoBoard" items="${infoBoardList }" begin="1" end="3"> 
						<div class="infoBoard">
							<input type="hidden" name="infoNo" class="infoNo" value="${infoBoard.infoNo }">
							<div class="article-title">${infoBoard.infoTitle }</div>
							
							<div class="box">
								<div class="content" style="width:900px; margin-right:50px;"> ${infoBoard.infoContent }</div>	
							</div>
						</div>	
					</c:forEach>
				</summary>	
				<c:forEach var="infoBoard" items="${infoBoardList }" begin="4"> 
						<div class="infoBoard">
							<input type="hidden" name="infoNo" class="infoNo" value="${infoBoard.infoNo }">
							<div class="article-title">${infoBoard.infoTitle }</div>
							
							<div class="box">
								<div class="content"> ${infoBoard.infoContent }</div>	
							</div>
						</div>	
					</c:forEach>
			</details>	
		</div>
	</c:if>
</main>	
	<script>
	$(function(){
   		$(document).on('click', '.board', function(){
   			
   			location.href ='${pageContext.request.contextPath}' +'/detail.bo?bno='+$(this).children('.boardNo').val()+'&type='+$('#boardType').val();
		});

		$(document).on('click', '.farm', function(){
   			
   			location.href ='${pageContext.request.contextPath}' +'/detail.fm?fno='+$(this).children('.farmNo').val();
   						
		});

		$(document).on('click', '.market', function(){
   			
   			location.href ='${pageContext.request.contextPath}' +'/detail.mk?marketNo='+$(this).children('.marketNo').val();
   						
		});

		$(document).on('click', '.program', function(){
   			
   			location.href ='${pageContext.request.contextPath}' +'/detail.pro?bno='+$(this).children('.programNo').val();
   						
		});

		$(document).on('click', '.infoBoard', function(){
   			
   			location.href ='${pageContext.request.contextPath}' +'/detail.if?ino='+$(this).children('.infoNo').val();
   						
		});
   		
		

	   
		
		// 문자열 길이 자르는 함수..ㅠ
		var content = $('.content');
		for(var i=0; i<content.length; i++){
			var str = content[i];
			
	
		}
		
		
   	});
	
	</script>
	<script text="javascript/text">
    $(document).ready(function(){

        $('.box').each(function(){
            var content = $(this).children('.content');
            var content_txt = content.text();
            var content_txt_short = content_txt.substring(0,100)+"...";
            var btn_more = $('<a href="javascript:void(0)" class="more">&nbsp;&nbsp;&nbsp;상세보기</a>');

            
            $(this).append(btn_more);
            
            if(content_txt.length >= 100){
                content.html(content_txt_short)
                
            }else{
                btn_more.hide()
            }
            
            btn_more.click(toggle_content);
            // 아래 bind가 안 되는 이유는??
            // btn_more.bind('click',toggle_content);

            function toggle_content(){
                if($(this).hasClass('short')){
                    // 접기 상태
                    $(this).html('더보기');
                    content.html(content_txt_short)
                    $(this).removeClass('short');
                }
            }
        });
    });
  </script>
</body>
</html>