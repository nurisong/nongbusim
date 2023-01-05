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

    #market_wrap{

        display: inline-block;
        width: 100%;
        margin-top: 150px;

    }

    #market_wrap a{

        text-decoration: none;

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
<!--

        <!-- 사이드에 카테고리 영역
        <div id="market_sideA">
            <select>
                <option value="모두" selected>모두</option>
                <option value="농산물">농산물</option>
                <option value="수산물">수산물</option>
                <option value="축산물">축산물</option>
            </select> 
        </div>


        <!-- 중앙 게시물 컨텐트 영역
        <div id="market_content">


            <!-- 게시물 리스트 상단 글쓰기버튼과 카테고리 영역
            <div id="market_content_head">
                <div id="market_content_left">
                    <a href="">
                        <button>글쓰기</button>
                    </a>
                </div>
                <div id="market_content_right">
                    <select>
                        <option value="최신순" selected>최신순</option>
                        <option value="인기순">인기순</option>
                        <option value="가격낮은순">가격낮은순</option>
                        <option value="가격높은순">가격높은순</option>
                    </select>
                </div>
            </div>


            <!-- 게시물 컨텐트 영역 
            <div id="market_content">
                
            </div>




        </div>


        <!-- 오른쪽 사이드 영역
        <div id="market_sideB">
        </div>

        <div id="market_page">
            <ul class="pagination">
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



<div id="market_wrap">

        <div class="container">

        <div class="row">

            <div class="col-lg-3">

            <div class="list-group">
                <a href="#" class="list-group-item">모두</a>
                <a href="#" class="list-group-item">농산물</a>
                <a href="#" class="list-group-item">수산물</a>
                <a href="#" class="list-group-item">축산물</a>
            </div>

            </div>
            <!-- /.col-lg-3 -->

            <div class="col-lg-9">
                
                <button>글쓰기</button>

                <select name="" id="">
                    <option value="">최신순</option>
                    <option value="">인기순</option>
                    <option value="">높은가격순</option>
                    <option value="">낮은가격순</option>
                </select>

                <div class="row">

                    <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href=""><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                        <h4 class="card-title">
                            <a href="#"><img src=""></a>
                        </h4>
                        <h5>$24.99</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                        </div>
                        <div class="card-footer">
                        <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </div>
                    </div>
                    </div>

                    <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                        <h4 class="card-title">
                            <a href="#">Item Two</a>
                        </h4>
                        <h5>$24.99</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
                        </div>
                        <div class="card-footer">
                        <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </div>
                    </div>
                    </div>

                    <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                        <h4 class="card-title">
                            <a href="#">Item Three</a>
                        </h4>
                        <h5>$24.99</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                        </div>
                        <div class="card-footer">
                        <small class="text-muted"></small>
                        </div>
                    </div>
                    </div>

                    <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                        <h4 class="card-title">
                            <a href="#">Item Four</a>
                        </h4>
                        <h5>$24.99</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                        </div>
                        <div class="card-footer">
                        <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </div>
                    </div>
                    </div>

                    <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                        <h4 class="card-title">
                            <a href="#">Item Five</a>
                        </h4>
                        <h5>$24.99</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
                        </div>
                        <div class="card-footer">
                        <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </div>
                    </div>
                    </div>

                    <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                        <h6 class="card-title">
                            <a href="#">금산 딸기 1Kg</a><img src="">
                        </h6>
                        <h6>29,900원</h6>
                        <h6>등록일</h6>
                        <h6>조회수</h6>
                        </div>
                    </div>
                    </div>

                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card h-100">
                            <a href="detail.mk"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                            <div class="card-body">
                            <h6 class="card-title">
                                <a href="#">금산 딸기 1Kg</a><img src="">
                            </h6>
                            <h6>29,900원</h6>
                            <h6>등록일</h6>
                            <h6>조회수</h6>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.row -->

            </div>
            <!-- /.col-lg-9 -->

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
        <!-- /.row -->

        </div>
        <!-- /.container -->

    </div>


</body>
</html>