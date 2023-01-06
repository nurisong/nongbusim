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

	img{
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

</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

    <div class="outer" align="center">
        <div class="main-area">

          <h1>농작물 자랑</h1>
          <br><br>

          <div>
            <button class="btn btn-secondary" id="insert-btn">글작성</button>
          </div>
          <br>

          <div>
            <form id="searchForm" action="" method="get" align="center">
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
          <br><br><br>

          <div class="img-select">
            <select name="img-condition">
              <option value="recent">최신순</option>
              <option value="popular">인기순</option>
              <option value="create">등록순</option>
            </select>
          </div>
          <br><br><br>
         
          <div class="list-area">
          
                <div class="thumbnail" align="center">
                  <input type="hidden" value="boardNo">
                  <img src="https://cdn.britannica.com/90/94190-050-C0BA6A58/Cereal-crops-wheat-reproduction.jpg?w=400&h=300&c=crop">
                  <p>
                    	No. boardNo / boardTitle <br>
                    	조회수 : count
                  </p>
                </div>
                
                <div class="thumbnail" align="center">
                  <input type="hidden" value="boardNo">
                  <img src="https://cdn.britannica.com/90/94190-050-C0BA6A58/Cereal-crops-wheat-reproduction.jpg?w=400&h=300&c=crop">
                  <p>
                    	No. boardNo / boardTitle <br>
                    	조회수 : count
                  </p>
                </div>
                
                <div class="thumbnail" align="center">
                  <input type="hidden" value="boardNo">
                  <img src="https://cdn.britannica.com/90/94190-050-C0BA6A58/Cereal-crops-wheat-reproduction.jpg?w=400&h=300&c=crop">
                  <p>
                    	No. boardNo / boardTitle <br>
                    	조회수 : count
                  </p>
                </div>
                
                <div class="thumbnail" align="center">
                  <input type="hidden" value="boardNo">
                  <img src="https://cdn.britannica.com/90/94190-050-C0BA6A58/Cereal-crops-wheat-reproduction.jpg?w=400&h=300&c=crop">
                  <p>
                    	No. boardNo / boardTitle <br>
                    	조회수 : count
                  </p>
                </div>                

          </div>
          
          <script>
            $(function(){
              
              $('.thumbnail').click(function(){
              
                
              });
              
            })
          
          </script>





        </div>
    </div>


</body>
</html>