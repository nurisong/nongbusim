<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 리스트</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>

<style>
            .content {
                background-color:rgb(247, 245, 245);
                width:80%;
                margin:auto;
            }
            .innerOuter {
                border:1px solid lightgray;
                width:80%;
                margin:auto;
                padding:5% 10%;
                background-color:white;
            }
    
            #boardList {text-align:center;}
            #boardList>tbody>tr:hover {cursor:pointer;}
    
            #pagingArea {width:fit-content; margin:auto;}
            
            #searchForm {
                width:80%;
                margin:auto;
            }
            #searchForm>* {
                float:left;
                margin:5px;
            }
            .select {width:20%;}
            .text {width:53%;}
            .searchBtn {width:20%;}
        </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
      

       
        <div class="content" align="center">

            <form action="">
         		<br>
                <h2>프로그램</h2>
                <br>
                <select  name="condition">
                    <option value="ing">진행중</option>
                    <option value="end">마감</option>
                
                </select>
                <input type="text"  >
                <button  type="submit" style="width: 50px;" class="searchBtn">검색</button>

        	</form>
          
            <br>
            <div class="innerOuter" style="padding:5% 10%;">

                

          
            <table id="boardList"  class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>지역</th>
                        <th>프로그램명</th>
                        <th>일정</th>
                        <th>모집인원</th>
                        <th>신청</th>
                        <th>자세히보기</th>
                        <th>찜</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <c:forEach items="${ list }" var="b">
                    	<tr>
                    	   <td class ="bno">강원도</td>
                    	   <td>귀농</td>
                    	   <td>2022.08.12~2022.08.13</td>
                    	   <td>50 명</td>
                    	   <td>진행중</td>
                           <td><button>자세히보기</button></td>
                           <td>*</td>
                    	</tr>
                    	
                    	<tr>
                    	   <td class ="bno">강원도</td>
                    	   <td>귀농</td>
                    	   <td>2022.08.12~2022.08.13</td>
                    	   <td>50 명</td>
                    	   <td>진행중</td>
                           <td><button>자세히보기</button></td>
                           <td>*</td>
                    	</tr>
                    	
                    	<tr>
                    	   <td class ="bno">강원도</td>
                    	   <td>귀농</td>
                    	   <td>2022.08.12~2022.08.13</td>
                    	   <td>50 명</td>
                    	   <td>진행중</td>
                           <td><button>자세히보기</button></td>
                           <td>*</td>
                    	</tr>
                    	
                    	<tr>
                    	   <td class ="bno">강원도</td>
                    	   <td>귀농</td>
                    	   <td>2022.08.12~2022.08.13</td>
                    	   <td>50 명</td>
                    	   <td>진행중</td>
                           <td><button>자세히보기</button></td>
                           <td>*</td>
                    	</tr>
                    	
                    	<tr>
                    	   <td class ="bno">강원도</td>
                    	   <td>귀농</td>
                    	   <td>2022.08.12~2022.08.13</td>
                    	   <td>50 명</td>
                    	   <td>진행중</td>
                           <td><button>자세히보기</button></td>
                           <td>*</td>
                    	</tr>	
                    
                    	
                    	
                    	
                    	
                    	
                    	
                    	
                    </c:forEach>
                    
                </tbody>
            </table>



            </div>
        </div>

</body>
</html>