<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농 작 물 거 래 게 시 판</title>

<style>

#market_wrap{

    display: inline-block;
    width: 800px;
    height: 500px;
    margin-top: 150px;
    margin-left: 600px;

}

#market_wrap>#market_sideA{

    width: 800px;
    height: 100px;

}


</style>

</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

    <!-- 게시물 전체를 감싸는 div -->
    <div id="market_wrap">

        <!-- 사이드에 카테고리 고르는 드롭박스-->
        <div id="market_sideA">
            <select>
                <option value="모두" selected>모두</option>
                <option value="농산물">농산물</option>
                <option value="수산물">수산물</option>
                <option value="축산물">축산물</option>
            </select> 
        </div>


        <!-- 중앙 게시물 컨텐트 영역-->
        <div id="market_content">


            <!-- 게시물 리스트 상단 글쓰기버튼과 카테고리-->
            <div id="market_content_head">
                <div id="market_content_left">
                    <a href="">
                        <button>글쓰기</button>
                    </a>
                </div>
                <div id="market_content_right">
                    <select>
                        <option value="최신순" selected>최신순</option>
                        <option value="인기순">인기순</option>
                        <option value="가격낮은순">가격낮은순</option>
                        <option value="가격높은순">가격높은순</option>
                    </select>
                </div>
            </div>


            <!-- 게시물 구조 -->
            <div id="market_content">
                
            </div>




        </div>

        <div id="market_sideB">
        </div>

        <div id="market_page"></div>

    </div>

</body>
</html>