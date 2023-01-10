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
                width:80%;
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
                width:80%;
                margin:auto;
            }
            #searchForm>* {
                float:left;
                margin:5px;
            }
            
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
      

       
        <div class="content" align="center">

            <form action="">
               <br>
                <h2>프로그램</h2>
                <br>
                <select  name="condition">
                    <option value="ing">진행중</option>
                    <option value="end">마감</option>
                
                </select>
                <input type="text"  >
                <button  type="submit" style="width: 50px;" class="searchBtn">검색</button>

           </form>
          
            <br>
            <div class="innerOuter" style="padding:5% 10%;">

                

          
            <table id="boardList"  class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>지역</th>
                        <th>프로그램명</th>
                        <th>일정</th>
                        <th>모집인원</th>
                        <th>신청</th>
                        <th>찜</th>
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
                        <td class="test">${ p.signUp }</td>

                        <!-- <c:forEach items="${ markNoList }" var="m">
                            <c:choose>
                                <c:when test="${p.programNo eq m.boardNo }">
                                    <td class="sorry"><img class="heart"  src="resources/images/deleteheart.png" alt="${ p.programNo }"></td>
                                </c:when>

                                <c:otherwise>
                                    <td class="sorry"><img class="heart"  src="resources/images/heart2.png" alt="${ p.programNo }"></td>
                                </c:otherwise>

                            </c:choose>


                        </c:forEach> -->

                        <td  class="sorry"><img class="heart"  src="resources/images/deleteheart.png" alt="${ p.programNo }"></td>
                        
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
                       <li class="page-item "><a class="page-link" href="list.pr?cpage=${ pi.currentPage - 1 }">Previous</a></li>
                      </c:otherwise>   
                    </c:choose>
                    
                   <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                       <li class="page-item "><a class="page-link" href="list.pr?cpage=${p}">${ p }</a></li>
                   
                   </c:forEach>
                   
                   <c:choose>
                      <c:when test="${ pi.currentPage eq pi.maxPage }">
                         <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                      
                      </c:when>
                      <c:otherwise>
                      
                         <li class ="page-item"><a class="page-link" href="list.pr?cpage=${pi.currentPage + 1 }">NEXT</a>
                      </c:otherwise>
                      
                   </c:choose>
                </ul>
            </div>

            <script>


                 
            $(function(){
                $('.heart').click(function(){
                    var $btn1 = $(this);
                    console.log($(this).attr("alt"));
                    $.ajax({
                            url : 'wish.pr',
                            data :{
                                programNo : $(this).attr("alt")
                            },
                            
                            success: function() {
                                console.log($btn1);
                                $btn1.attr("src", "resources/images/heart2.png");
                                // if($('.heart').attr("src") == 'resources/images/deleteheart.png'){
                
                                // $('.heart').attr("src", "resources/images/heart2.png");
                                // } else {

                                //     $('.heart').attr("src", "resources/images/deleteheart.png");
                                // }
                            },

                            error:function(){
                                        console.log('ajax 통신 실패!');
                                    }


                    });
                });
            })


              
               $(function(){
                  $('#boardList>tbody>tr>td').not('.sorry').click(function(){
                     
                     //console.log($(this).parent().children());
                     
                     location.href = 'detail.pro?bno=' + $(this).parent().children().eq(0).text();
                        
                     
                  })
                  
               })

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

                
                // $('.heart').each(function() {
                //     <c:forEach items="${ markNoList }" var="m">
                //         if()

                //     </c:forEach>
                // });
               
            
            
            
            
            
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
       
       
          </script>
       

</body>
</html>