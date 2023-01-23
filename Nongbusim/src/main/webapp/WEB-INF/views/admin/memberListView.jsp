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
.menu-area{
    color: rgb(178, 178, 178);
}
.menu-area>a:hover{
    text-decoration: none;
    color: rgb(142, 141, 141);
}
.member-table>tbody>tr:hover{ cursor: pointer; }
.member-area{ min-height: 350px; }
.custom-select{ width: 100px; }
.form-control{ width: 300px; }
.select, .text{ display: inline-block; }
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

    <div class="outer" align="center">
        <div class="main-area">

            <h1>회원 관리</h1>
            <br><br>

            <form id="searchForm" action="search.ad" method="get" align="center">
                <div class="select">
                    <input type="hidden" name="ctg" value="${ctg}">
                    <select class="custom-select" name="condition">
                        <option value="all">전체</option>
                        <option value="title">회원번호</option>
                        <option value="content">이름</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>

            <br><br><br>
            <div class="member-area">
                <table class="table member-table">
                    <thead class="thead-light" align="center">
                        <th>no</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>연락처</th>
                        <th>가입일</th>
                        <th>농부코드</th>
                    </thead>
                    <tbody align="center">
                        <c:forEach var="m" items="${mList}">
                            <tr>
                                <td class="mno">${m.memNo}</td>
                                <td>${m.memId}</td>
                                <td>${m.name}</td>
                                <td>${m.phone}</td>
                                <td>${m.enrollDate}</td>
                                <td>${m.farmerCode}
                                <c:if test="${not empty m.farmerCode && m.memStatus == 'Y'}">
                                    <button class="btn btn-secondary accept-btn">수락</button>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <c:if test="${empty mList}">
                    <div><br><br><br>
                        조회된 회원이 없습니다.</div>
                </c:if>
            </div>

            <br><br>
            <!-- 페이지처리하는 영역-->
            <div id="market_page">
                <ul class="pagination justify-content-center">
                    <c:if test="${pi.currentPage ne 1}">
                        <li class="page-item"><a class="page-link" href="list.if?cpage=${pi.currentPage - 1}&category=${map.category}&condition=${map.condition}&keyword=${map.keyword}">이전</a></li>
                    </c:if>

                    <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                        <li class="page-item"><a class="page-link" href="list.if?cpage=${p}&category=${map.category}&condition=${map.condition}&keyword=${map.keyword}">${p}</a></li>
                    </c:forEach>    
                    
                    <c:if test="${pi.maxPage ne pi.currentPage}">
                        <li class="page-item"><a class="page-link" href="list.if?cpage=${pi.currentPage + 1}&category=${map.category}&condition=${map.condition}&keyword=${map.keyword}">다음</a></li>
                    </c:if>
                    <!-- <li class="page-item"><a class="page-link" href="#">${p}</a></li> -->
                </ul>
            </div>
        </div>
    </div>

    <script>
        $('.info-table>tbody>tr').click(function(){
            location.href="detail.if?ino=" + $(this).children('.mno').text();

        });

        $('.accept-btn').click(function(){
            $.ajax({
                url: 'acceptFarmer.ad',
                data: {
                    memNo: ""// 회원번호 어떻게 가져가지?
                },
                success: function(){
                    
                },
                error: function(){
                    console.log('농부 승인 실패');
                }
            })
        })

    </script>

</body>
</html>