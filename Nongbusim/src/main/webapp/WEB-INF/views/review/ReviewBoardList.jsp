<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기</title>

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
    
    .thumbnail{
    
    width: 50px;
    height: 50px;
 
    top:20px;
    right : 5px;
    }
    .select {width:20%;}
    .text {width:53%;}
    .searchBtn {width:20%;}

/* 모달 영역 스타일 시작 */
            #my_modal {
                display: none;
                width: 800px;
                padding: 20px 60px;
                background-color: #fefefe;
                border: 1px solid #888;
                border-radius: 3px;
            }

            #my_modal .modal_close_btn {
                position: absolute;
                top: 10px;
                right: 10px; }

    
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp" />
 


    <div class="content" align="center">
     

        <br>
        <div class="innerOuter" style="padding:5% 10%;">

        <table id="boardList"  class="table table-hover"  style="text-align: left;">
            <thead>
                <tr >
                    프로그램 후기
                </tr>
                <br><br>
            </thead>
            <tbody>
                
                <c:forEach items="${ reviewList }" var="r">
                    <tr  onclick="modal('my_modal','${r.programName}','${r.reviewContent}','${r.changeName}','${r.reviewEnrollDate}')" >
                        <td style="width:10px;"><img class="thumbnail" src="${r.changeName}" alt=""></td>
                        <td style="width: 480px;">
                            프로그램명 : ${r.programName}<br>
                             ${r.reviewContent}<br>
                             ${r.reviewEnrollDate}

                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${r.rating eq 5}">
                                    ⭐⭐⭐⭐⭐ 😁
                                </c:when>

                                <c:when test="${r.rating eq 4}">
                                    ⭐⭐⭐⭐☆ 😊
                                </c:when>

                                <c:when test="${r.rating eq 3}">
                                    ⭐⭐⭐☆☆ 🙂
                                </c:when>

                                <c:when test="${r.rating eq 2}">
                                    ⭐⭐☆☆☆ 😐
                                </c:when>

                                <c:otherwise>
                                    ⭐☆☆☆☆ 😤
                                </c:otherwise>
                            </c:choose>
                        </td> 

                    </tr>
                </c:forEach>
                
            </tbody>
        </table>

        
       
    </div>

    <!-- 페이지처리하는 영역-->
    <div id="pagingArea">
        <ul class="pagination">
        
           <c:choose>
              <c:when test="${pi.currentPage eq 1 }">
                     <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
              </c:when>
              <c:otherwise>
               <li class="page-item "><a class="page-link" href="list.re?cpage=${ pi.currentPage - 1 }" >Previous</a></li>
              </c:otherwise>   
            </c:choose>
            
           <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
               <li class="page-item "><a class="page-link" href="list.re?cpage=${p}" >${ p }</a></li>
           
           </c:forEach>
           
           <c:choose>
              <c:when test="${ pi.currentPage eq pi.maxPage }">
                 <li class="page-item disabled"><a class="page-link" href="#" >Next</a></li>
              
              </c:when>
              <c:otherwise>
              
                 <li class ="page-item"><a class="page-link" href="list.re?cpage=${pi.currentPage + 1 }">NEXT</a>
              </c:otherwise>
              
           </c:choose>
        </ul>
    </div>

    <div id="my_modal">
        <table style="width: 700px; height:200px;">
            <tr>
                <td style="width:50px;">작성자 : user01</td>
                <td style="width: 200px;" id="reviewEnrollDate"></td>
             
              
            </tr>
            <tr>
                <td style="width: 500px;">프로그램명 : <input type="text" id="programName" name="programName" value="" readonly>  </td>
            </tr>
            <br>
            <tr>
                <td><input style="width:600px; height:200px;" type="text" id="reviewContent" name="reviewContent" value=""  readonly></td>
            </tr><br>
         <br>
        </table>

        <div align="center">
            <img class="thumbnail" id="image" src="resources/images/딸기1.jpg" style="width: 300px; height: 200px;">

        </div>

        <a class="modal_close_btn">  <img  src="resources/images/close.png" style="width: 30px; height: 30px;"></a>
        <br>
        <div align="center">
            <button style="background-color: rgb(103, 141, 208);">수정</button>
            <button style="background-color: rgb(220, 112, 112);">삭제</button>

        </div>
        
    </div>

    

 

    <script>
        function modal(id,programName,reviewContent,image,reviewEnrollDate) {


            console.log(programName);
            console.log(reviewContent);
            
            var zIndex = 9999;
            var modal = document.getElementById(id);

             $('#programName').val(programName);
             $('#reviewContent').val(reviewContent);
             $('#image').attr("src",image);
             $('#reviewEnrollDate').html(reviewEnrollDate);

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

    
    </script>

    



	

</body>
</html>