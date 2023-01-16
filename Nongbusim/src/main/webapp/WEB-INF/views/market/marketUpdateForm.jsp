<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농 부 심</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>

        body{
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }

        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
            
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding: 5% 10%;
            background-color:white;
            padding-left: 15%;
        }

        #updateForm>table {width:100%;}
        #updateForm>table * {margin:5px;}

        
    </style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>수정하기</h2>
            <br>

            <form id="updateForm" method="post" action="" enctype="multipart/form-data">
                <table algin="center">
                    <thead>
                        <tr>
                            <select name="marketCategory" style="width: 100px;">
                                <option value="농산물">농산물</option>
                                <option value="수산물">수산물</option>
                                <option value="축산물">축산물</option>
                            </select>
                        </tr>

                        <tr>
                            <td rowspan="3">
                                <img src="${ at[0].changeName }" alt="" id="titleImg" width="250px" height="250px">
                            </td>
                            <td>
                                <input type="text" id="title" class="form-control" name="" value="${ market.marketTitle }" style="width: 515px;" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="number" id="writer" class="form-control" name="" value="${ market.marketPrice }" style="width: 515px;" min="1">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <textarea name="" id="" cols="60" rows="8" style="resize:none;" >${ market.marketIntro }</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <c:forEach items="${ at }" var="at" >
                                    <div style="display: inline;">
                                        <img src="${at.changeName}" style="width: 150px; height: 150px; display: inline;" /> ${ at.originName}
                                    </div>
                                </c:forEach>
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="2">
                                <textarea name="" id="" cols="100" rows="10" style="resize:none;"> ${ market.marketContent } </textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br>


                <div align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>

</body>
</html>