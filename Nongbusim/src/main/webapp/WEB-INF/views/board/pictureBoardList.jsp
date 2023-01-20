<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.outer{
    font-family: 'Pretendard-Regular';
}
.main-area{
    width: 1200px;
    padding: 50px;
}
#insert-btn{
    float: right;
}


#searchForm>div{
    float:left;
}

.img-select{
  float: right;
}


.list-area{
		text-align : center;
		border : 1px solid white;
	}

	.thumbnail img{
		width: 200px;
		height: 200px;
		padding: 10px;
	}

	.thumbnail{
		border : 1px solid wheat;
		width: 250px;
		display:inline-block;
		margin: 6px;
		background-color: rgb(242, 232, 219);
	}

	.thumbnail:hover{
		cursor:pointer;
		opacity: 0.9;
	}

  /*검색바 가운데 정렬*/
  #sform {
    display: inline-block;
    text-align: center;
  }
  
  /*페이징 가운데 정렬*/
  #pagingArea>ul {
  width: 300px;
  margin-left: auto;
  margin-right: auto;
}

</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />
    <jsp:include page="boardbar.jsp" />

    <div class="outer" align="center">
        
        <!-- main-area과paging-area로 나뉨 -->
        <div class="main-area">

          <br>
          <h1>농작물 자랑</h1>
          <br>
          
          <!--글 작성-->
          <div>
          	  <c:if test="${loginUser !=null }">
              <button type="button" onclick="location.href='write.bo?type=${type}';" class="btn btn-secondary" id="insert-btn" >글작성</button>
          	  </c:if>
          </div>
          <br><br>

          <!--검색바-->
          <div style="background-color:rgb(223, 223, 223); height: 60px; width:70%; text-align: center;">

            <div id=sform>
                <form id="searchForm" action="list.bo" method="get" style="padding-top:10px;">
                    <div class="select">
                    <select class="custom-select" name="condition">
                        <option value="all">전체</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    </div>
                    <div class="text">
                    <input type="text" class="form-control" name="keyword" value="${con.keyword}">
                    </div>
                    <div class="searchbutton">
                    <input type="hidden" value="${ type }" name="type">
                    <button type="submit" class="searchBtn btn btn-secondary">검색</button>
                    </div>
                </form>               
            </div>
            
          </div>
            
          <br><br>
          
          <!--해당순으로 정렬-->
			<div class="img-select">
				<div id="oform">
				  <select id="order-select2" name="jump" onchange="location.href=this.value">
				    <option name="recent" value="list.bo?cpage=1&type=${type}&condition=${con.condition}&keyword=${con.keyword}&order=recent" selected>최신순</option>
				    <option name="like"   value="list.bo?cpage=1&type=${type}&condition=${con.condition}&keyword=${con.keyword}&order=like">좋아요순</option>
				    <option name="count"  value="list.bo?cpage=1&type=${type}&condition=${con.condition}&keyword=${con.keyword}&order=count">조회수순</option>
				  </select>
				</div>
			
			</div>
			<br><br>  
         
          <!--썸네일 리스트-->
        <div class="list-area">
          
	        <div class="thumbnails" align="center">
	            
                    <c:forEach items="${ list }" var="b">

                            <div class="thumbnail" onclick="location.href='detail.bo?type=S&bno=${b.boardNo}';">
                                <c:if test="${ not empty at }">
                                    <c:forEach items="${ at }" var="at">
                                        <c:if test="${ b.boardNo == at.boardNo}">
  
                                                 <img class="card-img-top" src="${ at.changeName }" alt="">

                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            
                                <div class="card-body">
                                    <h6 class="card-title">
                                        <p style="color: black; font-size:20px;">${ b.boardTitle }</p>
                                    </h6>
                                    <p>
                                    <svg id="heartless" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-heart" viewBox="0 0 16 16">
										<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
									</svg>
                                    ${ b.boardLike }
                                    &nbsp;&nbsp;
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
									    <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
									    <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
									</svg>
                                    ${ b.count }
                                    </p>
                                </div>
                            </div>

                    </c:forEach>
        	</div>
    	</div>
    	
    	<!-- 페이징 처리 -->
		<div id="pagingArea">
		    <ul class="pagination">
		    
		    	<c:choose>
		    		<c:when test="${ pi.currentPage eq 1 }">
		        		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
		        	</c:when>
		        	<c:otherwise>
		        		<li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.currentPage - 1 }&type=S&condition=${con.condition}&keyword=${con.keyword}&order=${con.order}">Previous</a></li>
		        	</c:otherwise>
		        </c:choose>
		        
				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
		        	<li class="page-item"><a class="page-link" href="list.bo?cpage=${p}&type=S&condition=${con.condition}&keyword=${con.keyword}&order=${con.order}">${ p }</a></li>
		        </c:forEach>
		
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
		        		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
		        	</c:when>
		        	<c:otherwise>
		        		<li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.currentPage + 1 }&type=S&condition=${con.condition}&keyword=${con.keyword}&order=${con.order}">Next</a></li>
		        	</c:otherwise>
		        </c:choose>
		          
		    </ul>
		</div>
		
    </div>
    
    <script>
    
	$(function(){
		var name='${con.order}';
		$("#order-select2 option[name = '" + name + "']").attr('selected',true);
	});
    

        
        



    </script>

</body>
</html>