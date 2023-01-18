<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농부심</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.outer{font-family: 'Pretendard-Regular';}
.main-area{
    width: 1200px;
    padding: 50px;
}
.main-area>h1{float: left;}
#list-btn{float: right;}
#list-btn:hover{cursor: pointer;}
.board-area{height: 350px;}
.info-table button{
    border: 1px solid rgb(100, 100, 100);
    border-radius: 2px;
}
.info-table input[type=file]{
    width: 400px;
}
.sub-img-area input{
    display: inline-block;
}
.img-area img {
		width: 200px;
		height: 150px;
		border-radius: 5%;
		object-fit: cover;
	}
	.filebox input[type="file"] {
	    position: absolute;
	    width: 0;
	    height: 0;
	    padding: 0;
	    overflow: hidden;
	    border: 0;
	}
    .filebox .upload-name {
	
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 78%;
    color: #999999;
 }
 
 .filebox label {
     display: inline-block;
     padding: 5px 10px;
     color: #fff;
     vertical-align: middle;
     background-color: #999999;
     cursor: pointer;
     height: 40px;
     margin: 10px;
     border-radius: 3%;
 }


</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

    <div class="outer" align="center">
        <div class="main-area">

            <h1>농장 정보 수정</h1>
            <br><br>

            <br><br><br>
            <div class="board-area">
            	<form action="update.fm" method="post" enctype="multipart/form-data">	
	                <table class="table info-table">
                        <input type="hidden" name="farmNo" value="${farm.farmNo}">
	                    <tr>
	                        <th>농장이름</th>
	                        <td colspan="3"><input type="text" class="form-control" required name="farmName" value="${farm.farmName}"></td>
	                    </tr>
                        <tr>
                            <th>지역</th>
                            <td>
                                <select name="localCode" id="localCode" class="form-control" style="width: 80px;">
                                    <option value="su">서울</option>
                                    <option value="gg">경기</option>
                                    <option value="ic">인천</option>
                                    <option value="gw">강원</option>
                                    <option value="cc">충청</option>
                                    <option value="gs">경상</option>
                                    <option value="jl">전라</option>
                                    <option value="jj">제주</option>
                                </select>
                            </td>
                        </tr>
	                    <tr>
	                        <th>주소</th>
	                        <td colspan="3"><input type="text" class="form-control" required name="address" value="${farm.address}"></td>
	                    </tr>
	                    <tr>
	                        <th>연락처</th>
	                        <td colspan="3"><input type="text" class="form-control" required name="phone" value="${farm.phone}"></td>
	                    </tr>
                        <tr>
	                        <th>대표사진</th>
	                        <td colspan="3">
                                <c:forEach var="at" items="${atList}" varStatus="status">
                                    <c:if test="${at.fileLevel eq 1}">
                                        <div>
                                            <img width="150" id="mainImg" src="${at.changeName}">
                                            <input type="hidden" name="originFileNo " value="${at.fileNo}">
                                            <input type="hidden" name="chageName" value="${at.at.changeName}">
                                            <span class="originName">${at.originName}</span>
                                            <button type="button" id="del-img-btn" onclick="delImg(this, 0)">변경</button>
                                        </div>
                                        <div id="newFilesMain" style="display: none;">
                                            <input type="file" class="form-control-file border" name="upfileMain" id="upfileMain" accept="image/*">
                                        </div>
                                    </c:if>
                                </c:forEach>
                                <!-- <img width="200" src="${atList[0].changeName}">
                                <span>${atList[0].originName}</span><button>수정</button>
                                <input type="file" class="form-control-file border" name="upfiles" accept="image/*"> -->
	                        </td>
	                    </tr>

                        <script>
                            var delFiles = [];
                            var delFilesPath = [];

                            function delImg(this, num){

                                delFiles.push($(this).parent().children().eq(1).val());
                                delFilesPath.push($(this).parent().children().eq(2).val());



                            }

                        </script>
	                    <tr>
                            <th>상세사진</th>
	                        <td colspan="3" class="sub-img-area">
                                <button type="button" class="add-btn">추가</button><label style="display: none;" id="max-label"> 상세 사진 첨부는 최대 3장까지 가능합니다.</label><br><br>
                                <c:forEach var="at" items="${atList}" varStatus="status">
                                    <c:if test="${at.fileLevel ne 1}">
                                        <div>
                                            <img width="150" id="detailImg" src="${at.changeName}">
                                            <input type="hidden" name="originFileNo" value="${at.fileNo}">
                                            <label class="originName">${at.originName}</label>
                                            <button type="button" class="del-img-btn" onclick="delImg(this, 0)">삭제</button><br><br>
                                        </div>
                                    </c:if>
                                </c:forEach>

                                <div>
                                    <div>
                                       <input type="file" id="">

                                    </div>
                                    <div>
                                        <div class="filebox">
                                            <input class="upload-name"  id="upload-name1" value="첨부파일" placeholder="첨부파일" >
                                            <label for="file1">파일찾기</label> 
                                            <input type="file" name="upfiles" id="file1" onchange="loadImg(this,1);">
                                        </div>
                                    </div>
                                    <div>
                                        <div class="img-area">
                                            <img src=""  class="contentImg" id="contentImg1">
                                        </div>
                                    </div>
                                </div>

                                <div>
                                    <div>
                                        <div class="filebox">
                                            <input class="upload-name"  id="upload-name2" value="첨부파일" placeholder="첨부파일" >
                                            <label for="file2">파일찾기</label> 
                                            <input type="file" name="upfiles" id="file2" onchange="loadImg(this,2);">
                                        </div>
                                    </div>
                                    <div>
                                        <div class="img-area">
                                            <img src=""  class="contentImg" id="contentImg2">
                                        </div>
                                    </div>
                                </div>

                                <div>
                                    <div>
                                        <div class="filebox">
                                            <input class="upload-name"  id="upload-name3" value="첨부파일" placeholder="첨부파일" >
                                            <label for="file3">파일찾기</label> 
                                            <input type="file" name="upfiles" id="file3" onchange="loadImg(this,3);">
                                        </div>
                                    </div>
                                    <div>
                                        <div class="img-area">
                                            <img src=""  class="contentImg" id="contentImg3">
                                        </div>
                                    </div>
                                </div>

                            </td>
	                    </tr>
	                    <tr>
	                        <th>소개글</th>
	                        <td colspan="3">
	                            <textarea class="form-control" style="resize: none;" rows="10" name="farmIntro">${farm.farmIntro}</textarea>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th width="100">대표작물</th>
	                        <td colspan="3"><input type="text" class="form-control" required name="crop" value="${farm.crop}"></td>
	                    </tr>
	                </table>
	
	                <button type="submit" class="btn btn-secondary">수정하기</button>
	                <a class="btn btn-secondary" href="">취소하기</a>
	            </div>

                <input type="hidden" name="delFiles" id="delFiles">
                <input type="hidden" name="delFilesPath" id="delFilesPath">




            </form>

           
        </div>
    </div>

    <script> 
        $(function(){
            $('#localCode').val('${farm.localCode}').attr('selected', selected);
        })

        var delFiles = [];
        var delFilesPath = [];

        function delImg(num) {
            $("'#newFile" + num + "'").attr('hidden', false);
        }

        function loadImg(inputFile, num){
				
				
				if(inputFile.files.length ==1){
				
					 var reader = new FileReader();
					
					reader.readAsDataURL(inputFile.files[0]);
					 
					 reader.onload = function(e){
						 switch(num){
						case 1: 
							 $('#contentImg1').attr('src', e.target.result);
							 break;
						 case 2: 
							 $('#contentImg2').attr('src', e.target.result);
							 break;
						 case 3: 
							 $('#contentImg3').attr('src', e.target.result);
							 break;
						 
					 	}
						
					 }
				  } else {
					 switch(num){
					 case 1: 
						 $('#titleImg').attr('src', 'https://t4.ftcdn.net/jpg/05/17/53/57/240_F_517535712_q7f9QC9X6TQxWi6xYZZbMmw5cnLMr279.jpg');
						 break;
					 case 2: 
						 $('#contentImg1').attr('src', 'https://t4.ftcdn.net/jpg/05/17/53/57/240_F_517535712_q7f9QC9X6TQxWi6xYZZbMmw5cnLMr279.jpg');
						 break;
					 case 3: 
						 $('#contentImg2').attr('src', 'https://t4.ftcdn.net/jpg/05/17/53/57/240_F_517535712_q7f9QC9X6TQxWi6xYZZbMmw5cnLMr279.jpg');
						 break;
					 case 4: 
						 $('#contentImg3').attr('src', 'https://t4.ftcdn.net/jpg/05/17/53/57/240_F_517535712_q7f9QC9X6TQxWi6xYZZbMmw5cnLMr279.jpg');
						 break;
				 } 
				 
			}
	
		}			
	

		
		
		$("#file1").on('change',function(){
			  var fileName1 = $("#file1").val();
			  $("#upload-name1").val(fileName1);
		});
		
		$("#file2").on('change',function(){
			  var fileName2 = $("#file2").val();
			  $("#upload-name2").val(fileName2);
		});
		
		$("#file3").on('change',function(){
			  var fileName3 = $("#file3").val();
			  $("#upload-name3").val(fileName3);
			  

	});	

        // 삭제 버튼 클릭시
        $('#del-img-btn').on('click', function(){
            console.log($(this).parent().children().eq(1).val());

            delFiles.push($(this).parent().children().eq(1).val());
            delFilesPath.push($(this).parent().children().eq(0).attr("src"));
            console.log(delFiles);

            $('#delFiles').val(delFiles);
            $('#delFilesPath').val(delFilesPath);
            console.log($('#delFiles').val());

            $(this).parent().children().eq(2);
            $(this).parent().children().eq(2).remove();
            $(this).parent().children().eq(0).remove();
            $(this).parent().children().eq(0).remove();
            //$(this).parent().children().eq(0).remove();
           
            $(this).remove();

            $('#upfileMain').attr('required', true);
            $('#newFilesMain').css('display', '');
        })
        
        var maxAppend = '${atList.size()}';

        $('.del-img-btn').on('click', function(){
            // console.log($(this).parent().children().eq(0).attr("src"));

            delFiles.push($(this).parent().children().eq(1).val());
            delFilesPath.push($(this).parent().children().eq(0).attr("src"));
            console.log(delFilesPath);
            
            $('#delFiles').val(delFiles);
            $('#delFilesPath').val(delFilesPath);
            console.log($('#delFiles').val());
            console.log($('#delFilesPath').val());
            //$('.delFiles-area').append('<input type="number" name="delFiles" value="'+ $(this).parent().children().eq(1).val() + '">');

            $(this).parent().empty();

            $('')
            //$('.sub-img-area').append('<input type="file" class="form-control-file border" name="upfiles" accept="image/*" required>');
            maxAppend --;
        })

        // 버튼 클릭시 input 추가
        $('.add-btn').on('click', function(){
            if(maxAppend >= 4){
                $('#max-label').css('display', '');
                return;
            }else{
                $('.sub-img-area').append('<div><input type="file" name="upfiles" class="form-control-file border" accept="image/*"> <button type="button" onclick="delInput(this);">삭제</button></div>'); 
                maxAppend ++;
            }
        })

        // 버튼 클릭시 input 삭제
        function delInput(e){
            $(e).parent().empty();
            maxAppend --;
        }





    </script>


</body>
</html>