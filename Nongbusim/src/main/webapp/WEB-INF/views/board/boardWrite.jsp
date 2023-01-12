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
        
        /*이미지 클릭시 파일 업로드CSS*/
        .image-upload > input
		{
		    display: none;
		}
		
		.image-upload img
		{
		    width: 80px;
		    cursor: pointer;
		}
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
                                    <div class="image-upload">
									    <label for="file-input">
									        <img id="myimage" class="myimage" src="https://adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" width="200" height="100"/>
									    </label>									
									    <input id="file-input" type="file" name="upfiles" required onchange="onFileSelected(event)"/>
									</div> 
                                </td>
                            </tr>
                            <!-- 주말에 완성할 듯 -->
                            <tr>
                                <th><label for="content">내용</label></th>
                                
                                <td><textarea id="content" class="form-control" rows="20" cols="125" maxlength="900" style="resize:none;" name="boardContent" required style="width:200px;"></textarea></td>
                            </tr>
                            <tr>
                            	<th><label for="images">이미지추가</label></th>
                            	<td>
									<input type="file" name="upfiles" />
									<input type="file" name="upfiles" />
									<input type="file" name="upfiles" />
                            	</td>
                            </tr>
                    
                        </table>

                        
                        <br>

                        <input type="hidden" name="boardType" value="${type}">
                        <input type="hidden" name="memNo" value="${loginUser.memNo}">
                        <input type="hidden" name="boardWriter" value="${loginUser.nickName}">
                        
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
                                <td><input type="file" class="form-control-file border" name="upfiles" accept="image/*"></td>
                            </tr>
                    
                        </table>
                        <br>
                        <input type="hidden" name="boardType" value="${type}">
                        <input type="hidden" name="memNo" value="${loginUser.memNo}">
                        <input type="hidden" name="boardWriter" value="${loginUser.nickName}">
                        
                        
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
    		$('#boardType').val('${type}').prop("selected",true);
            if($("#boardType option:selected").val()=='S') {
                $(".picture-area").show();
                $(".table-area").hide();
            }  else {
                $(".picture-area").hide();
                $(".table-area").show();
            }    		

    	});
    	
    	<!--선택된 게시판 종류에 따라 게시판의 양식이 바뀌는 기능-->
        function ChangedValue() {
            
            var value_str=document.getElementById('boardType');

            if(value_str.options[value_str.selectedIndex].value=='S') {
                $(".picture-area").show();
                $(".table-area").hide();
            }  else {
                $(".picture-area").hide();
                $(".table-area").show();
            }

        }
        
        <!-- 업로드되는 사진으로 src값을 변경-->
        
        function onFileSelected(event) {
        	  var selectedFile = event.target.files[0];
        	  var reader = new FileReader();

        	  var imgtag = document.getElementById("myimage");
        	  imgtag.title = selectedFile.name;

        	  reader.onload = function(event) {
        	    imgtag.src = event.target.result;
        	  };

        	  reader.readAsDataURL(selectedFile);
        	}

    </script>


</body>
</html>