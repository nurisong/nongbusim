<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                
                <c:forEach items="${ list }" var="b">
                    <tr  onclick="modal('my_modal')" >
                        <td style="width:10px;"><img class="thumbnail" src="resources/images/딸기1.jpg" alt=""></td>
                        <td>
                            프로그램명 : 딸기 쵝오<br>
                            노잼!<br>
                            2023-01-10
                        </td> 
                    </tr>

                    <tr onclick="modal('my_modal')">
                        <td style="width:10px;"><img class="thumbnail" src="resources/images/딸기1.jpg" alt=""></td>
                        <td>
                            프로그램명 : 딸기 쵝오<br>
                            노잼!<br>
                            2023-01-10
                        </td> 
                    </tr>

                    <tr onclick="modal('my_modal')">
                        <td style="width:10px;"><img class="thumbnail" src="resources/images/딸기1.jpg" alt=""></td>
                        <td>
                            프로그램명 : 딸기 쵝오<br>
                            노잼!<br>
                            2023-01-10
                        </td> 
                    </tr>
                    <tr onclick="modal('my_modal')">
                        <td style="width:10px;"><img class="thumbnail" src="resources/images/딸기1.jpg" alt=""></td>
                        <td>
                            프로그램명 : 딸기 쵝오<br>
                            노잼!<br>
                            2023-01-10
                        </td> 
                    </tr>
                    <tr onclick="modal('my_modal')">
                        <td style="width:10px;"><img class="thumbnail" src="resources/images/딸기1.jpg" alt=""></td>
                        <td>
                            프로그램명 : 딸기 쵝오<br>
                            노잼!<br>
                            2023-01-10
                        </td> 
                    </tr>

                </c:forEach>
                
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
        </div>
    </div>

    <div id="my_modal">
        <table style="width: 400px; height:200px;">
            <tr>
               <td>작성자 : user01</td>
               <td>2023-01-10</td>
            </tr>
            <tr>
                <td>프로그램명 : 딸기 쵝오</td>
            </tr><br>
            <tr>
                <td>딸기 시러</td>
            </tr><br>
            <tr>
                <td>내용: 하지만 맛있어</td>
            </tr><br>
        </table>

        <div align="center">
            <img class="thumbnail" src="resources/images/딸기1.jpg" style="width: 300px; height: 200px;">

        </div>

        <a class="modal_close_btn">  <img  src="resources/images/close.png" style="width: 30px; height: 30px;"></a>
        <br>
        <div align="center">
            <button style="background-color: rgb(103, 141, 208);">수정</button>
            <button style="background-color: rgb(220, 112, 112);">삭제</button>

        </div>
        
    </div>

    

 

    <script>
        function modal(id) {
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

    
    </script>

    



	

</body>
</html>