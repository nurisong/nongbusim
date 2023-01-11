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
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Fotorama from CDNJS, 19 KB -->
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>

<style>

    body{
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
	}


    #modal {
     
      display: none;
      position:relative;
      width:100%;
      height:100%;
      z-index:1;

    }
    
    #modal h2 {
      margin:0;   
    }
    
    #modal button {
      display:inline-block;
      width:100px;
      margin-left:calc(100% - 100px - 10px);
    }
    
    #modal .modal_content {
      transform: translate(0%, -400%);
      width: 500px;
      margin-top: 100px;
      margin:100px auto;
      padding:20px 10px;
      background:#fff;
      box-shadow : 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)
    }
    
    #modal .modal_layer {
      position:fixed;
      top:0;
      left:0;
      width:100%;
      height:100%;
      background:rgba(0, 0, 0, 0.5);
      z-index:-1;
    }   
    </style>



</head>
<body>


    <jsp:include page="../common/menubar.jsp" />


         <!-- Page Content-->
         <div class="container px-4 px-lg-5">
            
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-6">
                    <div class="fotorama">
                        <c:forEach items="${ at }" var="at" >
                            <div>
                                <img src="${at.changeName}" style="width: 100%; height: 300px;" />
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="col-lg-6">
                    <h1 class="font-weight-bold"> ${ list.marketTitle }
                        <a href="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16"><path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/></svg>
                        </a>
                    <h3>
                        ${ list.marketPrice }
                    </h3>
                    <h6>
                        ${ list.marketEnrollDate }
                    </h6>
                    </h1>
                    <p>
                        ${ list.marketIntro }
                    </p>
                    <c:if test="${ loginUser.memNo == list.memNo }" >
                        <a class="btn btn-primary btn-sm" onclick="postFormSubmit(1);">수정하기</a>
                        <a class="btn btn-danger btn-sm" onclick="postFormSubmit(2);">삭제하기</a>
                    </c:if>

                    <form action="" method="post" id="postForm">
                        <input type="hidden" name="marketNo" value="${ list.marketNo }" />
                    </form>

                    <script>
                        function postFormSubmit(num){
                            if(num == 1){ //수정하기
                                $('#postForm').attr('action', 'updateForm.mk').submit();
                            } else{	//삭제하기
                                $('#postForm').attr('action', 'delete.mk').submit();
                            }
                        }
                    </script>

                </div>
            </div>
          
            <hr>

            <div>

                ${ list.marketContent }

            </div>

            <table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
                        <td>
                            <a href="">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16"><path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/></svg>
                            </a>
                        </td>
                        <th>
                            <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
                        </th>
                        <th style="vertical-align:middle">
                            <button class="btn btn-success" >등록하기</button>
                        </th>
                    </tr>
                    <tr>
                        <td colspan="3">댓글(<span id="rcount">3</span>)</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>user02</th>
                        <td>비밀댓글입니다.
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16"><path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/></svg>
                        </td>
                        <td>2020-03-12</td>
                    </tr>
                    <tr>
                        <th>user01</th>
                        <td>재밌어요</td>
                        <td>2020-03-11</td>
                    </tr>
                    <tr>
                        <th>admin</th>
                        <td>댓글입니다!!</td>
                        <td>2020-03-10</td>
                    </tr>
                </tbody>
            </table>

            <!-- 페이지처리하는 영역-->
            <div id="market_page">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </div>
            



            <!-- 댓글용 모달창 -->
            <div id="modal">
   
                <div class="modal_content">
                    <h2>모달 창</h2>
                   
                    <p>모달 창 입니다.</p>
                   
                    <button type="button" id="modal_close_btn">X</button>
                   
                </div>
               
                <div class="modal_layer"></div>
            
            </div>



        </div>

    <!-- 댓글 모달창 나타나는 스크립트 -->
    <script>

        $(function(){

            secretComment();

        });

        function secretComment(){
                

                $('#replyArea>tbody>tr').click(function(){

                    $('#modal').css('display', 'block');

                });

                $('#modal_close_btn').click(function(){

                    $('#modal').css('display', 'none');

                });

            }

    </script>

</body>
</html>