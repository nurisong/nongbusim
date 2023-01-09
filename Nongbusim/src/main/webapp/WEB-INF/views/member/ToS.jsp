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
<title>약관동의</title>
</head>
<body>
    <h3>회원가입</h3>
    <hr>
    <p>약관 동의</p>
    <p>회원가입을 위해서 아래 내용 약관을 읽고 동의해 주세요.</p>
    <input type="checkbox">전체 동의
    <br>
    <input type="checkbox">회원 이용약관(필수)
    <button type="button" class="btn btn-secondary">자세히</button>
    <br>
    <input type="checkbox">개인정보수집활용에 관한 동의(필수)
    <button type="button" class="btn btn-secondary">자세히</button>
    <br>
    <input type="checkbox">고객 서비스 제공을 위한 동의(선택)
    <button type="button" class="btn btn-secondary">자세히</button>
    <br>
    <input type="checkbox">고객 서비스 제공을 위한 업무위탁(필수)
    <button type="button" class="btn btn-secondary">자세히</button>
    <br>

    	유의사항
    <ol>
        <ul>
            <li>필수 약관에 동의는 회원가입에 필수적이므로 이에 동의하셔야 이후 절차를 진행할 수 있습니다.</li>
            <li>수집에 동의하지 않으시는 경우 서비스에 제한이 있을 수 있습니다.</li>
        </ul>
    </ol>

    <button type="button" class="btn btn-success" onclick="">동의합니다</button>
    <button type="button" class="btn btn-secondary">동의하지 않습니다</button>
</body>
</html>