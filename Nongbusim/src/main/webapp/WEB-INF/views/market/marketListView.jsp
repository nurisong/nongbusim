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

                <!--onchange="changeMarketCategory()"-->
                <select id="marketCategory" name="marketCategory" style="width: 200px;" onchange="changeMarketCategory()">
                    <option value="모두" class="form-select" aria-label="Default select example" selected>모두</option>
                    <option value="농산물" class="form-select">농산물</option>
                    <option value="수산물" class="form-select">수산물</option>
                    <option value="축산물" class="form-select">축산물</option>
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
                        

            <script>

                $(function(){
                	
                     /*
                     if(category == '농산물'){
                    	 
                    	 if(category == '축산물'){
                             $('select[name="marketCategory"]').find('option[value="모두"]').attr("selected",true);         

                         }
                    	 
                     }else{
                         
                         $('select[name="marketCategory"]').find('option[value="${list[0].marketCategory}"]').attr("selected",true);

                     }
                     */
                        /*
                    	 
                    	 if(category == '축산물'){
                             $('select[name="marketCategory"]').find('option[value="축산물"]').attr("selected",true);         

                         }
                    	 else if(category == '농산물'){
                             $('select[name="marketCategory"]').find('option[value="농산물"]').attr("selected",true);         

                         }
                    	 else if(category == '수산물'){
                             $('select[name="marketCategory"]').find('option[value="수산물"]').attr("selected",true);         

                         }
                    	 else{
                             $('select[name="marketCategory"]').find('option[value="모두"]').attr("selected",true);         

                         }
                        */

                        
                        if('${list[0].marketCategory}' == '모두'){
                            
                            $('select[name="marketCategory"]').find('option[value="모두"]').attr("selected",true);         

    
                        }else{
                            
                            $('select[name="marketCategory"]').find('option[value="${list[0].marketCategory}"]').attr("selected",true);

                        }
                        
                });

                function changeMarketCategory(){

                    var changeCategory = '';

                    if($('#marketCategory').val() != null){

                        changeCategory = $('#marketCategory').val();
                    
                        if(changeCategory != '모두'){

                            location.href="listCatogory.mk?marketCategory=" + changeCategory;
                            /*location.href="list.mk?marketCategory=" + changeCategory;*/

                        }else{

                            location.href="list.mk?marketCategory=모두";

                        }


                    }

                    
                }

            </script>
                        
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

                                    <!--비회원 찜하기 클릭시 alert창
                                        <c:choose>
                                            <c:when test="${ empty loginUser }">
                                                <a id="marketMark" href="javascript:notMember();">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16"><path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/></svg>
                                                </a>
                                            </c:when>
                                            
                                            <c:otherwise>
                                                <c:set var="check" value="0" />
                                                <c:forEach items="${ mark }" var="mark">
                                                    <c:if test="${ m.marketNo == mark.boardNo}">
                                                        <c:set var="check" value="1" />
                                                        <a idx="${ m.marketNo}" id="marketMarkFill" onclick="clickunMark(${ m.marketNo }, ${ loginUser.memNo }); return false;">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bookmark-fill" viewBox="0 0 16 16"><path d="M2 2v13.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z"/></svg>
                                                        </a>       
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${ check != 1}">
                                                    <a idx="${ m.marketNo}" id="marketMarkNotFill" onclick="clickMark(${ m.marketNo }, ${ loginUser.memNo }); return false">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16">
                                                            <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
                                                        </svg>
                                                    </a>
                                                </c:if>
                                            </c:otherwise>    
                                        </c:choose>
                                    </h6> -->

                                    <p> 
                                        ${ m.marketTitle } <br>
                                        ${ m.marketPrice } 원<br>
                                        ${ m.marketEnrollDate } <br>
                                        ${ m.marketCount }
                                    </p>
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

        /*
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

                            if(status == "success"){
                                
                                
                                var markFill =  $('#marketMarkFill').children().clone(true);

                                $("#marketMarkNotFill").children().remove();
                                $("#marketMarkNotFill").append(markFill);

                                
                            }
                            
                            //반복문을 돌면서 마켓넘버와 맞는 게시물의 북마크에만 표시해주기

                        },

                        error : function(){
                            console.log('찜하기실패');
                        }


                        
                    });

                    return false;
                
            }

            //로그인한 회원이 찜하기 해제 버튼을 누른 경우
            function clickunMark(marketNo, markMemNo){


                $.ajax({

                    url : "unMark.mk",

                    data : {

                        boardNo : marketNo, 
                        memNo : markMemNo

                    },
                    success : function(status){

                            if(status == "success"){
                                
                                var markNotFill = $('#marketMarkNotFill').children().clone(true);

                                
                                $("#marketMarkFill").children().remove();
                                $("#marketMarkFill").append(markNotFill);

                                
                            }


                    },

                    error : function(){
                        console.log('찜하기실패');
                    }


                    
                    
                });
                
                return false;
            }
        */

    </script>




</body>
</html>