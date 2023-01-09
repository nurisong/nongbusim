<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농부심 | 정보 게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.outer{font-family: 'Pretendard-Regular';}
.main-area{
    width: 1200px;
    padding: 50px;
}
.main-area>h1{float: left;}
#list-btn{float: right;}
#list-btn:hover{cursor: pointer;}
.board-area{height: 350px;}
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

    <div class="outer" align="center">
        <div class="main-area">

            <h1>농장 등록</h1>
            <br><br>

            <br><br><br>
            <div class="board-area">
                <table class="table info-table">
                    <tr>
                        <th>농장이름</th>
                        <td colspan="3"><input type="text" class="form-control" required name=""></td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td colspan="3"><input type="text" class="form-control" required name=""></td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td colspan="3"><input type="text" class="form-control" required name=""></td>
                    </tr>
                    <tr>
                        <th>대표사진</th>
                        <td colspan="3">
                           <input type="file" class="form-control-file border" name="">
                        </td>
                    </tr>
                    <tr>
                        <th>상세사진</th>
                        <td colspan="3">
                           <input type="file" class="form-control-file border" name="">
                           <input type="file" class="form-control-file border" name="">
                           <input type="file" class="form-control-file border" name="">
                        </td>
                    </tr>
                    <tr>
                        <th>소개글</th>
                        <td colspan="3">
                            <textarea name="" id="" class="form-control" style="resize: none;" rows="10"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th width="100">대표작물</th>
                        <td colspan="3"><input type="text" class="form-control" required name=""></td>
                    </tr>
                </table>

                <a class="btn btn-secondary" href="">등록하기</a>
                <a class="btn btn-secondary" href="">취소하기</a>
            </div>

           
        </div>
    </div>


</body>
</html>