<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/aa839e973e.js" crossorigin="anonymous"></script>  
<title>마이페이지-참여 프로그램</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>

        #myPage { 
                width: 1200px;
                margin: auto;
            }
        
        .outer {
            margin : auto;
        }
        
        
       * {
          box-sizing: border-box;
        }
        
        .menuButton{ 
            background-color: #bed655;
               color: maroon;
               width: 200px;
               padding: 5px 10px;
               text-align: center;
               text-decoration: none;
               display: inline-block;
               cursor: pointer;
               border: none;
               
        }
        
        .menubutton:hover {background-color: lightgreen}
    
    
        .menubutton:active {
        
          background-color: #3e8e41;	
          box-shadow: 0 5px #666;	
          transform: translateY(4px);	
        }


        /* 리스트 스타일 시작 */
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

            /* 모달 영역 스타일 시작 */
            #my_modal {
                display: none;
                width: 500px;
                padding: 20px 60px;
                background-color: #fefefe;
                border: 1px solid #888;
                border-radius: 3px;
            }

            #my_modal .modal_close_btn {
                position: absolute;
                top: 10px;
                right: 10px; }

         /* 별점 스타일 */

            .star-rating {
            display: flex;
            flex-direction: row-reverse;
            font-size: 2.25rem;
            line-height: 2.5rem;
            justify-content: space-around;
            padding: 0 0.2em;
            text-align: center;
            width: 5em;
            }
            
            .star-rating input {
            display: none;
            }
            
            .star-rating label {
            -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
            -webkit-text-stroke-width: 2.3px;
            -webkit-text-stroke-color: #2b2a29;
            cursor: pointer;
            }
            
            .star-rating :checked ~ label {
            -webkit-text-fill-color: gold;
            }
            
            .star-rating label:hover,
            .star-rating label:hover ~ label {
            -webkit-text-fill-color: #fff58c;
            }
       
    </style>
    
</head>
<body>
    <jsp:include page="../common/menubar.jsp" />
    <div id="myPage">
    
    
        <h3>마이페이지</h3>
        <hr>
        <div class="menuArea"  style="width:200px; height:120px; border:1px solid red; float:left;">
            <a class="menuButton" href="">내가 작성한 게시글</a><br>
            <a class="menuButton" href="">회원정보 수정</a><br>
            <a class="menuButton" href="">찜한 게시글</a><br>
            <a class="menuButton" href="">참여 프로그램</a><br>   
        </div>

        <div class="content" align="center">

            <h2>내가 참여한 프로그램</h2>
          
            <br>
            <div class="innerOuter" style="padding:5% 10%;">
          
            <table id="boardList"  class="table table-hover" align="center">
                <thead>
                    <tr>
                        <td>No</td>
                        <th>프로그램명</th>
                        <th>교육기간</th>
                        <th>상세보기</th>
                        <th>후기</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <c:forEach items="${ myProgramList }" var="p">
                    	<tr>
                            <td>${p.programNo}</td>
                    	   <td>${ p.programName }</td>
                    	   <td>${p.programPlan}</td>
                    	   <td><button>상세보기</button></td>
                    	   <td><button class="reviewWrite" onclick="modal('my_modal','${p.programName}','${p.programNo}');">후기작성</button></td>
                        </tr>
                    
                    </c:forEach>
                    
                </tbody>
            </table>
            </div>
        </div>
        
        
        

            <!-- 모달 영역 -->


            <div id="my_modal">

                <form action="reviewInsert.re" method="post" enctype="multipart/form-data">
                    <h2 align="center">후기작성</h2>
                    <table style="width: 400px; height:200px;">
                        <tr>
                           <td>프로그램명 : <input id="programName" type="text" value=""></td>
                            
                            <td><input name="programNo"  id="programNo" type="text" value="" hidden></td>
                         
                        </tr>
                        <tr>
                            <td><input type="text" name="reviewContent"style="width: 400px; height: 100px;"></td>
                            
                        </tr><br>
                       
                        <tr>
                            <td><input type="file" name="upfile"></td>
                        </tr><br>
                    </table>
    
                    <!-- 별점 -->
                    <div class="star-rating space-x-4 mx-auto">
                        <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
                        <label for="5-stars" class="star pr-4">★</label>
    
    
                        <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
                        <label for="4-stars" class="star">★</label>
    
    
                        <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
                        <label for="3-stars" class="star">★</label>
    
    
                        <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
                        <label for="2-stars" class="star">★</label>
    
    
                        <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
                        <label for="1-star" class="star">★</label>
                    </div>
            
                    <a class="modal_close_btn">  <img  src="resources/images/close.png" style="width: 30px; height: 30px;"></a>
                    <br>
                    <div align="center">
                  
                        <button type="submit">작성</button>
    
                    </div>




                </form>
              
                
            </div>

</body>


    <!-- 페이지처리하는 영역-->
    <div id="pagingArea">
        <ul class="pagination">
        
           <c:choose>
              <c:when test="${pi.currentPage eq 1 }">
                     <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
              </c:when>
              <c:otherwise>
               <li class="page-item "><a class="page-link" href="myProgramlist.re?cpage=${ pi.currentPage - 1 }" >Previous</a></li>
              </c:otherwise>   
            </c:choose>
            
           <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
               <li class="page-item "><a class="page-link" href="myProgramlist.re?cpage=${p}" >${ p }</a></li>
           
           </c:forEach>
           
           <c:choose>
              <c:when test="${ pi.currentPage eq pi.maxPage }">
                 <li class="page-item disabled"><a class="page-link" href="#" >Next</a></li>
              
              </c:when>
              <c:otherwise>
              
                 <li class ="page-item"><a class="page-link" href="myProgramlist.re?cpage=${pi.currentPage + 1 }">NEXT</a>
              </c:otherwise>
              
           </c:choose>
        </ul>
    </div>


<script>
    function modal(id, programName,programNo) {
        console.log(programName);
        console.log(id);
        console.log(programNo);
        $('#programName').val(programName);
        $('#programNo').val(programNo);
        var zIndex = 9999;
        var modal = document.getElementById(id);

        // 모달 div 뒤에 희끄무레한 레이어
        var bg = document.createElement('div');
        bg.setStyle({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.4)'
        });
        document.body.append(bg);

        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        modal.querySelector('.modal_close_btn').addEventListener('click', function() {
            bg.remove();
            modal.style.display = 'none';
        });

        modal.setStyle({
            position: 'fixed',
            display: 'block',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        });
    }

    // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
    Element.prototype.setStyle = function(styles) {
        for (var k in styles) this.style[k] = styles[k];
        return this;
    };


    //후기 작성 버튼 클릭시
   
    // $('.reviewWrite').click(function(){
                     
    //      location.href = 'reviewEnrollForm.re?bno=' + $(this).eq(0).text();
                        
                     
    //  })
    


</script>
</html>