<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
    <div class="container">
        <h3>내가 작성한 게시글-일반 사용자-</h3>
        <table class="table table-bordered table-sm">
          <thead>
            <tr>
              <th>게시판</th>
              <th>제목</th>
              <th>작성일</th>
            </tr>
          </thead>
          <tbody>
          <!-- 
          	<c:forEach var="b" items="${ list }">
          		<tr>
          			<td>${ b.boardType }</td>
          			<td>${ b.boardTitle }</td>
          			<td>${ b.createDate }</td>
          		</tr>
          	</c:forEach> -->
          </tbody>
        </table>
      </div>
</body>
</html>