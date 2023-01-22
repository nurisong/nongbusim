<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 상세정보</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>

table{

     border-color:rgb(228, 228, 228);
   }

table td {
    width: 300px;
    height: 50px;
}

table th {
    background-color:rgb(228, 228, 228);
    width: 100px;
    height: 50px;
}



</style>
</head>
<body>
 <jsp:include page="../common/menubar.jsp" />


<form action="join.pr">
   <div align="center">
    <h1>프로그램 상세 정보</h1>
    <table border="1">
        <!-- memNo와 programNo를 들고 가서 my_program테이블에 insert -->

        <input type="text" name="memNo" value="${loginUser.memNo}" hidden>
        <input type="text" name="programNo" value="${ bno }" hidden >
        <tr>
            <th>프로그램 명</th>
            <td>${ p.programName }</td>
            <th>강사</th>
            <td>${ p.programLecture }</td>
        </tr>

        <tr>
            <th>교육 일정</th>
            <td>${ p.programPlan }</td>
            <th>장소</th>
            <td>${ p.programLocation }</td>
        </tr>

        <tr>
            <th>교육 시간</th>
            <td>${ p.programHour }</td>
            <th>모집 인원</th>
            <td>${ p.headcount }</td>
        </tr>

    </table>

    

    <h1>상세설명</h1>

    <input type="text" value="${ p.programDetail }" style="width: 800px; height:150px;" readonly>

    <h1>홍보 이미지</h1>


    <img src="${p.changeName}" class="img-thumbnail" alt="Cinque Terre" width="800" height="550"> 
   
    <br><br>


    <c:if test="${ not empty loginUser}">
    <div style="display:none;" id="applyBtnArea">
        <button type="submit">신청</button>
    </div>
    <div style="display:none;" id="applyArea">
        <p>
            이미 신청한 프로그램입니다.
        </p>
    </div>
    </c:if>


    <!-- 회원이 이전에 신청했던 프로그램 넘버  -->
    <!-- <c:forEach items="${ programList }" var="pr">

    <c:choose>
        <c:when test="${pr.programNo eq bno }">
            <b>이미 신청한 프로그램입니다.</b>
        </c:when>

        <c:otherwise>
            <button type="submit">신청</button>
        </c:otherwise>

    </c:choose>

    </c:forEach> -->

    <script>
        $(function() {
            var count = 0;
            <c:forEach items="${ programList }" var="pr">
     
                <c:if test="${pr.programNo eq bno }">
                    count++;
                </c:if>

                
            </c:forEach>
            console.log(count);
            if(count > 0) {
                $('#applyArea').css('display', 'block');
            } else {
                $('#applyBtnArea').css('display', 'block');
            }
        });

    </script>

   
</div>



</form>



</body>
</html>