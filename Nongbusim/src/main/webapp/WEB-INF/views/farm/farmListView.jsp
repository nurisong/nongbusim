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
<style>
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
	}
    #list-title{
        /* float: left; */
        margin-right: 500px;
        font-family: 'Pretendard-Regular';
    }
    .local-area{
        background-color: rgb(235, 235, 235);
        width: 800px;
        padding: 20px;
        border-radius: 5px;
    }
    ul, li{
        margin: 0px;
        padding: 0px;
        list-style: none;
    }
    .selection-list{
        /* float: left; */
        width: 700px;
    }
    .selection-list li{
        display: inline-block;
        width: 23%;
    }
    #all-btn{
        margin-right: 500px;
        margin-bottom: 20px;
    }
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

	<div class="outer" align="center">

        <div class="list-area">
            <h1 id="list-title">농장리스트</h1>

            <div class="local-area">
                <button class="btn btn-secondary" id="all-btn">전체보기</button>
                
                <div class="selection-list">
                    <ul>
                        <li>서울</li>
                        <li>경기</li>
                        <li>충청</li>
                        <li>강원</li>
                        
                        <li>서울</li>
                        <li>경기</li>
                        <li>충청</li>
                        <li>강원</li>

                        <li>서울</li>
                        <li>경기</li>
                        <li>충청</li>
                        <li>강원</li>

                        <li>서울</li>
                        <li>경기</li>
                        <li>충청</li>
                        <li>강원</li>
                    </ul>
                </div>
            </div>
            <hr>
        </div>


    </div>
</body>
</html>