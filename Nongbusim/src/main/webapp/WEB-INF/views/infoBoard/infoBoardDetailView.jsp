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
.outer{ font-family: 'Pretendard-Regular'; }
.main-area{
    width: 1200px;
    padding: 50px;
}
.main-area>h1{ float: left; }
#list-btn{ float: right; }
#list-btn:hover{ cursor: pointer; }
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

    <div class="outer" align="center">
        <div class="main-area">

            <h1>보도자료</h1>
            <br><br>

            <a class="btn btn-secondary" id="list-btn" href="list.if">목록으로</a>
            
            <br><br><br>
            <div class="board-area">
                <table class="table info-table">
                    <tr>
                        <th width="100">제목</th>
                        <td colspan="4">${ info.infoTitle }</td>
                    </tr>
                    <tr>
                        <th>작성일</th>
                        <td>${ info.createDate }</td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="3">
                            <c:if test="${not empty imgList}">
                                <c:forEach var="i" items="${imgList}">
                                    <img width="500" src="${i.changeName}">
                                </c:forEach>
                            </c:if>
                            <div style="min-height:150px; white-space:pre-line;">${ info.infoContent }</div>
                        </td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td colspan="3">
                            <!-- 첨부파일이 있을 경우/없을 경우 -->
                            <c:choose>
                                <c:when test="${ not empty atList }">
                                    <c:forEach var="a" items="${atList}">
                                        <!-- download속성: 다운로드 시 파일명 -->
                                        <a href="${ a.changeName }" download="${ a.originName }">${ a.originName }</a><br>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    첨부파일이 없습니다.
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>

                </table>

                <br><br>
                
                <form action="" id="postForm">
                    <input type="hidden" name="ino" value="${info.infoNo}">
                </form>

                
            </div>
            
            <div id="btn-area">
                <c:if test="${loginUser.memNo eq info.writer}">
                        <a class="btn btn-secondary" id="update-btn" onclick="postFormSubmit(1)">수정하기</a>
                        <a class="btn btn-secondary" id="del-btn" onclick="postFormSubmit(2)">삭제하기</a>
                </c:if>
            </div>
        </div>
    </div>

    <script>
        function postFormSubmit(num){
            if(num == 1){
                $('#postForm').attr('action', 'updateForm.if').submit();
            }
            else{
                if(confirm('삭제하시겠습니까?')){
                    $('#postForm').attr('action', 'delete.if').submit();
                }
            }
        }
    </script>


</body>
</html>