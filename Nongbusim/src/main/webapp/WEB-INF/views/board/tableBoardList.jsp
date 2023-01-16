<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판리스트</title>
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

/*검색바 가운데 정렬*/
#sform {
display: inline-block;
text-align: center;
}

/*~순 오른쪽 정렬*/
.img-select{
  float: right;
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
        <div class="main-area">

			<c:if test="${ type=='M' }"><h1>멘티멘토 게시판</h1></c:if>
			<c:if test="${ type=='Q' }"><h1>질문 게시판</h1></c:if>
			<c:if test="${ type=='K' }"><h1>노하우 게시판</h1></c:if>           
            
            <c:if test="${loginUser !=null }">
            <button type="button" onclick="location.href='write.bo?type=${type}';" class="btn btn-secondary" id="insert-btn" >글작성</button>
            </c:if>
            <br><br>
            

            <!--검색바-->
            <div style="background-color:rgb(223, 223, 223); height: 60px; width:70%; text-align: center;">

                <div id=sform>
                <form id="searchForm" action="search.bo" method="get" style="padding-top:10px;">
                    <div class="select">
                    <select class="custom-select" name="condition">
                        <option value="all">전체</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    </div>
                    <div class="text">
                    <input type="text" class="form-control" name="keyword">
                    </div>
                    <div class="searchbutton">
                    <input type="hidden" value="${ type }" name="boardType">
                    <button type="submit" class="searchBtn btn btn-secondary">검색</button>
                    </div>
                </form>              
                </div>
            </div>
            <br><br>
            
			<!--해당순으로 정렬-->
			<div class="img-select">
			  <select id="img-select" name="img-condition">
			    <option value="recent" selected>최신순</option>
			    <option value="like">좋아요순</option>
			    <option value="count">조회수순</option>
			  </select>
			</div>
			<br><br>            
            
            <!-- 검색된 테이블 -->
            <table class="table" id="boardList">
                <thead class="thead-light" align="center">
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th>좋아요</th>
                </thead>
                <tbody align="center" id="boardContent">
					<c:forEach items="${list}" var="b">
						<tr>
							<td class="bno">${ b.boardNo }</td>
							<td>${ b.boardTitle  }</td>
							<td>${ b.boardWriter }</td>
							<td>${ b.createDate  }</td>
							<td>${ b.count       }</td>
							<td>${ b.boardLike   }</td>							
						</tr>
					</c:forEach>
                </tbody>
            </table>

            <script>
            
            	$(function(){
					$('#boardList>tbody>tr').click(function(){
						location.href = 'detail.bo?type=${type}&bno=' + $(this).children('.bno').text();
					})
            	})
            
            </script>
            
             
            <div id="pagingArea">
                <ul class="pagination">
                
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.currentPage - 1 }&type=${type}">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<li class="page-item"><a class="page-link" href="list.bo?cpage=${p}&type=${type}">${ p }</a></li>
                    </c:forEach>

					<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#"&type=${type}>Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.currentPage + 1 }&type=${type}">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                </ul>
            </div>
            
            
            
            
        </div>
    </div>
    <script>
    
    <!--
    $('#img-select').change(function(){
    	   var selectedOption = $(this).val();
    	   var boardType='${type}';



    	   
    	   console.log(selectedOption);
    	   console.log(boardType);
    	   
        $.ajax({
            url: "selectListAjax.bo",
            data: {
                selectedOption: selectedOption,
                boardType: boardType
            },
            success: function(list) {
         	   
         	   var result='';
         	   
         	   for(var i in list) {
                    result += 

					'<tr><td class="bno">'
					+list[i].boardNo+'</td><td>'
					+list[i].boardTitle+'</td><td>'
					+list[i].boardWriter+'</td><td>'
					+list[i].createDate+'</td><td>'
					+list[i].count+'</td><td>'
					+list[i].boardLike+'</td></tr>'

         	   }
         	   
                $('#boardContent').html(result);
         	   

            },
            error: function() {
                console.log('ajax communication failed');
            }
       });
    });
    
    $('#img-select').change(function(){
    	
    });
    -->

        
        



    </script>
    


</body>
</html>