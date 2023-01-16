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
      z-index:100;

    }
    
    #modal h2 {
      margin:0;   
    }
    
    #modal button {
      border: none;
      display: inline-block;
      width: 100px;
      
    }
    
    #modal .modal_content{
      transform: translate(0%, -300%);
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

    #modal #updateCommentContent{

        margin-left: 20px;

    }

    #marketDetalcontent>h1 a:hover {
        cursor: pointer;
    }

    #marketDetalcontent>h1 a{
        color : black;
    }

    #replyArea>thead>tr>td {
        padding-left: 40px;
        padding-top: 30px;
        padding-bottom: 30px;
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


                <div id="marketDetalcontent" class="col-lg-6">
                    <h1 class="font-weight-bold"> ${ list.marketTitle }
                        <c:choose>
                            <c:when test="${ empty loginUser }">
                                <a id="marketMark" href="javascript:notMember();">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16"><path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/></svg>
                                </a>
                            </c:when>

                            <c:otherwise>
                                <a id="markNotFill">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16"><path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/></svg>
                                </a>
                                <a id="markFill" style="display: none;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-bookmark-fill" viewBox="0 0 16 16"><path d="M2 2v13.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z"/></svg>
                                </a>
                            </c:otherwise>
                        </c:choose>


                        <!-- 북마크 관련 스크립트 -->
                        <script>

                            $(function(){
                                
                                detailViewMark();

                                function detailViewMark(){
                                    
                                    //상세조회안으로 들어왔을 때, 회원이 찜한 상품에는 북마크 보여주기 
                                    if('${mark.status}' == 1){
                                        
                                        $('#markNotFill').css('display', 'none');
                                        $('#markFill').css('display', '');
                                        
                                    }
                                    
                                }
                                
                                
                                
                            });
                            
                            
                            //비회원 찜하기 클릭시 알럿창 띄워주는 함수
                            function notMember(){
                
                                alert('로그인 후 이용하실 수 있습니다');
                
                            }
                            

                            //북마크 추가하기 
                            $('#markNotFill').on('click', function(){ 


                                    $.ajax({
                                        
                                        url : "mark.mk",

                                        data : {

                                            boardNo : '${market.marketNo}', 
                                            memNo : '${market.memNo}'

                                        },
                                        success : function(status){

                                            if(status == "success"){
                                                
                                                alert('찜하기가 완료되었습니다.');
                                                $('#markNotFill').css('display', 'none');
                                                $('#markFill').css('display', '');
                                            
                                                
                                            }

                                        },

                                        error : function(){
                                            console.log('찜하기실패');
                                        }
                                    });

                                });


                            //북마크 해제하기
                            $('#markFill').on('click', function(){


                                $.ajax({
                                        
                                        url : "unMark.mk",

                                        data : {

                                            boardNo : '${market.marketNo}', 
                                            memNo : '${market.memNo}'

                                        },
                                        success : function(status){

                                            if(status == "success"){
                                                
                                                alert('찜하기가 취소되었습니다.');
                                                $('#markNotFill').css('display', '');
                                                $('#markFill').css('display', 'none');
                                            
                                                
                                            }

                                        },

                                        error : function(){
                                            console.log('찜하기실패');
                                        }
                                    });  





                            });
                            

                        </script>



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
                        <a class="btn btn-primary btn-sm" onclick="postFormSubmit(1);">수정</a>
                        <a class="btn btn-danger btn-sm" onclick="postFormSubmit(2);">삭제</a>
                    </c:if>

                    <form action="" method="post" id="postForm">
                        <input type="hidden" name="marketNo" value="${ list.marketNo }" />
                    </form>

                    <!-- 게시글 수정/삭제 이동 관련 스크립트 -->
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

            <hr>

            
                
    
            <table id="replyArea" class="table" align="center">
                <thead>
                    <c:choose>
                        <c:when test="${ not empty loginUser }">
                            <tr>
                                <td>
                                    <!--<a onclick="secretComment();">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16"><path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/></svg>
                                    </a>-->
                                    <checkbox>비밀댓글</checkbox>
                                </td>
                                <th>
                                    <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
                                </th>
                                <th colspan="3" style="vertical-align:middle">
                                    <button class="btn btn-success" style="width: 80px; height:50px;" onclick="addComment()";>등록</button>
                                </th>
                            </tr>
                        </c:when>



                        <c:otherwise>
                            <tr>
                                <td>
                                    <a href="">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16"><path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/></svg>
                                    </a>
                                </td>
                                <th>
                                    <textarea class="form-control" cols="55" rows="2" style="resize:none; width:100%;" readonly>로그인 후 이용해주세요.</textarea>
                                </th>
                                <th colspan="3" style="vertical-align:middle">
                                    <button class="btn btn-success" style="width: 80px; height:50px;" disabled>등록</button>
                                </th>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                    <tr>
                        <td style="padding-left: 15px;" colspan="5">댓글(<span id="rcount">0</span>)</td>
                    </tr>
                </thead>
                <tbody>
                    <!--
                    <tr>
                        <th>user02</th>
                        <td>비밀댓글입니다.
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16"><path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/></svg>
                        </td>
                        <td>2020-03-12</td>
                    </tr>
                    -->
                </tbody>
            </table>

            <br>
            <br>
            <br>

            
            <!-- 댓글용 모달창 -->
            <div id="modal">
            
                <div class="modal_content">
                    
                    <h6 id="memId"></h6>

                    <br>
                    
                    <textarea  id="updateCommentContent" cols="50" rows="5" style="resize:none;"></textarea>

                    <br>
                    <button type="submit" class="btn btn-sm">수정</button>
                    <button type="button" class="btn btn-sm" id="modal_close_btn">취소</button>
                
                </div>
            
                <div class="modal_layer"></div>

            </div>


        </div>


            
        <!-- 댓글 관련 스크립트 -->
        <script>

            var secret = 'false';
                
                //댓글 리스트 불러오기 함수 -> 이 문서가 다 로딩되면 실행되어야 함

                $(function(){

                    selectCommentList();

                });


                //비밀댓글 작성용 ajax
                function secretComment(){

                    var secret = 'true';
                    //console.log(secret);


                }

                //댓글 작성용 ajax
                function addComment(){
                    
                    if($('#content').val().trim() != ''){
                        $.ajax({

                            url : 'insertComment.mk',
                            data : {
                                
                                memNo : '${ loginUser.memNo }',
                                boardNo : ${ list.marketNo },
                                boardType : 'mk',
                                commentContent : $('#content').val()

                            },

                            success : function(status){
                                if(status == 'success'){
                                    selectCommentList();
                                    $('#content').val('');

                                }

                            },
                            error : function(){
                                console.log('실패');
                            }
                            

                        });
                    }


                };

                //댓글 조회용 ajax
                function selectCommentList(){

     
                    $.ajax({
                        
                        url : 'listComment.mk',
                        data : {
                            boardNo : ${list.marketNo},
                            boardType : 'mk'
                        },
                        success : function(cList){

                            let value = '';

                            if(cList.length != 0) {
                            
                                for(let i in cList){

                                    if()

                                        value += '<tr>'
                                            + '<th>' + cList[i].memId + '</th>'
                                            + '<th>' + cList[i].commentContent + '</th>'
                                            + '<th>' + cList[i].commentEnrollDate + '</th>';
                                            
                                            if(cList[i].memId=='${loginUser.memId}') {
                                            value +=  '<th>'
                                                +   '<button class="btn btn-sm" onclick="deleteComment(' + cList[i].commentNo + ')"> X </button>'
                                                +   '</th>'
                                                +   '<th>'
                                                +   '<button class="btn btn-sm" onclick="updateComment(' + cList[i].commentNo + ',' + cList[i].memNo + ',' + "'" + cList[i].commentContent + "'" + ')"> 수정 </button>'
                                                +   '</th>'

                                            }

                                        value += '</tr>';
                                }

                            } else {

                                value += '<tr>'
                                       + '<th colspan="3">' + '등록된 댓글이 없습니다.' + '</th>'
                                       + '</tr>';


                            }

                            

                            $('#replyArea tbody').html(value);
                            $('#rcount').text(cList.length);


                        },
                        error : function(){

                            console.log('댓글목록조회실패');
                        
                        }

                    });

                };





                //댓글 삭제용 ajax
                function deleteComment(num){ 

                    $.ajax({

                        url : 'deleteComment.mk',

                        data : { 
                            commentNo : num,
                            boardType : 'mk'
                        },

                        type : 'POST',

                        success : function(status){

                            if(status == 'success'){
                                selectCommentList(); 
                            }
                            

                        },
                        error : function(){

                            console.log('실패');

                        }


                    });
                    
                }

                
                //댓글 수정용 ajax

                function updateComment(commentNo, memNo, content){
                    
                    secretComment(commentNo, memNo, content);

                    <!-- 댓글 모달창 나타나는 스크립트 -->
                    function secretComment(commentNo, memNo, content){
            
                        $('#modal').css('display', 'block');

                        $('#updateCommentContent').text(content);
                        
                        

                        $('#modal_close_btn').click(function(){
    
                            $('#modal').css('display', 'none');
    
                        });
                }
            }

        </script>



            <!-- 댓글 페이지처리하는 영역
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
            -->


</body>
</html>