<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

            <form id="updateForm" method="post" action="update.mk" enctype="multipart/form-data">
                <input type="hidden" name="marketNo" value="${ market.marketNo }">
                <input type="hidden" name="marketCount" value="${market.marketCount}">
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
                                <img src="${ at[0].changeName }" id="titleImg" width="250px" height="250px">
                            </td>
                            <td>
                                <input type="text" id="title" class="form-control" name="marketTitle" value="${ market.marketTitle }" style="width: 515px;" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="number" id="writer" class="form-control" name="marketPrice" value="${ market.marketPrice }" style="width: 515px;" min="1">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <textarea name="marketIntro" cols="60" rows="8" style="resize:none;" >${ market.marketIntro }</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" id="fileContent">
                                <c:forEach items="${ at }" var="at" varStatus="status" >
                                        <div id="bFile${status.index+1}" style="display: inline;">
                                            <input type="hidden" name="originalFileNo${status.count}" value="${at.fileNo}">
                                            <input type="hidden" name="originalChangeName${status.count}" value="${at.changeName}">
                                            <input type="hidden" name="originalOriginName${status.count}" value="${at.originName}">
                                            <div id="fileNameArea${status.count}" style="display: inline;">
                                                ${ at.originName }
                                            </div>
                                            <input type="file" name="reUpFiles" id="reUpfile${status.count}" onchange="loadImg(this,${status.count})"><br>
                                        </div>
                                </c:forEach>
                                <!--리스트의 길이 보다 한개 많은 수부터 4개까지 새로운 파일을 첨부할 수 있는 태그 생성-->
                                <c:forEach var="nAt" begin="${fn:length(at)+1}" end="4" varStatus="status">
                                    <div id="nFile${fn:length(at)+status.count}" style="display: inline;">
                                        <input type="file" name="reUpFiles" id="reUpfile${fn:length(at)+status.count}" onchange="loadImg(this,${fn:length(at)+status.count})"><br>
                                    </div> 
                                </c:forEach>
                                <script>
                                    
                                </script>
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="2">
                                <textarea name="marketContent" cols="100" rows="10" style="resize:none;"> ${ market.marketContent } </textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br>

                <script>

                    function loadImg(inputFile, num){ // 1,2,3,4로 들어옴

                        if(inputFile.files.length == 1){ //파일을 첨부하면
			
                            var reader = new FileReader();
                        
                            reader.readAsDataURL(inputFile.files[0]);
                            
                            reader.onload = function(e){

                                switch(num){ //첫번째 파일첨부칸에 파일을 첨부하면 대표 이미지 바꾸기
                                    
                                    case 1: 
                                        $('#titleImg').attr('src', e.target.result);
                                        break;
                                		 
                                }					
                            }				 
                        }

                    }


                    //새로운 첨부파일을 넣으면 기존에 달려있던 이미지 파일명 지워주기
                    $("#reUpfile1").on('change',function(){
			            $("#fileNameArea1").css('display', 'none');
		            });
                    $("#reUpfile2").on('change',function(){
			            $("#fileNameArea2").css('display', 'none');
		            });
                    $("#reUpfile3").on('change',function(){
			            $("#fileNameArea3").css('display', 'none');
		            });
                    $("#reUpfile4").on('change',function(){
			            $("#fileNameArea4").css('display', 'none');
		            });


                </script>

                <!--첨부파일 수를 제외하고 나머지 숫자만큼 추가 첨부파일을 할 수 있는 태그 만들어주기
                                <c:set var="atArr" value="${fn:length(at)}"/>
                                <c:choose>
                                    <c:when test="${atArr > 3}">
                                        <input type="file" name="reUpFiles" id="reUpFile1" style="display: none;" onchange="loadImg(this, 3);" accept="image/*"><br>
                                        <input type="file" name="reUpFiles" id="reUpFile2" style="display: none;"><br>
                                        <input type="file" name="reUpFiles" id="reUpFile3" style="display: none;"><br>
                                        <input type="file" name="reUpFiles" id="reUpFile4" style="display: none;">
                                    </c:when>
                                    <c:when test="${atArr > 2}">
                                        <input type="file" name="reUpFiles" id="reUpFile1" onchange="loadImg(this, 3);" accept="image/*"><br>
                                        <input type="file" name="reUpFiles" id="reUpFile2" style="display: none;"><br>
                                        <input type="file" name="reUpFiles" id="reUpFile3" style="display: none;"><br>
                                        <input type="file" name="reUpFiles" id="reUpFile4" style="display: none;">
                                    </c:when>
                                    <c:when test="${atArr > 1}">
                                        <input type="file" name="reUpFiles" id="reUpFile1"><br>
                                        <input type="file" name="reUpFiles" id="reUpFile2"><br>
                                        <input type="file" name="reUpFiles" id="reUpFile3" style="display: none;"><br>
                                        <input type="file" name="reUpFiles" id="reUpFile4" style="display: none;">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="file" name="reUpFiles" id="reUpFile1"><br>
                                        <input type="file" name="reUpFiles" id="reUpFile2"><br>
                                        <input type="file" name="reUpFiles" id="reUpFile3"><br>
                                        <input type="file" name="reUpFiles" id="reUpFile4" style="display: none;">
                                    </c:otherwise>
                                </c:choose>-->

                                <script>


                                    /*function deleteImg(deleteThisImg){//기존이미지를 지우면

                                        $('#dFile' + deleteThisImg).css('display', 'none'); //기존이미지가 첨부되어있던 칸 삭제

                                        if(deleteThisImg == 0){ // 대표 이미지 지우면 썸네일 지우기

                                            $('#titleImg').attr('src', '');
                                        }

                                        //$('#fileContent').append('<br><input type="file" name="reUpFiles">'); //새로운 파일첨부 태그 추가


                                    }*/


                                </script>



                <div align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" onClick="history.back();" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>

</body>
</html>