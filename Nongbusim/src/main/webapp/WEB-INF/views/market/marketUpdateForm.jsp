<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농 부 심</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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

            <form id="updateForm" method="post" action="" enctype="">
                <table algin="center">
                    <thead>
                        <tr>
                            <select name="" id="" style="width: 100px;">
                                <option value="">농산물</option>
                                <option value="">수산물</option>
                                <option value="">축산물</option>
                            </select>
                        </tr>
                        <tr>
                            <td rowspan="3">
                                <div style="width: 250px;">
                                    <img src="" alt="">
                                </div>
                            </td>
                            <td>
                                <input type="text" id="title" class="form-control" name="" placeholder="상품의 이름을 적어주세요">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="number" id="writer" class="form-control" value="" name="">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <textarea name="" id="" cols="60" rows="2" style="resize:none;" placeholder="상품을 간단히 소개해주세요"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="file" id="upfile" class="form-control-file border" name="">
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="2">
                                <textarea name="" id="" cols="100" rows="10" style="resize:none;" placeholder="상품을 자세히 소개해주세요!"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="file" id="upfile" class="form-control-file border" name="">
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                    <button type="reset" class="btn btn-danger">삭제하기</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>

</body>
</html>