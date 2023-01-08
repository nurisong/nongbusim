<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />
    <jsp:include page="Boardbar.jsp" />

    <div class="outer" align="center">
        <div class="main-area">

          <h1>농작물 자랑</h1>
          <br><br>
          
          <!--글 작성-->
          <div>
            <button class="btn btn-secondary" id="insert-btn">글작성</button>
          </div>
          <br>
          <br>

          <!--검색바-->
          <div style="background-color:rgb(223, 223, 223); height: 60px; width:70%; text-align: center;">

            <div id=sform>
              <form id="searchForm" action="" method="get" style="padding-top:10px;">
                <div class="select">
                  <select class="custom-select" name="condition">
                    <option value="all">전체</option>
                    <option value="writer">작성자</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                  </select>
                </div>
                <div class="text">
                  <input type="text" class="form-control" name="keyword">
                </div>
                <div class="searchbutton">
                  <button type="submit" class="searchBtn btn btn-secondary">검색</button>
                </div>
              </form>              
            </div>
          </div>
            
          <br><br>
          
          <!--해당순으로 정렬-->
          <div class="img-select">
            <select name="img-condition">
              <option value="recent">최신순</option>
              <option value="popular">좋아요순</option>
              <option value="create">조회수순</option>
            </select>
          </div>
          <br><br>
         
          <!--썸네일 리스트-->
          <div class="list-area">
          
            <div class="thumbnail" align="center">
              <input type="hidden" value="boardNo">
              <img src="https://cdn.britannica.com/90/94190-050-C0BA6A58/Cereal-crops-wheat-reproduction.jpg?w=400&h=300&c=crop">
              <p>
                boardTitle <br>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-heart-fill" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                </svg> like수 &nbsp;
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="grey" class="bi bi-eye-fill" viewBox="0 0 16 16">
                  <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                  <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                </svg> count수
              </p>
            </div>

            <div class="thumbnail" align="center">
              <input type="hidden" value="boardNo">
              <img src="https://cdn.britannica.com/90/94190-050-C0BA6A58/Cereal-crops-wheat-reproduction.jpg?w=400&h=300&c=crop">
              <p>
                boardTitle <br>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-heart-fill" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                </svg> like수 &nbsp;
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="grey" class="bi bi-eye-fill" viewBox="0 0 16 16">
                  <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                  <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                </svg> count수
              </p>
            </div>

            <div class="thumbnail" align="center">
              <input type="hidden" value="boardNo">
              <img src="https://cdn.britannica.com/90/94190-050-C0BA6A58/Cereal-crops-wheat-reproduction.jpg?w=400&h=300&c=crop">
              <p>
                boardTitle <br>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-heart-fill" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                </svg> like수 &nbsp;
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="grey" class="bi bi-eye-fill" viewBox="0 0 16 16">
                  <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                  <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                </svg> count수
              </p>
            </div>

            <div class="thumbnail" align="center">
              <input type="hidden" value="boardNo">
              <img src="https://cdn.britannica.com/90/94190-050-C0BA6A58/Cereal-crops-wheat-reproduction.jpg?w=400&h=300&c=crop">
              <p>
                boardTitle <br>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-heart-fill" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                </svg> like수 &nbsp;
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="grey" class="bi bi-eye-fill" viewBox="0 0 16 16">
                  <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                  <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                </svg> count수
              </p>
            </div>
        </div>
    </div>
  </div>

  <script>
    $(function(){
      
      $('.thumbnail').click(function(){
      
        
      });
      
    })
  
  </script>


</body>
</html>