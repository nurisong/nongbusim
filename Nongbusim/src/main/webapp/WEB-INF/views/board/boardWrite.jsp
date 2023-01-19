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
		    width: 300;
		    height: 200;
		    cursor: pointer;
		}
    </style>
</head>
<body>
	
    <jsp:include page="../common/menubar.jsp" />
    <jsp:include page="boardbar.jsp" />

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
	                            <th width="100"><label for="title">제목</label></th>
	                            <td><input type="text" id="title" class="form-control" name="boardTitle" maxlength="60" required style="width:30%"></td>
	                        </tr>
	                       
	                        <tr>
	                            <th width="100"><label for="content">썸네일</label></th>
	                            <td>
									<h6 align="center" style="color:grey;">*썸네일은 게시판과 게시물 상단에 보입니다. 반드시 넣어주세요*<h6>
	                                <div class="image-upload" align="center">
						    			<label for="file-input">
						        			<img id="myimage" class="myimage" src="https://adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" width="300" height="200"/>
						    			</label>									
						    			<input id="file-input" type="file" name="upfiles" required onchange="onFileSelected(event)"/>
									</div> 
	                            </td>
	                        </tr>
	
	                        <tr>
	                            <th width="100"><label for="content">내용</label>
	                            	<br>
	                        		<button type="button" class="add-content"><h5>이미지/내용 추가</h5></button>
	                        	</th>                         
	                            <td>
	                            	<div align="center">
	                             		<textarea id="text1" class="form-control" rows="20" cols="125" maxlength="900" style="resize:none;"  required style="width:200px;"></textarea>                                	
	                            	</div>
	                            	
	                             	<div id="upfile-area1" align="center" style="display:none;">
	                             		<label for="upfile1">
						        			<img id="upimage1" class="myimage" src="https://adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" width="300" height="200"/>
						    			</label>
										<input type="file" name="upfiles" id="upfile1" onchange="loadImg(this, 1);" accept="image/*"/>
	                              		<textarea id="text2" class="form-control" rows="20" cols="125" maxlength="900" style="resize:none;"  style="width:200px;"></textarea>
	                             	</div>
	                             
	                             	<div id="upfile-area2" align="center" style="display:none;">
	                             		<label for="upfile2">
						        			<img id="upimage2" class="myimage" src="https://adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" width="300" height="200"/>
						    			</label>
										<input type="file" name="upfiles" id="upfile2" onchange="loadImg(this, 2);" accept="image/*"/>
	                              		<textarea id="text3" class="form-control" rows="20" cols="125" maxlength="900" style="resize:none;"  style="width:200px;"></textarea>                               
									</div>
						
									<div id="upfile-area3" align="center" style="display:none;">
	                             		<label for="upfile3">
						        			<img id="upimage3" class="myimage" src="https://adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" width="300" height="200"/>
						    			</label>
										<input type="file" name="upfiles" id="upfile3" onchange="loadImg(this, 3);" accept="image/*"/>
	                              		<textarea id="text4" class="form-control" rows="20" cols="125" maxlength="900" style="resize:none;"  style="width:200px;"></textarea>                               
										<h6 style="color:grey;">*여기까지만 나옵니다.*<h6>
									</div>
	                            </td>                           
	                        </tr>                 
	                    </table>
	
	                    
	                    <br>
	                    <textarea style="display:none;" id="content" name="boardContent"></textarea>
						<!-- 
						 <input type="hidden" id="content" name="content" value="">
						 -->
	                    <input id="boardType-pic" type="hidden" name="boardType" value="${type}">
	                    <input type="hidden" name="memNo" value="${loginUser.memNo}">
	                    <input type="hidden" name="boardWriter" value="${loginUser.nickName}">
	                    
	                    <div align="center">
	                        <button type="submit" class="btn btn-primary" onclick="combineFunction()">등록하기</button>
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
	                    <input id="boardType-table" type="hidden" name="boardType" value="${type}">
	                    <input type="hidden" name="memNo" value="${loginUser.memNo}">
	                    <input type="hidden" name="boardWriter" value="${loginUser.nickName}">
	                    
	                    <div align="center">
	                        <button type="submit" class="btn btn-primary" onclick="combineFunction()">등록하기</button>
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
    	
    	<!--선택된 게시판 종류에 따라 게시판의 양식 변경-->
        function ChangedValue() {
            
            var value_str=document.getElementById('boardType');

            if(value_str.options[value_str.selectedIndex].value=='S') {
                $(".picture-area").show();
                $(".table-area").hide();
                $('#boardType-pic').val(value_str.options[value_str.selectedIndex].value);
            }  else {
                $(".picture-area").hide();
                $(".table-area").show();
                $('#boardType-table').val(value_str.options[value_str.selectedIndex].value);
            };

        };
        
        <!-- 업로드되는 썸네일로 src값을 변경-->     
        function onFileSelected(event) {
        	  var selectedFile = event.target.files[0];
        	  var reader = new FileReader();

        	  var imgtag = document.getElementById("myimage");
        	  imgtag.title = selectedFile.name;

        	  reader.onload = function(event) {
        	    imgtag.src = event.target.result;
        	  };

        	  reader.readAsDataURL(selectedFile);
        };

        <!--text 합치고 content에 넣기-->      
        function combineFunction() {
        	  var text1=document.getElementById("text1").value;
        	  var text2=document.getElementById("text2").value;       
        	  var text3=document.getElementById("text3").value;    
        	  var text4=document.getElementById("text4").value;
        	  var content = text1+"|nongbusim|"+text2+"|nongbusim|"+text3+"|nongbusim|"+text4;
        	  var contentCopy=content.substring(0);
        	  document.getElementById("content").value = contentCopy;    	
        };
        
        <!-- 추가 내용 쓸 수 있는 공간 보이기 -->
        $('.add-content').click(function(){
        	
        	if($('#upfile-area1').css('display')=='none') {
        		$('#upfile-area1').css('display','block');
        		$('#upfile1').css('display','none');
        		$('#text2').attr('required',true);
        	} else if($('#upfile-area2').css('display')=='none'){
        		$('#upfile-area2').css('display','block');
        		$('#upfile2').css('display','none');
        		$('#text3').css('required',true);
        	} else {
        		$('#upfile-area3').css('display','block');
        		$('#upfile3').css('display','none');
        		$('#text4').css('required',true);
        	};
        	
        });
        
        <!-- 이미지 미리보기 -->
        function loadImg(inputFile, num){

            if(inputFile.files.length > 0) {
                
                const reader = new FileReader();

                reader.readAsDataURL(inputFile.files[0]);

                reader.onload = function(e){

                    switch(num){

						case 1 : $('#upimage1').attr('src', e.target.result); break;
						case 2 : $('#upimage2').attr('src', e.target.result); break;
						case 3 : $('#upimage3').attr('src', e.target.result); break;
                    } 
                }       
            } else {
				 switch(num){
				 case 1: $('#upimage1').attr('src', 'https://adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg'); break;
				 case 2: $('#upimage2').attr('src', 'https://adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg'); break;
				 case 3: $('#upimage3').attr('src', 'https://adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg'); break;
			 		}
            }
        };

    </script>


</body>
</html>