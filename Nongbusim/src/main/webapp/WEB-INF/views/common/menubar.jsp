<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "com.hj.hanjan.member.model.vo.Member" %>
<% 
	String contextPath = request.getContextPath();
%>
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
    

</style>
</head>
<body>
    <div class="header">
        <div class="header-inner">
            <section class="navigation-menu">
                <div class="logo">
                    <div>
                        <!-- 로고 이미지-->
                        <img src="<%=contextPath %>/resources/images/logo.jpg" width="100" height="40" onclick="mainPage();">
                    </div>

                    <script>
                        function mainPage() {
                            location.href = "<%= contextPath %>"
                        }
                    </script>
                </div>
                <ul class="landing-list">
                    <li onclick="location.href=''" id="sub-menu-click">농장/체험</li>
                    <li class="goStore" onclick="goStore();" id="store-menu-click">농작물거래</li>
                    <li id="community-menu-click" onclick="location.href=''">농부게시판</li>
                    <li onclick="location.href=''">공지/정보</li>
                    <li class="search-form" style="margin-left: 400px;">
                        <div class="inner">
                            <!-- 돋보기 이미지 -->
                            <img src="https://w7.pngwing.com/pngs/870/689/png-transparent-computer-icons-desktop-illustrations-miscellaneous-glass-desktop-wallpaper.png" alt="" width="16" height="16">
                            <span class="search-text">여기에 검색해보세요.</span>
                        </div>
                    </li>
                </ul>
            </section>

            <section class="user-menu">
                <ul class="user-list">
                    <%-- <% if(loginUser == null)  { %> --%>
                    <c:choose>
                    	<c:when test="${ empty loginUser }">
                    		<li class="logout"><a href="loginForm.me">로그인</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<c:choose>
                    			<c:when test="${ loginUser.userStatus eq 'A' }">
                    				 <li class="username" onclick="adminPage();">관리자페이지 ></li>
                    			</c:when>
                    			<c:otherwise>
                    				<li class="username"><a href="list.qa">${ loginUser.userName } 님</a> ></li>
                    			</c:otherwise>
                    		</c:choose>
                    		<li class="logout"><a href="logout.me">로그아웃</a></li>
                    		<div class="basket-icon">
                            <img onclick="cartList();" src="https://www.sooldamhwa.com/images/modules/damhwaMarket/basketIcon.png" alt="" width="28" height="28" >
                        	</div>
                    	</c:otherwise>
                    </c:choose>
                        
                    <script>
                        function loginPage() {
                            location.href = "<%= contextPath %>/loginPage.me";
                        };

                        function adminPage() {
                            location.href = "<%= contextPath %>/views/admin/aSidebar.jsp";
                        }
						
                        function myPage() {
                            location.href = "<%= contextPath %>/subLookup.me";
                        };
                        

                        function cartList() {
                                location.href = "<%= contextPath %>/cartList.or";
                        };

                        function logout() {
                            location.href = "<%= contextPath %>/logout.me";
                        };
                        
                        function goStore(){
                        	location.href = "<%= contextPath %>/userProductMarket.pro"
                        }
                        
                        function gosubscribe(){
                        	location.href = "<%= contextPath %>/userSubscribe"
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
                        		
                        		location.href = '<%= contextPath %>/Search';
                        		
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