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
                                            <div>
                                                <input type="file" class="form-control-file border" id="mainImgInput" name="upfiles" accept="image/*" onchange="loadImg(this, 5);">
                                                <img width="150" src="${at.changeName}" id="mainImg" onchange="">
                                                <label class="originName">${at.originName} </label>
                                                <button type="button" class="edit-img-btn" style="display: none;">찐변경</button>
                                                <button type="button" class="del-img-btn" onclick="clickk();">변경</button>
                                            </div>

                                            <div id="originFile">
                                                <input type="hidden" value="${at.fileNo}">
                                                <input type="hidden" value="${at.changeName}">
                                            </div>
                                        </div>
                                        
                                    </c:if>
                                </c:forEach>
                                <!-- <img width="200" src="${atList[0].changeName}">
                                <span>${atList[0].originName}</span><button>수정</button>
                                <input type="file" class="form-control-file border" name="upfiles" accept="image/*"> -->
	                        </td>
                        </tr>

                            <script>

                                var maxAppend = '${atList.size()}';

                                var delFiles = [];
                                var delFilesPath = [];



                                $(function(){

                                    $('#mainImg').click(function(){ // 이미지 누르면
                                        $('#upfileMain').click(); // input 클릭(파일 등록 창)
                                    })
                                                        

                                })

                                function clickk(){

                                //}

                                //$('.del-img-btn').click(function(){

                                    delFiles.push($(this).parent().parent().children().eq(1).children().eq(0).val());
                                    delFilesPath.push($(this).parent().parent().children().eq(1).children().eq(1).val());
                                    console.log(delFiles);
                                    console.log(delFilesPath);
                                    $(this).parent().children().eq(3).css('display', '');
                                    $(this).parent().children().eq(0).click();
                                    $(this).remove();
                                }

                                $('.edit-img-btn').click(function(){
                                    $(this).parent().children().eq(0).click();
                                })

                                //$('#mainImgInput').change(function(){

                                //    console.log($(this));

                                //})
                                function loadImg(inputFile, num) {
                                        if($(inputFile).files.length == 1) {
                                            var reader = new FileReader();

                                            reader.readAsDataURL($(inputFile).files[0]);

                                            reader.onload = function(e) {
                                                
                                                switch(num) {
                                                    case 5: $('#mainImg').attr('src', e.target.result); break;
                                                }
                                            }
                                        } else {
                                            switch(num){
                                                case 5: $('#mainImg').attr('src', 'data:image/png;base64,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'); 
                                                        break;
                                            }
                                        }


                                    
                                }
                                    
                                    

                                    /*
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
                                    */


                                    

    
    
    
                                

                            </script>
	                    <tr>
                            <th>상세사진</th>
	                        <td colspan="3" class="sub-img-area">
                                <button type="button" class="add-btn">추가</button><label style="display: none;" id="max-label"> 상세 사진 첨부는 최대 3장까지 가능합니다.</label><br><br>
                                <c:forEach var="at" items="${atList}" varStatus="status">
                                    <c:if test="${at.fileLevel ne 1}">
                                        <div>
                                            <img width="150" src="${at.changeName}">
                                            <input type="hidden" name="originFileNo" value="${at.fileNo}">
                                            <span class="originName">${at.originName}</span>
                                            <button type="button" class="del-img-btn" onclick="delImg(0)">삭제</button><br><br>
                                        </div>
                                    </c:if>
                                </c:forEach>

                                <div>
                                    <div>
                                        <div class="filebox">
                                            <img src="" alt="">
                                            <img src="" alt="">
                                            <img src="" alt="">
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

       // function delImg(num) {
       //     $("'#newFile" + num + "'").attr('hidden', false);
        //}

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
        // $('#del-img-btn').on('click', function(){
        //     console.log($(this).parent().children().eq(1).val());

        //     delFiles.push($(this).parent().children().eq(1).val());
        //     delFilesPath.push($(this).parent().children().eq(0).attr("src"));
        //     console.log(delFiles);

        //     $('#delFiles').val(delFiles);
        //     $('#delFilesPath').val(delFilesPath);
        //     console.log($('#delFiles').val());

        //     $(this).parent().children().eq(2);
        //     $(this).parent().children().eq(2).remove();
        //     $(this).parent().children().eq(0).remove();
        //     $(this).parent().children().eq(0).remove();
        //     //$(this).parent().children().eq(0).remove();
           
        //     $(this).remove();

        //     $('#upfileMain').attr('required', true);
        //     $('#newFilesMain').css('display', '');
        // })
        
        var maxAppend = '${atList.size()}';
        
        /*
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
        */

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