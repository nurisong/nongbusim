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
	                <select class="board-select" name="boardType" id="boardType" onchange="ChangedValue();" style="width: 1050px; height: 30px;" disabled>
	                    <option value="S">자랑게시판</option>
	                    <option value="Q">질문게시판</option>
	                    <option value="K">노하우게시판</option>
	                    <option value="M">멘티멘토게시판</option>                      
	                </select>
	            </div>	                
	            	
	            <div class="picture-area" id="picture-area" style="display: none;">
	                
	                <form id="enrollForm" method="post" action="updateForm.bo" enctype="multipart/form-data">
	                    <table align="center">
	                        <tr>
	                            <th width="100"><label for="title">제목</label></th>
	                            <td><input type="text" id="title" class="form-control" name="boardTitle" maxlength="60" required style="width:30%" value="${b.boardTitle }"></td>
	                        </tr>
	                        <tr>
	                            <th width="100"><label for="content">내용</label></th>                         
	                            <td>
	                            


                                     <c:forEach var="at" items="${contentList}" varStatus="status">
                                    <div id="upfile-area${status.count}" align="center">
										    <label for="upfile${status.count}">
										        <img id="upimage${status.count}" class="myimage" src="${a.get(status.index).changeName}" width="300" height="200"/>
										    </label>
										    <input type="file" name="upfiles" id="upfile${status.count}" onchange="loadImg(this, ${status.count});" accept="image/*"/>
                                      
									    <textarea id="text${status.count}" class="form-control" rows="20" cols="125" maxlength="900" style="resize:none;" style="width:200px;">${at}</textarea>
	                             	</div>
									</c:forEach>
                             


	                            </td>                           
	                        </tr>                 
	                    </table>
	
	                    
	                    <br>
	                    <textarea style="display:none;" id="content" name="boardContent"></textarea>
	                    <input id="boardType-pic" type="hidden" name="boardType" value="${type}">
	                    <input type="hidden" name="memNo" value="${loginUser.memNo}">
	                    <input type="hidden" name="boardWriter" value="${loginUser.nickName}">
	                    
	                    <div align="center">
	                        <button type="submit" class="btn btn-primary" onclick="combineFunction()">등록하기</button>
	                        <button type="reset" class="btn btn-danger">취소하기</button>
	                    </div>
	                    <br>
	                </form>     
	                    	<button onclick="combineFunction()">나올려나</button>
	            </div>
	                	
	            <div class="table-area" id="table-area" style="display: none;">
	                
	                <form id="enrollForm" method="post" action="updateForm.bo" enctype="multipart/form-data">
	                    <table align="center">
	                        <tr>
	                            <th><label for="title">제목</label></th>
	                            <td><input type="text" id="title" class="form-control" name="boardTitle" maxlength="60" required style="width:30%" value="${b.boardTitle }"></td>
	                        </tr>
	                        <tr>
	                            <th><label for="content">내용</label></th>
	                            <td><textarea id="content" class="form-control" rows="20" cols="120" maxlength="900" style="resize:none;" name="boardContent" required style="width:200px;">${b.boardContent}</textarea></td>
	                        </tr>
	                        <tr>
	                            <th><label for="upfile">첨부파일</label></th>
	                            <td>
			                        <input type="file" name="upfiles" style="display : none;" accept="image/*" id="bizFile">
									<button type="button"><label for="bizFile" class="btn fileBtn">파일선택</label></button>
									
									<c:if test="${a==null}">
										<span id="fileName">선택된 파일없음</span>
									</c:if>
									<c:if test="${a!=null}">
										<span id="haveFile">
											<c:forEach items="${a}" var="att">${att.originName}									
												<input type="hidden" name="changeName" value="${att.changeName}" >
											</c:forEach>
										</span>
									</c:if>
	                            	
	                            </td>
	                        </tr>
	                
	                    </table>

	                    <br>
	                    <input id="boardType-table" type="hidden" name="boardType" value="${b.boardType}">
	                    <input type="hidden" name="boardNo" value="${b.boardNo}">
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
        	  console.log(text1);
        	  var content = text1+"|nongbusim|"+text2+"|nongbusim|"+text3+"|nongbusim|"+text4;
        	  console.log(content);
        	  var contentCopy=content.substring(0);
        	  document.getElementById("content").value = contentCopy;    	
        };
        
        
        
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
        
        <!--테이블에서 업로드한 파일 이름으로 변경-->
        $(function() {
        	  
       	    $("#bizFile").change(function(e){
				var changedname = e.target.files[0].name;
       	 		$('#fileName').text(changedname);
       	 		$('#haveFile').text(changedname);
       	 		
       	    });

        });
        
        var theFile = document.querySelector('#bizFile');

        theFile.on('click', initialize);

        function initialize(event) {
            document.body.onfocus = checkIt;
            console.log('initializing');
        }

        function checkIt() {
            if (theFile.value.length!=0) {
                aleft('Files Loaded');
            } else {
                alert('Cancel clicked');
            }
            // 초기화
          document.body.onfocus = null;
            console.log('checked');
        };


    </script>

</body>
</html>