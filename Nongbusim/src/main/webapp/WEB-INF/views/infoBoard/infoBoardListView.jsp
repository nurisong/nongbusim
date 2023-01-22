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
    .info-menu{ color: rgb(178, 178, 178); }
    .info-menu>a:hover{
        text-decoration: none;
        color: rgb(142, 141, 141);
    }
    #insert-btn{ float: right; }
    #insert-btn:hover{ cursor: pointer; }
    .info-table>tbody>tr:hover{ cursor: pointer; }
    .board-area{ min-height: 350px; }
    .custom-select{ width: 100px; }
    .form-control{ width: 300px; }
    .select, .text{ display: inline-block; }
    #order-area{
        margin: 40px 50px 30px 0px;
        float: left;
    }
    #page-area a{ color: black; }
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

    <div class="outer" align="center">
        <div class="main-area">

            <h1>정보 게시판</h1>
            
            <div class="info-menu">
                <a href="list.if">전체</a> | 
                <a href="list.if?ctg=nr">보도자료</a> | 
                <a href="list.if?ctg=fn">농촌소식</a> |
                <a href="list.if?ctg=fi">농업정보</a> 
            </div>
            <br><br>

            <form id="searchForm" action="list.if" method="get" align="center">
                <div class="select">
                    <input type="hidden" name="ctg" value="${map.category}">
                    <select class="custom-select" name="condition"  id="condition-select" >
                        <option value="all">전체</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword" id="search-input">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>

            <div>
                <div id="order-area">
                    <select class="custom-select" id="order-select" name="order" onchange="location.href=this.value">
                        <option name="recent" value="list.if?ctg=${map.category}&condition=${map.condition}&keyword=${map.keyword}&order=recent" selected>최신순</option>
                        <option name="name" value="list.if?ctg=${map.category}&condition=${map.condition}&keyword=${map.keyword}&order=name">제목순</option>
                    </select>
                </div>
            </div>

            <c:if test="${loginUser.memStatus eq 'A'}">
                <a class="btn btn-secondary" id="insert-btn" href="enrollForm.if">글작성</a>
            </c:if>
            
            <br><br><br>
            <div class="board-area">
                <table class="table info-table">
                    <thead class="thead-light" align="center">
                        <th>no</th>
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>등록일</th>
                        <th>조회수</th>
                    </thead>
                    <tbody align="center">
                        <c:forEach var="info" items="${infoList}">
                            <tr>
                                <td class="ino">${info.infoNo}</td>
                                <td>
                                    <c:if test="${info.category eq 'nr' }">보도자료</c:if>
                                    <c:if test="${info.category eq 'fn' }">농촌소식</c:if>
                                    <c:if test="${info.category eq 'fi' }">농업정보</c:if>
                                </td>
                                <td>${info.infoTitle}</td>
                                <td>${info.createDate}</td>
                                <td>${info.count}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <c:if test="${empty infoList}">
                    <div><br><br><br>
                        일치하는 검색 결과가 없습니다.</div>
                </c:if>
            </div>

            <br><br>
            <!-- 페이지처리하는 영역-->
            <div id="page-area">
                <ul class="pagination justify-content-center">
                    <c:if test="${pi.currentPage ne 1}">
                        <li class="page-item"><a class="page-link" href="list.if?cpage=${pi.currentPage - 1}&ctg=${map.category}&condition=${map.condition}&keyword=${map.keyword}&order=${map.order}">이전</a></li>
                    </c:if>

                    <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                        <li class="page-item"><a class="page-link" href="list.if?cpage=${p}&ctg=${map.category}&condition=${map.condition}&keyword=${map.keyword}&order=${map.order}">${p}</a></li>
                    </c:forEach>    
                    
                    <c:if test="${pi.maxPage ne pi.currentPage}">
                        <li class="page-item"><a class="page-link" href="list.if?cpage=${pi.currentPage + 1}&ctg=${map.category}&condition=${map.condition}&keyword=${map.keyword}&order=${map.order}">다음</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>

    <script>
        $(function(){
            $('#order-select option[name=' + "${map.order}" + ']').prop('selected',true);
            $('#condition-select').val('${map.condition}').prop('selected',true);
            $('#search-input').val('${map.keyword}');
        })
        
        $('.info-table>tbody>tr').click(function(){
            location.href="detail.if?ino=" + $(this).children('.ino').text();

        });

    </script>

</body>
</html>