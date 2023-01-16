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
.outer{font-family: 'Pretendard-Regular';}
.main-area{
    width: 1200px;
    padding: 50px;
}
.main-area>h1{float: left;}
#list-btn{float: right;}
#list-btn:hover{cursor: pointer;}
.board-area{height: 350px;}
.info-table button{
    border: 1px solid rgb(100, 100, 100);
    border-radius: 2px;
}
.info-table input[type=file]{
    width: 400px;
}
.sub-img-area input{
    display: inline-block;
}
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

    <div class="outer" align="center">
        <div class="main-area">

            <h1>농장 정보 수정</h1>
            <br><br>

            <br><br><br>
            <div class="board-area">
            	<form action="update.fm" method="post" enctype="multipart/form-data">	
	                <table class="table info-table">
                        <input type="hidden" name="farmNo" value="${farm.farmNo}">
	                    <tr>
	                        <th>농장이름</th>
	                        <td colspan="3"><input type="text" class="form-control" required name="farmName" value="${farm.farmName}"></td>
	                    </tr>
                        <tr>
                            <th>지역</th>
                            <td>
                                <select name="localCode" style="width: 80px;">
                                    <option value="su">서울</option>
                                    <option value="gg">경기</option>
                                    <option value="ic">인천</option>
                                    <option value="gw">강원</option>
                                    <option value="cc">충청</option>
                                    <option value="gs">경상</option>
                                    <option value="jl">전라</option>
                                    <option value="jj">제주</option>
                                </select>
                            </td>
                        </tr>
	                    <tr>
	                        <th>주소</th>
	                        <td colspan="3"><input type="text" class="form-control" required name="address" value="${farm.address}"></td>
	                    </tr>
	                    <tr>
	                        <th>연락처</th>
	                        <td colspan="3"><input type="text" class="form-control" required name="phone" value="${farm.phone}"></td>
	                    </tr>
                        <tr>
	                        <th>대표사진</th>
	                        <td colspan="3">
                                <img width="200" src="${atList[0].changeName}">
                                <span>${atList[0].originName}</span><button>수정</button>
                                <input type="file" class="form-control-file border" name="upfiles" accept="image/*">
	                        </td>
	                    </tr>
	                    <tr>
                            <th>첨부파일</th>
	                        <td colspan="3" class="sub-img-area">
                                <c:forEach var="at" items="${atList}">
                                    <img width="150" src="${at.changeName}">
                                    <input type="hidden" name="originFileNo " value="${at.fileNo}">
                                    <span>${at.originName}</span><button id="del-img-btn">삭제</button><br>
                                </c:forEach>
                                <button type="button" class="add-btn">추가</button><label style="display: none;" id="max-label">사진 첨부는 최대 4장까지 가능합니다.</label><br> 
                                <input type="file" class="form-control-file border" name="upfiles" accept="image/*">
                            </td>
	                    </tr>
	                    <tr>
	                        <th>소개글</th>
	                        <td colspan="3">
	                            <textarea class="form-control" style="resize: none;" rows="10" name="farmIntro">${farm.farmIntro}</textarea>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th width="100">대표작물</th>
	                        <td colspan="3"><input type="text" class="form-control" required name="crop" value="${farm.crop}"></td>
	                    </tr>
	                </table>
	
	                <button type="submit" class="btn btn-secondary">수정하기</button>
	                <a class="btn btn-secondary" href="">취소하기</a>
	            </div>
            </form>

           
        </div>
    </div>

    <script> 
        $(function(){
            $('#del-img-btn').on('click', function(){
                $('#file')
            })

        })
        // 버튼 클릭시 input 추가
        var maxAppend = '${atList.size()}';

        $('.add-btn').on('click', function(){
            if(maxAppend >= 4){
                $('#max-label').css('display', '');
                return;
            }else{
                $('.sub-img-area').append('<div><input type="file" name="upfiles" class="form-control-file border" accept="image/*"> <button type="button" onclick="delInput(this);">삭제</button></div>'); 
                maxAppend ++;
            }





    </script>


</body>
</html>