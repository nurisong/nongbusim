<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 리스트</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                                                                                       
    <style>

            .content {
                background-color:rgb(247, 245, 245);
                width:100%;
                margin:auto;
            }
            .innerOuter {
                border:1px solid lightgray;
                width:80%;
                margin:auto;
                padding:5% 10%;
                background-color:white;
            }
    
            #boardList {text-align:center;}
            #boardList>tbody>tr:hover {cursor:pointer;}
    
            #pagingArea {width:fit-content; margin:auto;}
            
            #searchForm {
                width:90%;
                margin:auto;
            }
            /* #searchForm {
                float:left;
                margin:5px;
            } */
            
            .heart{
            
            width: 30px;
            height: 30px;
         
            top:20px;
            right : 5px;
            }
            .select {width:20%;}
            .text {width:53%;}
            .searchBtn {width:20%;}
        </style>
</head>
<body>
   <jsp:include page="../common/menubar.jsp" />

        <div>
                        
         
        </div>
      

       
        <div class="content" align="center">


            <form  id="searchForm" action="list.pr" method="get">
                <br>
                <h2>체험</h2>
                <br>
                
                <input type="text" class="search" id="search" name="keyword">
                <button  type="submit" style="width: 50px;" class="searchBtn">검색</button>

            </form>

            
          
            <br>
            <div class="innerOuter" style="padding:5% 10%;">

        

                
			<c:if test="${ not empty loginUser.farmerCode}">
            	<a class ="btn btn-secondary" style="float:right;" href="enrollForm.pr">프로그램 등록</a>
                  </c:if>

            <table id="boardList"  class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>지역</th>
                        <th>프로그램명</th>
                        <th>일정</th>
                        <th>모집인원</th>
                        <th>신청</th>
                        <c:if test="${ not empty loginUser}">
                        <th>찜</th>
                        </c:if>
                    </tr>
                </thead>
                <tbody>
                    
                    <c:forEach items="${ programlist }" var="p">
                  
                    <tr>
                
                        <td class="bno" hidden>${ p.programNo }</td>
                        <td class="test">${ p.programLocation }</td>
                        <td class="test">${ p.programName }</td>
                        <td class="test">${ p.programPlan }</td>
                        <td class="test">${ p.headcount }</td>



                        <c:choose>
                            <c:when test="${p.headcount le p.nowHeadCount}">
                                <td class="test">마감</td>

                            </c:when>
                            
                            <c:otherwise>

                                <td class="test">진행중</td>
                            </c:otherwise>

                        </c:choose>
                        
                        <c:if test="${ not empty loginUser}">
                              <td  class="sorry"><img class="heart"  src="resources/images/deleteheart.png" alt="${ p.programNo }"></td>
                        </c:if>
                     
                     </tr>
                       
                    </c:forEach>
                    
                </tbody>
            </table>
            </div>
        </div>
        
        
         <div id="pagingArea">
                <ul class="pagination">
                
                   <c:choose>
                      <c:when test="${pi.currentPage eq 1 }">
                             <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                      </c:when>
                      <c:otherwise>
                       <li class="page-item"><a class="page-link" href="list.pr?cpage=${ pi.currentPage - 1 }" >Previous</a></li>
                      </c:otherwise>   
                    </c:choose>
                    
                   <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                       <li class="page-item "><a class="page-link" href="list.pr?cpage=${p}" >${ p }</a></li>
                   
                   </c:forEach>
                   
                   <c:choose>
                      <c:when test="${ pi.currentPage eq pi.maxPage }">
                         <li class="page-item disabled"><a class="page-link" href="#" >Next</a></li>
                      
                      </c:when>
                      <c:otherwise>
                      
                         <li class ="page-item"><a class="page-link" href="list.pr?cpage=${pi.currentPage + 1 }">NEXT</a>
                      </c:otherwise>
                      
                   </c:choose>
                </ul>
            </div>

            <script>


                 
            $(function(){

                <c:if test="${not empty loginUser}">
                $('.heart').click(function(){
                    var $btn1 = $(this);
                    // console.log($(this).attr("alt"));

                    //console.log($(this).attr("src"));


                    if($(this).attr("src") == "resources/images/deleteheart.png"){

                        $.ajax({
                            url : 'wish.pr',
                            data :{
                                programNo : $(this).attr("alt"),
                                memNo : ${loginUser.memNo}
                                
                            },
                            
                            success: function() {
                                console.log($btn1);
                                $btn1.attr("src", "resources/images/heart2.png");
                            },

                            error:function(){
                                        console.log('ajax 통신 실패!');
                                    }
                    });

                    }else{

                        $.ajax({
                            url : 'wishDelete.pr',
                            data :{
                                programNo : $(this).attr("alt"),
                                memNo : ${loginUser.memNo}
                            },
                            
                            success: function() {
                                console.log($btn1);
                                $btn1.attr("src", "resources/images/deleteheart.png");
                        
                            },

                            error:function(){
                                        console.log('ajax 통신 실패!');
                                    }
                    });

                    }
                });
                </c:if>
            })


 

               $(function(){
                  $('#boardList>tbody>tr>td').not('.sorry').click(function(){
                     
                     //console.log($(this).parent().children());
                     
                     location.href = 'detail.pro?bno=' + $(this).parent().children().eq(0).text();          
                  })
           




                // mark 테이블에서 조회해서 markNoList에서 borarNo 가져와서 현재 하트 IMG ALT에 있는 programNo랑 비교헤서 하트 바꿔줌,  비교해서 같은 값이 있으면 check값 증가
                $('.heart').each(function() {


                    var check2 = 0;
                   
                    
                    <c:forEach items="${ markNoList }" var="m">
                        if(${m.boardNo} == $(this).attr("alt")) {check2 = check2 + 1}
                       

                    </c:forEach>

                    console.log(check2);
                    
                    if(check2 > 0) {
                        $(this).attr("src", "resources/images/heart2.png");
                    }
                    else {
                        $(this).attr("src", "resources/images/deleteheart.png");
                    }
                });   

               });

               // $().attr("alt")

            //    $(function() {
            //             var count = 0;
            //             <c:forEach items="${ markNoList }" var="m">
            //                 <c:if test="${m.boardNo eq p.prgramNo }">
            //                     count++;
            //                 </c:if>
            //             </c:forEach>
            //             console.log(count);
            //             if(count > 0) {
            //                 $('.heart').attr("src", "resources/images/heart2.png");
            //             } else {
            //                 $('.heart').attr("src", "resources/images/deleteheart.png")
            //             }
            //         });
            
     
            // 찜하기 클릭/해제
                // $(function() {
    
                // $('.heart').click(function() {
                //     console.log($(this).attr("src"));

                //     if($(this).attr("src") == 'resources/images/deleteheart.png'){
       
                //        $(this).attr("src", "resources/images/heart2.png");
                //      } else {

                //         $(this).attr("src", "resources/images/deleteheart.png");
                //      }
                // });
       
                // });   

        $(function(){
            console.log('${map.keyword}');
            $('.search').val('${map.keyword}');
          
        })
          </script>
</body>
</html>