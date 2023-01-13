<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농부심</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>

    body{
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
	}


    #market_wrap{

        display: inline-block;
        width: 100%;
        margin-top: 150px;

    }

    #market_wrap a{

        color: black;
        text-decoration: none;

    }

    #market_wrap button{
        border: none;
    }

    #market_wrap a:hover{

        color: black;

    }

    #market_page{
        
        display: inline-block;
        width: 100%;

    }



</style>


</head>
<body>

    <jsp:include page="../common/menubar.jsp" />



<div id="market_wrap">

        <div class="container">

        <div class="row">

            <div class="col-lg-3">

                <select name="marketCategory" style="width: 200px;">
                    <option vlaue="모두" class="form-select" aria-label="Default select example" selected>모두</option>
                    <option vlaue="농산물" class="form-select">농산물</option>>
                    <option vlaue="수산물" class="form-select">수산물</option>>
                    <option vlaue="축산물" class="form-select">축산물</option>>
                </select>

            </div>
            <!-- /.col-lg-3 -->

            <div class="col-lg-9">
                
                <c:if test="${ not empty sessionScope.loginUser }" >
                    <form action="insertForm.mk">
                        <button type="submit" class="btn btn-success btn-sm">글쓰기</button>
                </c:if>
                        <span style="float: right;">
                            <select name="orderBy">
                                <option value="최신순" selected>최신순</option>
                                <option value="인기순">인기순</option>
                                <option value="높은가격순">높은가격순</option>
                                <option value="낮은가격순">낮은가격순</option>
                            </select>
                        </span>  
                        <br>
                        <br>
                        
                        
                <div class="row">
                    <c:forEach items="${ list }" var="m">
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <c:if test="${ not empty at }">
                                    <c:forEach items="${ at }" var="at">
                                        <c:if test="${ m.marketNo == at.boardNo}">
                                                    <a href="detail.mk?marketNo=${ m.marketNo }" >
                                                        <img class="card-img-top" src="${ at.changeName }" style="width: 100%; height: 250px;" alt="">
                                                    </a>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            
                                <div class="card-body">
                                    <h6 class="card-title">
                                        <a href="">${ m.marketTitle }</a>

                                        <!--로그인시 찜하기 누른 상품에 찜을 표시해주기 / 비회원일시 찜한 마크는 전부 칠해져있지 않게-->
                                        <c:choose>
                                            <c:when test="${ empty loginUser }">
                                                <a id="marketMark" href="javascript:notMember();">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16"><path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/></svg>
                                                </a>
                                            </c:when>

                                            <c:otherwise>
                                                <c:choose>
                                                    <c:when test="${ mark.status == null || mark.status == 0 }">
                                                        <a id="marketMarkNotFill" href="javascript:clickMark(${ m.marketNo }, ${ loginUser.memNo });">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16"><path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/></svg>
                                                        </a>
                                                        <a style="display:none" id="marketMarkFill" href="javascript:clickunMark();">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bookmark-fill" viewBox="0 0 16 16"><path d="M2 2v13.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z"/></svg>
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a id="marketMarkFill" href="javascript:clickunMark();">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bookmark-fill" viewBox="0 0 16 16"><path d="M2 2v13.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z"/></svg>
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:otherwise>    
                                        </c:choose>
                                    </h6>

                                    <p>${ m.marketPrice } 원<br>
                                    ${ m.marketEnrollDate } <br>
                                    ${ m.marketCount }</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- /.row -->

            </form>  
            </div>
            <!-- /.col-lg-9 -->

             <!-- 페이지처리하는 영역-->
             <div id="market_page">
                <ul class="pagination justify-content-center">


                    <c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.mk?cpage=${ pi.currentPage - 1 }">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>


                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<li class="page-item"><a class="page-link" href="list.mk?cpage=${p}">${ p }</a></li>
                    </c:forEach>


                    <c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.mk?cpage=${ pi.currentPage + 1 }">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                    



                </ul>
            </div>


        </div>
        <!-- /.row -->

        </div>
        <!-- /.container -->

    </div>


    <script>

            //비회원 찜하기 클릭시 알럿창 띄워주는 함수
            function notMember(){

                alert('로그인 후 이용하실 수 있습니다');

            }


            //로그인한 회원이 찜하기 버튼 클릭시 
            function clickMark(marketNo, markMemNo){

                $.ajax({

                    url : "mark.mk",

                    data : {

                        boardNo : marketNo, 
                        memNo : markMemNo

                    },
                    success : function(status){

                        const mark = $(this);

                        $('#marketMarkNotFill').css('display', 'none');
                        $('#marketMarkFill').css('display', '');
                        

                    },

                    error : function(){
                        console.log('찜하기실패');
                    }


                    
                });

            }

    </script>




</body>
</html>