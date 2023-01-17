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

            <h1>정보게시판 글 수정</h1>
            <br><br>

            <br><br><br>
            <form action="update.if" method="post" enctype="multipart/form-data">
                <div class="board-area">
                    <input type="hidden" name="infoNo" value="${info.infoNo}">
                    <table class="table info-table">
                        <tr>
                            <th width="100">카테고리</th>
                            <td colspan="3">
                                <select name="category" id="category" class="form-control" style="width: 120px;">
                                    <option value="nr">보도자료</option>
                                    <option value="fn">농촌소식</option>
                                    <option value="fi">농업정보</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td colspan="3"><input type="text" class="form-control" required name="infoTitle" value="${info.infoTitle}"></td>
                        </tr>
                        <tr>
                            <th>사진파일</th>
                            <td colspan="3">
                            <input type="file" class="form-control-file border" name="upfilesImg" accept="image/*" multiple="multiple">
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td colspan="3">
                            <input type="file" class="form-control-file border" name="upfiles" multiple="multiple">
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="3">
                                <textarea name="infoContent" class="form-control" style="resize: none;" rows="10">${info.infoContent}</textarea>
                            </td>
                        </tr>
                        <!-- <tr>
                            <th width="100">출처</th>
                            <td colspan="3"><input type="text" class="form-control" required name="source"></td>
                        </tr> -->
                    </table>

                    <button type="submit" class="btn btn-secondary">수정하기</button>
                    <a class="btn btn-secondary" href="detail.if?ino=${info.infoNo}">취소하기</a>
                </div>
            </form>

            <script>
                $(function(){
                    $('#category').val('${info.category}').attr("selected", selected);
                })
            </script>
           
        </div>
    </div>


</body>
</html>