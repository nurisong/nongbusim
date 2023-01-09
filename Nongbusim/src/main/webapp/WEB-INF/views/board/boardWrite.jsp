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

        #enrollForm>table {width:100%;}
        #enrollForm>table * {margin:5px;}
    </style>
</head>
<body>
	
    <jsp:include page="../common/menubar.jsp" />

    <div class="content" align="center">
        <br><br>
        <div class="main-area">
            <h1>게시글 작성하기</h1>
            <br>
            <div style="background-color:rgb(251, 244, 227) ;">

                <hr>
                
                <div>
                    <select class="board-select" name="boardType" id="boardType" onchange="ChangedValue();" style="width: 1050px; height: 30px;">
                        <option value="S">자랑게시판</option>
                        <option value="Q">질문게시판</option>
                        <option value="K">노하우게시판</option>
                        <option value="M">멘티멘토게시판</option>                      
                    </select>
                </div>
                

                	
                <div class="picture-area" id="picture-area" style="display: none;">
                    
                    <form id="enrollForm" method="post" action="insert.bo" enctype="multipart/form-data">
                        <table align="center">
                            <tr>
                                <th><label for="title">제목</label></th>
                                <td><input type="text" id="title" class="form-control" name="boardTitle" maxlength="60" required style="width:30%"></td>
                            </tr>
                            <tr>
                                <th><label for="content">썸네일</label></th>
                                <td>
                                    <div class="form-group">
                                        <img width="300" height="200" id="thumbnailImg" style="background-color:white">
                                    </div>    
                                </td>
                            </tr>
                            <tr>
                                <th><label for="content">내용</label></th>
                                <td><textarea id="content" class="form-control" rows="20" cols="125" maxlength="900" style="resize:none;" name="boardContent" required style="width:200px;"></textarea></td>
                            </tr>
                            <tr>
                                <th><label for="upfile">첨부파일</label></th>
                                <td><input type="file" id="upfile" class="form-control-file border" name="upfile" style="width:80%"></td>
                            </tr>
                    
                        </table>
                        <br>
                        
                        <div align="center">
                            <button type="submit" class="btn btn-primary">등록하기</button>
                            <button type="reset" class="btn btn-danger">취소하기</button>
                        </div>
                        <br>
                    </form>
                    
                </div>
                

                	
                <div class="table-area" id="table-area" style="display: none;">
                    
                    <form id="enrollForm" method="post" action="insert.bo" enctype="multipart/form-data">
                        <table align="center">
                            <tr>
                                <th><label for="title">제목</label></th>
                                <td><input type="text" id="title" class="form-control" name="boardTitle" maxlength="60" required style="width:30%"></td>
                            </tr>
                            <tr>
                                <th><label for="content">내용</label></th>
                                <td><textarea id="content" class="form-control" rows="20" cols="120" maxlength="900" style="resize:none;" name="boardContent" required style="width:200px;"></textarea></td>
                            </tr>
                            <tr>
                                <th><label for="upfile">첨부파일</label></th>
                                <td><input type="file" id="upfile" class="form-control-file border" name="upfile"></td>
                            </tr>
                    
                        </table>
                        <br>
                        <input type="hidden" name="boardType" value="${btype}">
                        <input type="hidden" name="memNo" value="300">
                        
                        
                        <div align="center">
                            <button type="submit" class="btn btn-primary">등록하기</button>
                            <button type="reset" class="btn btn-danger">취소하기</button>
                        </div>
                        <br>
                    </form>
                </div>


                
            </div>
                
        </div>
        <br><br>
        
    </div>

    <script>
    
    	<!--글 작성 이전의 게시판 종류로 초기 선택하는 기능-->
    	$(document).ready(function(){
    		$('#boardType').val('${btype}').prop("selected",true);
            if($("#boardType option:selected").val()=='S') {
                $("#picture-area").show();
                $("#table-area").hide();
            }  else {
                $("#picture-area").hide();
                $("#table-area").show();
            }    		

    	});
    	
    	<!--선택된 게시판 종류에 따라 게시판의 양식이 바뀌는 기능-->
        function ChangedValue() {
            
            var value_str=document.getElementById('boardType');

            if(value_str.options[value_str.selectedIndex].value=='S') {
                $("#picture-area").show();
                $("#table-area").hide();
            }  else {
                $("#picture-area").hide();
                $("#table-area").show();
            }

        }

    </script>


</body>
</html>