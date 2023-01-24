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

<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
<style>
    .outer{
        /* background-color: rgb(234, 241, 234); */
        font-family: 'Pretendard-Regular';
        padding: 80px 150px;
    }
    .top-area, .botton-area, .fammer-area{
        background-color: white;
        padding: 50px 100px;
        border-radius: 20px;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);
        margin-bottom: 100px;
        width: 90%;
    }
    #main-img{
        width: 80%;
        margin-bottom: 10px;
    }
    #main-img>img{
        width: 100%;
    }
    .btn-area{
        width: 90%;
        margin-bottom: 100px;
    }
    .btn-area>span{
        margin: 35px;
    }
    .btn-area>span>a>img{
        width: 140px;
    }
    .top-area>div, .botton-area>div, .fammer-area>div{
        display: inline-block;
    }
    #info-img{
        width: 30%;
        height: 100px;
        /* background-color: aqua; */
    }
    
    #program-area{
        width: 50%;
        /* background-color: aqua; */
        float: right;
    }
    /* #clear{
        width: 5%;
    } */
    #info-img img{
        width: 100%;
    }
    #board-area{
        width: 50%;
    }
    #market-area{
        width: 50%;
        float: right;
    }
    #market-area img{
        width: 100%;
    }

    #dairy-area{
        width: 50%;
    }
    #account-area{
        width: 50%;
        float: right;
    }


</style>
</head>
<body>
	<jsp:include page="WEB-INF/views/common/menubar.jsp" />

    <div class="outer" align="center">

        <div id="main-img">
            <img src="resources/images/로고1.jpg">
        </div>

        <div class="btn-area">
            <span><a href="list.fm"><img src="resources/images/버튼1.jpg"></a></span>
            <span><a href="list.pr"><img src="resources/images/버튼2.jpg"></a></span>
            <span><a href=""><img src="resources/images/버튼3.jpg"></a></span>
            <span><a href="list.mk?marketCategory=모두"><img src="resources/images/버튼4.jpg"></a></span>
            <span><a href="list.re"><img src="resources/images/버튼5.PNG"></a></span>
        </div>

        <c:if test="${loginUser.memStatus eq 'F'}">
            <div class="fammer-area">
                <div id="dairy-area">
                    <h3>영농일지</h3><br>
                </div>
    
                <div id="account-area">
                    <h3>가계부</h3><br>
                </div>
            </div>
        </c:if>

        <div class="top-area">
            <div id="info-img">
                <h3>농업정보</h3><br>
                <div class="fotorama">
                    <img src="resources/images/농사정보1.jfif">
                    <img src="resources/images/농사정보1.jfif">
                    <img src="resources/images/농사정보1.jfif">
                </div>
            </div>

            <div id="program-area">
                <h3>인기있는 체험</h3>
                <a href="list.pr" style="float:right; color:lightgray;">더보기 >></a>
                <br><br>
                <table id="boardList" class="table table-hover" align="center">
                    <thead>
                        <tr>
                            <th>프로그램명</th>
                            <th>일정</th>
                            <th>강사</th>
                            <th>신청자수</th>
                           
                        </tr>
                    </thead>

                    <tbody>
                         
                        <!-- 현재 신청자 수가  높은 프로그램 뿌리기 (ajax이용해서) -->
                    </tbody>

                </table>
                <br><br>


            </div>

        </div>

        <div class="botton-area">
            <div id="board-area">
                <h3>농사 게시글</h3><br>
            </div>

            <div id="market-area">
                <h3>농작물 거래</h3><br>
                    <div id="market-content">

                        <h5>게시글 타이틀</h5>
                        <div class="fotorama">
                            <img src="">
                        </div>
                        <div>
                        </div>

                    </div>

            <script>

                // 마켓 게시물 불러오기
                $(function(){
                    $.ajax({
                        url : 'main.mk',
                        type : post,
                        success : function(list){
                            var result = '';
                            if(list != null){
                                for(var i in list){
                                    
                                    
    
    
                                };
                            }
                            
                            $('#market-content').html(result);
                            
                        },

                        error : function(){
                        console.log('불러오기 실패');
                        }

                    }); 

                });



                // 영준 - 신청자 많은 프로그램 불러오기
                $(function(){
                    topProgramList();
                    
                    /*
                    $('#boardList>tbody>tr').click(function(){
                        location.href = 'detail.bo?bno=' +$(this).children().eq(0).text();
                    });
                    */
                    
                    //동적으로 만들어진 요소에 이벤트 부여방법 *******************
                    $(document).on('click','#boardList>tbody>tr',function(){
                        location.href = 'detail.pro?bno=' +$(this).children().eq(0).text();
                        
                    })
                    
                    
                    
                });
                
                function topProgramList(){
                    
                    $.ajax({
                        url: 'topList.pr',
                        success : function(data){
                            
                            console.log(data);
                          
                            
                            let value = '';
                            for(let i in data){

                               
                                value += '<tr>'
                                    +'<td hidden>' + data[i].programNo + '</td>'
                                    +'<td>' + data[i].programName + '</td>'
                                    +'<td>' + data[i].programPlan + '</td>'
                                    +'<td>' + data[i].programLecture + '</td>'
                                    +'<td>' + data[i].nowHeadCount + '</td>'
                                    +'<td>';
                                    
                            
                                    value += '</td></tr>';
                                
                            }
                            
                            $('#boardList>tbody').html(value);
                            
                            
                        },
                        error :function(){
                            console.log('실패');
                        }
                    })
                    
                }
	


            </script>
            </div>
        </div>


    </div>

	
</body>
</html>