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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@600;700&display=swap" rel="stylesheet">

<style>

    body{
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
	}

    .content{
        width:80%;
        margin:auto;
    }
    .innerOuter{
        border:1px solid lightgray;
        width:80%;
        padding-left: 15%;
        margin:auto;
        padding:5% 10%;
        background-color:white;
    }

    #insertForm>table {width:100%;}
    #insertForm>table * {margin:5px;}
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>글쓰기</h2>
            <br>

            <form id="insertForm" method="post" action="insert.mk" enctype="multipart/form-data">
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
                                <img src="" alt="" id="titleImg" width="250px" height="250px">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="marketTitle" placeholder="상품의 이름을 적어주세요" style="width: 515px;" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="number" class="form-control" name="marketPrice" style="width: 515px;" min="1">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <textarea cols="60" rows="8" name="marketIntro" style="resize:none;" placeholder="상품을 간단히 소개해주세요"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="file" name="upfiles" id="upfile1" class="form-control-file border" required onchange="loadImg(this, 1);" accept="image/*">
                            </td>
                        </tr>
                        <tr style="display:none;">
                            <td colspan="2">
                                <input type="file" name="upfiles" id="upfile2" class="form-control-file border" onchange="loadImg(this, 2);" accept="image/*">
                            </td>
                        </tr>
                        <tr style="display:none;">
                            <td colspan="2">
                                <input type="file" name="upfiles" id="upfile3" class="form-control-file border" onchange="loadImg(this, 3);" accept="image/*">
                            </td>
                        </tr>
                        <tr style="display:none;">
                            <td colspan="2">
                                <input type="file" name="upfiles" id="upfile4" class="form-control-file border" onchange="loadImg(this, 4);" accept="image/*">
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="2">
                                <textarea cols="100" rows="10" name="marketContent" style="resize:none;" placeholder="상품을 자세히 소개해주세요!"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>


    <script>

        function loadImg(inputFile, num){

            if(inputFile.files.length > 0) { //파일이 첨부되었다는 뜻
                

                //썸네일칸에 이미지 미리보기 띄워주기
                const reader = new FileReader();

                reader.readAsDataURL(inputFile.files[0]);

                reader.onload = function(e){

                    switch(num){

						case 1 : $('#titleImg').attr('src', e.target.result); break;

                    }



                }

                $('#upfile2').parents('tr').css('display', ''); //첫번째 파일을 첨부하면 두번째 파일첨부 태그 생성



                //3번째, 4번째 파일첨부칸 생성
                if(num == 2){

                    $('#upfile3').parents('tr').css('display', '');

                }
                
                if(num == 3){

                    $('#upfile4').parents('tr').css('display', '');

                }

                if(num == 4){

                    $('#upfile4').after('<tr><td colspan="2">파일첨부는 최대 4개까지만 가능합니다.</td></tr>');

                }
   
            }else{ //이미지가 첨부되어있지 않은 상태
    

            }
        }

    </script>


</body>
</html>