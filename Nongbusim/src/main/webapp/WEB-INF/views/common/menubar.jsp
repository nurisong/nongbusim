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
	.header{
	    width: 100%;
	    max-height: 80px;
	    margin: 0px auto;
	    padding: 18px 69px;
	    position: sticky;
	    z-index: 999;
	    background-color: white;
	    border-bottom: 2px solid rgb(224, 224, 224);
	}
	.header-inner{
	    width: 100%;
	    max-width: 1144px;
	    height: 44px;
	    margin: 0px auto;
	    display: flex;
	    justify-content: space-between;
	}
	.navigation-menu{
	    width: 100%;
	    display: flex;
	    justify-content: flex-start;
	    align-items: center;
	}
	.user-menu{
	    margin-left: 5px;
	    width: 100%;
	    /* min-width: 200px; */
	    max-width: 300px;
	    display: flex;
	    justify-content: flex-start;
	    align-items: center;
	}
	.logo{
	    padding: 0px;
	    margin-right: 30px;
	}
	.landing-list{
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
	.landing-list li{
	    cursor: pointer;
	    display: block;
	    font-size: 16px;
	    font-weight: bold;
	    color: rgb(112, 112, 112);
	    margin-right: 20px;
	    white-space: nowrap;
	}
	.search-form{
	    min-width: 180px;
	    max-width: 230px;
	    height: 40px;
	    padding-left: 15px;
	    background-color: rgb(247, 247, 247);
	    border-radius: 10px;
	}
	.inner{
	    max-width: 200px;
	    height: 100%;
	    display: flex;
	    align-items: center;
	}
	.search-text{
	    color: rgb(178, 178, 178);
	    font-size: 14px;
	    line-height: 14px;
	    font-weight: 400;
	    margin-left: 10px;
	    margin-top: 1px;
	}
	
	.user-list{
	    width: 100%;
	    margin: 0px;
	    padding: 0px;
	    display: flex;
	    justify-content: flex-end;
	    align-items: center;
	    font-family: 'Pretendard-Regular';
	    font-weight: 400;
	    font-style: normal;
	}
	.user-list li{
	    cursor: pointer;
	    display: block;
	    font-size: 14px;
	    font-weight: bold;
	    line-height: 18px;
	    padding-right: 10px;
	    white-space: nowrap;
	}
	.username{
	    text-align: right;
	    min-width: 10ch;
	    overflow: hidden;
	    color: rgb(63, 72, 107);
	    text-overflow: ellipsis;
	    padding-right: 0px;
	}
	.user-menu .user-list li.logout{
	    color: rgb(178, 178, 178);
	}
	.user-menu .user-list li.login{
	    color: rgb(63, 72, 107);
	}
	.basket-icon{
	    cursor: pointer;
	}
	.login{
	    font-family: 'Pretendard-Regular';
	    font-style: normal;
	}

</style>
</head>
<body>
    <div class="header">
        <div class="header-inner">
            <section class="navigation-menu">
                <div class="logo">
                    <div>
                        <!-- 로고 이미지-->
                        <img src="resources/images/mainLogo.jpg" width="120" height="70" onclick="mainPage();">
                    </div>

                    <script>
                        function mainPage() {
                            location.href = "/nbs";
                        }
                    </script>
                </div>
                <ul class="landing-list">
                    <li><a href="list.pr" id="sub-menu-click">농장/체험</a></li>
                    <li><a href="" id="store-menu-click" class="goStore">농작물거래</a></li>
                    <li><a href="" id="community-menu-click">농부게시판</a></li>
                    <li><a href="register.pr" id="community-menu-click">프로그램 등록</a></li>
                    <li><a href="">공지/정보</a></li>
                    
                    <!-- 가짜 검색창 -->
                    <!-- <li class="search-form" style="margin-left: 400px;">
                        <div class="inner">
                            <img src="https://w7.pngwing.com/pngs/870/689/png-transparent-computer-icons-desktop-illustrations-miscellaneous-glass-desktop-wallpaper.png" alt="" width="16" height="16">
                            <span class="search-text">여기에 검색해보세요.</span>
                        </div>
                    </li> -->
                    
                </ul>
            </section>

            <section class="user-menu">
                <ul class="user-list">
                    <c:choose>
                    	<c:when test="${ empty loginUser }">
                    		<li class="logout"><a href="loginForm.me">로그인</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<c:choose>
                    			<c:when test="${ loginUser.memStatus eq 'A' }">
                    				 <li class="username"><a href="">관리자페이지 ></a></li>
                    			</c:when>
                    			<c:otherwise>
                    				<li class="username"><a href="">${ loginUser.name } 님</a> ></li>
                    			</c:otherwise>
                    		</c:choose>
                    		<li class="logout"><a href="logout.me">로그아웃</a></li>
                        	</div>
                    	</c:otherwise>
                    </c:choose>
                        
                    <script>

                        function adminPage() {
                            location.href = "views/admin/aSidebar.jsp";
                        }
						
                        function myPage() {
                            location.href = "subLookup.me";
                        };
                        

                        function cartList() {
                                location.href = "cartList.or";
                        };

                        function logout() {
                            location.href = "logout.me";
                        };
                        
                        function goStore(){
                        	location.href = "userProductMarket.pro"
                        }
                        
                        function gosubscribe(){
                        	location.href = "userSubscribe"
                        }
                    </script>
                    
                    <!-- 로그아웃 -->
                    <c:if test="${ alertMsg ne null}">
                    	<script>
                    		alert('${alertMsg}');
                    	</script>
                    	<c:remove var="alertMsg" scope="session" />
                    </c:if>
                    
                    
                    <script type="text/javascript">
                    	$(function(){
                    		
                    		$('.search-text').click(function(){
                        		
                        		location.href = '';
                        		
                        	})
                    		
                    	})
                    </script>
                </ul>
                </div>
            </section>
        </div>
    </div>
</body>
</html> 