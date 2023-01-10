<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농부심 | 농장 상세조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
<style>
    .outer{
        padding: 50px;
        width: 100%;
        font-family: 'Pretendard-Regular';
    }
    .main-area{
        width: 900px;
    }
    .farm-area{
        height: 300px;
    }
    .name-info{
        margin: 30px 0px 50px 0px;
    }
    .name-area{
        width: 40%;
        display: inline-block;
        padding-top: 20px;
    }
    .info-area{
        width: 60%;
        /* background-color: aquamarine; */
        display: inline-block;
        float: right;
        padding-left: 30px;
    }
    .farm-info-icon{
        width: 18px;
    }
    .info{
        text-align: left;
        background-color: rgb(235, 235, 235);
        width: 400px;
        height: 90px;
        border-radius: 5px;
        padding: 20px;
        padding-left: 30px;
    }
    .fotorama{
        width: 800px;
    }
    .bottom-area{
        text-align: left;
        padding: 30px;
    }
    .program-area, .sale-area{
        padding: 20px;
    }
    .crop-img{
        width: 200px;
    }
    .intro-area{
        padding-left: 50px;
        text-align: left;
        margin: 60px 0px 30px 0px;
    }
    .intro-content{
        height: 100px;
        background-color: rgb(235, 235, 235);
        padding: 30px;
        border-radius: 5px;
    }
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

	<div class="outer" align="center">

        <div class="main-area">
            <div class="name-info">
                <h1 class="name-area">${f.farmName}</h1>
                <div class="info-area">
                    <div class="info">
                        <span><img class="farm-info-icon" src="https://cdn-icons.flaticon.com/svg/3916/3916884.svg?token=exp=1672904129~hmac=e81e444a64c5751501b363cb80983041"></span>
                        <span>${f.address}</span>
                        <br>
                        <span><img class="farm-info-icon" src="https://cdn-icons.flaticon.com/svg/5068/5068731.svg?token=exp=1672904129~hmac=6bfd82ce98ca737ee96abbdccf9c0ec5"></span>
                        <span>${f.phone}</span>
                        <br>
                    </div>
                </div>
            </div>

            <hr style="width: 800px;">
            
            <br><br>
            <div class="fotorama">
                <img src="https://images.unsplash.com/photo-1519897831810-a9a01aceccd1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1331&q=80">
                <img src="https://images.unsplash.com/photo-1507662228758-08d030c4820b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80">
                <img src="https://images.unsplash.com/photo-1519897831810-a9a01aceccd1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1331&q=80">
                <img src="https://images.unsplash.com/photo-1507662228758-08d030c4820b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80">
            </div>
            
            <div class="intro-area">
                <h4>소개글</h4>
                <br>
                <div class="intro-content">
                    소개글을 적을까?
                </div>
            </div>

            <div class="bottom-area">
                <div class="program-area">
                    <h4>진행중인 프로그램</h4>
                    <br>
                    <table class="table">
                        <thead class="thead-light">
                            <tr>
                                <th style="width: 490px;">프로그램명</th>
                                <th>기간</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>딸기 체험</td>
                                <td>2023/01/02~2023/02/28</td>
                            </tr>
                            <tr>
                                <td>딸기 체험</td>
                                <td>2023/01/02~2023/02/28</td>
                            </tr>
                            <tr>
                                <td>딸기 체험</td>
                                <td>2023/01/02~2023/02/28</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="sale-area">
                    <h4>판매중인 작물</h4>
                    <br>
                    <table>
                        <tr>
                            <td><img class="crop-img" src="https://images.unsplash.com/photo-1622943316951-33fd198b660f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3RyYXdiZXJyeXxlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60"></td>
                            <td><img class="crop-img" src="https://images.unsplash.com/photo-1622943316951-33fd198b660f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3RyYXdiZXJyeXxlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60"></td>
                            <td><img class="crop-img" src="https://images.unsplash.com/photo-1622943316951-33fd198b660f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3RyYXdiZXJyeXxlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60"></td>
                            <td><img class="crop-img" src="https://images.unsplash.com/photo-1622943316951-33fd198b660f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3RyYXdiZXJyeXxlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60"></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>