<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농장 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
<style>
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
	}
    .outer{
        padding: 50px;
        width: 100%;
        height: 800px;
    }
    .farm-area{
        width: 900px;
    }
    #farm-list-title{
        /* float: left; */
        margin-right: 500px;
        font-family: 'Pretendard-Regular';
    }
    .fotorama{
        width: 400px;
    }
    .right-area{
        width: 50%;
        /* background-color: aquamarine; */
        display: inline-block;
        float: right;
    }
    .left-area{
        width: 50%;
        display: inline-block;
    }
    .farm-info-icon{
        width: 18px;
    }
    .info-area{
        float: left;
        text-align: left;
    }
    .top-area{
        height: 350px;
    }
    .bottom-area{
        text-align: left;
        padding: 30px;
    }
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

	<div class="outer" align="center">

        <div class="farm-area">

            <div class="farm-list-area">
                <h1 id="farm-list-title">스타듀밸리</h1>
                <br><br>
    
                <div class="farm-main-area">
                   
                    <div class="top-area">
                        <div class="left-area">
                            <div class="fotorama">
                                <img src="https://s.fotorama.io/1.jpg">
                                <img src="https://s.fotorama.io/2.jpg">
                                <img src="https://s.fotorama.io/1.jpg">
                                <img src="https://s.fotorama.io/2.jpg">
                            </div>
                        </div>
                        <div class="right-area">
                            <div class="info-area">
                                <span><img class="farm-info-icon" src="https://cdn-icons.flaticon.com/svg/3916/3916884.svg?token=exp=1672904129~hmac=e81e444a64c5751501b363cb80983041"></span>
                                <span>경기도</span>
                                <br>
                                <span><img class="farm-info-icon" src="https://cdn-icons.flaticon.com/svg/5068/5068731.svg?token=exp=1672904129~hmac=6bfd82ce98ca737ee96abbdccf9c0ec5"></span>
                                <span>010-0000-0000</span>
                                <br>
                            </div>
                        </div>
                    </div>

                    <div class="bottom-area">
                        <div class="program-ing">
                            진행중인 프로그램
                        </div>
                        <table class="table">
                            <thead class="thead-light">
                                <tr>
                                    <th>프로그램명</th>
                                    <th>기간</th>
                                </tr>
                                <tr>
                                    <td>딸기 체험</td>
                                    <td>2023/01/02~2023/02/28</td>
                                </tr>
                            </thead>
                        </table>

                    </div>
                </div>
        </div>

        </div>


    </div>
</body>
</html>