<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../../../common/menubar.jsp" %>
<%@ include file="../myPageFarmerCommon.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.img-area img {
		width: 300px;
		height: 250px;
		margin-left: 10px;
		margin-right: 10px;
		border-radius: 5%;
		object-fit: cover;
	}

	.item-area img {
	  transition: all 0.2s linear;
	}
	.item-area:hover img {
	  transform: scale(1.4);
	}

	
	.item-area {

	  margin: 0px auto;
	  overflow: hidden;
	}


	.item-area a {
		text-decoration: none;
		color: rgb(100, 100, 100);   
	}
	
	.img-area a {
		text-decoration: none;
		color: rgb(100, 100, 100);   
	}
	

	.item-area:hover a p {
		color: rgb(10, 10, 10);
	}

	.item-area h6 {
		color: rgb(100, 100, 100);; 
	}

	.item-area:hover h6{
		color: rgb(49, 81, 179); 
	}

	.form-check-label input[type=radio] {
        display: none;
    }

    .form-check-label input[type="radio"] + span {
        display: inline-block;
        padding: 10px 10px;
        border: 1px solid #dfdfdf;
        background-color: #ffffff;
        text-align: center;
        cursor: pointer;
        margin-right: 20px;
        border-radius: 10%;
    }

    .form-check-label input[type="radio"]:checked + span {
        background-color: #007bff;
        color: #ffffff;
    }


	
	
    th, td {
	padding-top: 20px;
    padding-bottom: 20px;
    padding-left: 30px;
    padding-right: 40px;
    }
    
    #tdBottom{
    	padding-right: 20px 20px 0px 30px;
    	margin-right: 10px;
       	align: bottom;
  	    valign: bottom;
  	    font-size: 16px;

    }
    
    #tdUp{
    	padding-right: 20px 20px 0px 30px;
    	margin-right:10px;
    	align: top;
    	valign: top;
    	font-size: 16px;
    }
    
    
    
    
    .withBorder	{
		border-collapse: collapse;
		width : 1000px;
		border: none;
		font-size: 20px;
		transition: 1s;
		border-spacing: 30px;		
		border: 1px dotted gray;
		padding : 10px 20px 20px 20px;

	}
	 
	 .withBorder tr:hover{
		cursor : pointer;
		background-color:#f3e9e9 !important;
		font-weight: bolder;
		font-size: 22px;
	
	}  
    

	 .withBorder div {
	 	
	 	height: 100px;
		display: table-cell; 
		vertical-align: middle;
		align:center;
		
			 	
	 }
    
    
    
   .myButton{ 
 		    background-color: #FFA500;
     		color: maroon;
     		text-align: center;
     		text-decoration: none;
     		display: inline-block;
     		border-radius: 5px;
     		font-size: 15px;
     		padding-top : 0px;
     		margin-top: 0px;
     		border-top: 0px; 
     		align: right; 		
     		
   	
    }
    
    h6 {
    	line-height: 150%;
    
    }
    
    
    
	  .img-area img {
	  transform: scale(1);
	  -webkit-transform: scale(1);
	  -moz-transform: scale(1);
	  -ms-transform: scale(1);
	  -o-transform: scale(1);
	  transition: all 0.3s ease-in-out;   
		
	}
	.img-area img:hover {
	  transform: scale(1.1);
	  -webkit-transform: scale(1.1);
	  -moz-transform: scale(1.1);
	  -ms-transform: scale(1.1);
	  -o-transform: scale(1.1);
	  overflow: hidden;
	}
</style>
</head>
<body>

<h1>영농일지 모아보기</h1>
<div class="selectArea">
	<div class="selectPeriod">
		조회기간 &nbsp; &nbsp;
		<button type="button" onclick="selectPeriod('oneMonth');">1개월</button>
		<button type="button" onclick="selectPeriod('threeMonths');">3개월</button>
		<button type="button" onclick="selectPeriod('sixMonths');">6개월</button>
		<button type="button" onclick="selectPeriod('oneYear');">1년</button>

		<input type="date" id="startDate" name="startDate"> ~ <input type="date" id="endDate" name="endDate">
	</div>
	<div class="selectCategory">
		품목 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select id="enrolledCategory">		
			<c:choose>
			<%-- db에서 select해온 categroyList가 비어있지 않다면 반복문을 통해 select태그를 생성--%>
				<c:when test="${ not empty categoryList }">
					<c:forEach var="category" items="${categoryList }">
						<option>${ category.diaryCategory }</option>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<option value="noCategory">등록된 카테고리가 없습니다.</option>
				</c:otherwise>
			</c:choose>
			
		</select>
	</div>	
	<div style="align:right">
		<button type="button" onclick="selectDiaryList();">검색</button>
		<button type="reset" style="align:right">초기화</button>	
	</div>
	<div id="listArea">
	<table id="listAreaTable">
	</table>
	</div>
	
</div>
<script>

	function selectPeriod(period){
		
		var startDate ;
		var now = new Date();	
		console.log(now);
		
		console.log("now"+dateFormat(now));
		$('#endDate').val(dateFormat(now));
		
		
		switch(period){
		
		case 'oneMonth':
			startDate = new Date(now.setMonth(now.getMonth() - 1));			
			break;
		case 'threeMonths':
			startDate = new Date(now.setMonth(now.getMonth() - 3));
			break;		
		case 'sixMonths':
			startDate = new Date(now.setMonth(now.getMonth() - 6));
			break;		
		case 'oneYear':
			startDate = new Date(now.setFullYear(now.getFullYear() - 1));
			break;		
	
			
		
		}
	
		
		console.log("startDate"+dateFormat(startDate));
		$('#startDate').val(dateFormat(startDate));
		
	} 
	
	
	
	//날짜를 yyyy-mm-dd로 바꿔주는 함수
	function dateFormat(date) {
		let dateFormat2 = date.getFullYear() +
		'-' + ( (date.getMonth()+1) < 9 ? "0" + (date.getMonth()+1) : (date.getMonth()+1) )+
		'-' + ( (date.getDate()) < 10 ? "0" + (date.getDate()) : (date.getDate()) );
		return dateFormat2;
	}
	
	
	
		//기간, 카테고리 지정 후 "검색" 버튼 누를 시 시행되는 함수 (ajax)
	function selectDiaryList(){		
		// yyyy-mm-dd형식
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		
		
		// category.val 에는 카테고리명 or noCategory
		var diaryCategory = $('#enrolledCategory').val();
		
		$.ajax({
			url: 'selectDiaryList.di',
			data : {
				startDate : startDate,
				endDate : endDate,
		 		diaryCategory : diaryCategory,						
			},
			success: function(list){
				console.log(list);

                var result = '';
				if(!list.empty){

					for(var i=0; i<list.length ; i++) {                
					result 
						+='<div class="item-area">'
						+ '<div class="img-area">'
						+ '<tr onclick="selectDiary('+list[i].diaryNo+');">'
						+'<td><p>' + list[i].createDate + '</p></td>'
						+ '<td><p>' + list[i].diaryCategory + '</p></td>'
						+ '<td><p>' + list[i].diaryContent + '</p></td>'                    
						+ '<td><img src="' + list[i].diaryThumbnail + '"></td></tr>'
						+ '</div>' + '</a>'
						+ '<input type="hidden" name="diaryNo" id="diaryNo" value="'+list[i].diaryNo+'">'
						+'</div>'                    
					}
				} else {
 					result= '작성한 영농일지가 없습니다'
				}                   
               	 $('#listAreaTable').html(result);
			},
			error: function(){
				console.log('실패');
			}
		
			
		});
		
	}
		
	function selectDiary(diaryNo){
		$(location).attr('href', '${pageContext.request.contextPath}/detail.di?dno='+diaryNo);
		
	}
	
		
		

	
</script>






	

</body>
</html>
