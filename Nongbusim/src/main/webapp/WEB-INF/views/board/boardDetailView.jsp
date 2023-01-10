<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .outer{
            font-family: 'Pretendard-Regular';
        }
        .main-area{
            width: 1200px;
            padding: 50px;
        }


        .board-header>div{
            float:left
        }
        .user-profile{
            text-align: center;
        }
        .board-dateview{
            text-align: center;
        }

        .board-footer>div{
            float:left
        }
        .report-board{
            text-align: right;
        }


    </style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

    <div class="outer" align="center">
        <!-- 게시글 상세내용 -->
        <div class="main-area">

			<c:if test="${ b.boardType=='M' }"><h1>멘티멘토 게시판</h1></c:if>
			<c:if test="${ b.boardType=='Q' }"><h1>질문 게시판</h1></c:if>
			<c:if test="${ b.boardType=='K' }"><h1>노하우 게시판</h1></c:if> 
            <h3>${b.boardTitle}</h3>

            <div class="board-header" style="width: 100%; height: 30px;">
                <div class="user-profile" style="width: 20%; height: 30px;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                    </svg>
                    nickname
                </div>
                <div class="board-dateview" style="width: 60%; height: 30px;">
                                작성일: ${b.createDate} 조회수: ${b.count}
                </div>
                <div class="board-updatedelete"style="width: 20%;">
                    <button>수정</button>
                    <button>삭제</button>
                </div>
            </div>

            <hr>

            <div>
                ${b.boardContent}
            </div>

            <hr>
            <div class="board-footer" style="width: 100%; height: 25px;">
                <div class="board-heart" style="width: 25%; height: 25px;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-heart-fill" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                    </svg> 좋아요 &nbsp;&nbsp;&nbsp;&nbsp;
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
                        <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
                        <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
                    </svg> 댓글
                </div>
                <div class="report-board"style="width: 75%;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
                    </svg> 신고하기 &nbsp;&nbsp;&nbsp;&nbsp;
                </div>

            </div>
            <hr style="margin-top: 6px;">
            
        </div>
        <!-- 댓글 기능 -->
        <div class="reply-area">
            
            <table id="replyArea" class="table" align="center" style="width:50%">
                <thead>
                    
                    <tr>
                        <td>
                            <span style="font-weight:bold; font-size: large;">댓글</span>
                            <span>등록순</span>
                            <span>최신순</span>  
                        </td>
                    </tr>
                    <c:choose>
                        <c:when test="${ empty loginUser }">
                            <tr>
                                <th colspan="2">
                                    <textarea class="form-control" readonly cols="55" rows="2" style="resize:none; width:100%;">로그인 후 이용가능합니다.</textarea>
		                        </th>
		                        <th style="vertical-align:middle"><button class="btn btn-secondary disabled" style="height: 33px;">등록하기</button></th>
		                    </tr>
	                    </c:when>
	                    <c:otherwise>
                            <tr>
                                <th colspan="2">
                                    <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
		                        </th>
		                        <th style="vertical-align:middle"><button class="btn btn-secondary" onclick="addReply();">등록하기</button></th>
		                    </tr>
	                    </c:otherwise>
                    </c:choose>
                </thead>
                <tbody>            	
                    <tr>
                        <th>user02</th>
                        <td>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ꿀잼</td>
                        <td>2020-03-12</td>
                    </tr>
                    <tr>
                        <th>user01</th>
                        <td>재밌어요</td>
                        <td>2020-03-11</td>
                    </tr>
                    <tr>
                        <th>admin</th>
                        <td>댓글입니다!!</td>
                        <td>2020-03-10</td>
                    </tr>
                	
                </tbody>
            </table>
            
        </div>
    </div>
        
        
        
    <script>
            

    	
    </script>
    
</body>
</html>