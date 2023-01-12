<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바</title>

<link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/menubar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js">
</script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@600;700&display=swap" rel="stylesheet">
<style>
    @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
	}
	*>a{
	    text-decoration: none;
	    color: rgb(178, 178, 178);
	}
	div{
	    box-sizing: border-box;
	}
	.header2{
	    width: 100%;
	    max-height: 80px;
	    margin: 0px auto;
	    padding: 18px 69px;
	    position: sticky;
	    z-index: 999;
	    background-color: white;
	}
	.header-inner2{
	    width: 100%;
	    max-width: 1144px;
	    height: 44px;
	    margin: 0px auto;
	    display: flex;
	    justify-content: space-between;
	}
	.navigation-menu2{
	    width: 100%;
	    display: flex;
	    justify-content: flex-start;
	    align-items: center;
	}
	.landing-list2{
	    width: 100%;
	    margin: 0px;
	    padding: 0px;
	    display: flex;
	    justify-content: flex-start;
	    align-items: center;
	    font-family: 'Pretendard-Regular';
	    font-weight: 700;
	    transform : rotate(0.04deg);
	}
	.landing-list2 li{
		width:25%;
	    cursor: pointer;
	    display: block;
	    font-size: 16px;
	    color: rgb(112, 112, 112);
	    margin-right: 20px;
	}


</style>
</head>
<body>
    <div class="header2">
        <div class="header-inner2">
            <section class="navigation-menu2">
                <ul class="landing-list2">
                    <li><a href="" id="sub-menu-click">게시판 카테고리</a></li>
                    <li><a href="list.bo?type=S" id="store-menu-click" class="goStore">자랑 게시판</a></li>
                    <li><a href="list.bo?type=K" id="community-menu-click">노하우 게시판</a></li>
                    <li><a href="list.bo?type=Q" id="community-menu-click">질문 게시판</a></li>
                    <li><a href="list.bo?type=M">멘티멘토 게시판</a></li>            
                </ul>
            </section>

        </div>
    </div>
</body>
</html> 