<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>영농일지 모아보기</title>
<style>

	.container{
		padding-left:25%;
		margin: 0px;
	}
	#listAreaTable img {
		width: 200px;
		height: 150px;
		margin-left: 10px;
		margin-right: 10px;
		border-radius: 5%;
		object-fit: cover;
	}

	#listAreaTable a {
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

	.form-check-label input[type=checkbox] {
        display: none;
    }

    .form-check-label input[type="checkbox"] + span {
        display: inline-block;
        padding: 10px 10px;
        border: 1px solid #dfdfdf;
        background-color: #ffffff;
        text-align: center;
        cursor: pointer;
        margin-right: 20px;
        border-radius: 10%;
    }

    .form-check-label input[type="checkbox"]:checked + span {
        background-color: #007bff;
        color: #ffffff;
    }

	
	
    th, td {
	padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 10px;
    padding-right: 10px;
    text-align: center;
    }

    
    table	{
    	font-size: 10px;
		border-collapse: collapse;
		width : 1000px;
		border: none;
		font-size: 15px;
		transition: 1s;	
		border: 1px dotted gray;
		border-spacing: 10px;

	}
	   th, td {
    	border-bottom: 1px dotted gray;
        padding: 10px;
    }
	 
	 table tr:hover{
		cursor : pointer;
		background-color:#f3e9e9 !important;
		font-weight: bolder;
	
	}  
    

	table div {
	 	
	 	height: 100px;
		display: table-cell; 
		vertical-align: middle;
		align:center;
		
			 	
	 }
    
    
    
   .myButton{ 
 		    background-color: #cddc39;
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
    
    
	
	button{
	    padding:5px 5px;
	    margin: 3px;
	    min-width: 50px; 
	    heigh:30px;
		font-size: 14px;
	    border: white;
	    background-color: #c5e1a5;
   		color: black;
   		text-decoration: none;
   		border-radius: 5px;   
 
	}
	
	button:hover{
		background-color: forestgreen;
	}

	
	.title {
		margin: 0px;
		display: flex;
		align-items: center;
		text-align: center;
		
	}

	.likeButton{
	    display: flex;
	    padding:5px 5px;
	    margin: 5px;
	    width: 50px; 
	    heigh:30px;
		font-size: 10px;
	    border: white;
	    background-color: #388e3c;
   		color: white;
   		text-align: center;
   		justify-content: center;
   		text-decoration: none;
   		border-radius: 5px;   
 

</style>
</head>
<body>
<jsp:include page="../myPageFarmerCommon.jsp" />
<div class="container">
	<div class="title">
		<h3>🌿영농일지 모아보기 </h3>
		<a class="likeButton" href="calView.di">달력보기</a><a class="likeButton" href="enrollForm.di">작성하기</a><br>
	</div><br>
	
<!--조회기간 설정 후, "검색"버튼 누를 시 ajax 실행 -->
<div class="selectArea" style="float:left; margin-bottom:30px;">
	<div class="selectPeriod">
		조회기간 &nbsp; &nbsp;
		<button type="button" onclick="selectPeriod('oneMonth');">1개월</button>
		<button type="button" onclick="selectPeriod('threeMonths');">3개월</button>
		<button type="button" onclick="selectPeriod('sixMonths');">6개월</button>
		<button type="button" onclick="selectPeriod('oneYear');">1년</button>

		<input type="date" id="startDate" name="startDate"> ~ <input type="date" id="endDate" name="endDate">
	</div>
	<div class="selectCategory"  style="float:left; margin-top:10px;">
		품목 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select id="enrolledCategory">		
			<c:choose>
			<%-- db에서 select해온 categroyList가 비어있지 않다면 반복문을 통해 select태그를 생성--%>
				<c:when test="${ not empty categoryList }">
					<option value="selectAll" selected>전체</option>				
					<c:forEach var="category" items="${categoryList}">
						<option>${ category.diaryCategory }</option>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<option value="noCategory">등록된 카테고리가 없습니다.</option>
				</c:otherwise>
			</c:choose>
			
		</select>
		&nbsp;&nbsp;	
	</div>
	<div style="float:left">
		<button type="button" onclick="selectDiaryList(1);">검색</button>
	</div>
</div>

<br><br><br>	
	<div id="listArea" style="clear:both; margin:20px 0px;">
		<div>
			<button onclick="deleteSelected();">선택삭제</button>
			<button>선택수정</button>
			<button>엑셀 다운로드</button>
		</div>
	<br>
	<div>
		<table id="listAreaTable">
		</table>
	</div>

	<br>
	<div id="pagingArea">
	       <ul class="pagination justify-content-center"></ul>
	    </div>
	    <br>
	</div> 
</div> 
<script>
function selectPeriod(period){
		var startDate1;
		var startDate ;
		var now = new Date();	
		console.log(now);
		
		console.log("now"+dateFormat(now));
		$('#endDate').val(dateFormat(now));
		

		switch(period){
		
		case 'oneMonth':
			// 현재월 - 1개월
			startDate1 = new Date(now.setMonth(now.getMonth() - 1));
			// 현재월 -1개월 +1
			startDate = new Date(startDate1.setDate(startDate1.getDate()+1));
			break;
		case 'threeMonths':
			startDate1 = new Date(now.setMonth(now.getMonth() - 3));
			startDate = new Date(startDate1.setDate(startDate1.getDate()+1));
			break;		
		case 'sixMonths':
			startDate1 = new Date(now.setMonth(now.getMonth() - 6));
			startDate = new Date(startDate1.setDate(startDate1.getDate()+1));
		case 'oneYear':
			startDate1 = new Date(now.setFullYear(now.getFullYear() - 1));
			startDate = new Date(startDate1.setDate(startDate1.getDate()+1));
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
	function selectDiaryList(cpage){		
		// yyyy-mm-dd형식
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		
		
		// category.val 에는 카테고리명 or noCategory
		var diaryCategory = $('#enrolledCategory').val();
		// ajax로 해당 조건을 만족하는 diaryList받아오기
		$.ajax({
			url: 'selectDiaryList.di',
			data : {
				startDate : startDate,
				endDate : endDate,
		 		diaryCategory : diaryCategory,	
		 		cpage : cpage
			},
			success: function(list){
				console.log(list);

                var result = '';
				// 만약 돌아온 list가 없다면, 마지막에 list.add()로 pi를 넣어뒀으므로
				// list[0] 엔 pi가, list[1] 부터는 비어있을 것
				if(list[1] != null ){
					var result =
						'<tr style="background-color:#f1f8e9"><th><input type="checkbox" id="checkAll" name="checkAll"></th><th>썸네일</th><th><div style="min-width:100px; height: 30px;">날짜</div></th><th><div style="min-width:100px; height: 30px;">카테고리</div></th><th>내용</th></tr>';
			
					for(var i=0; i<(list.length)-1 ; i++) {                
					result 
						+= '<tr>'
						+'<td><input type="checkbox" class="check" name="diaryNo" value="'+list[i].diaryNo+'"></td>'
						+'<td onclick="selectDiary('+list[i].diaryNo+');"><img src="' + list[i].diaryThumbnail + '"></td>'
						+'<td onclick="selectDiary('+list[i].diaryNo+');">' + list[i].createDate + '</td>'
						+ '<td onclick="selectDiary('+list[i].diaryNo+');">' + list[i].diaryCategory + '</td>'			
						+ '<td onclick="selectDiary('+list[i].diaryNo+');">' + list[i].diaryContent + '</td></tr>'                         
	        
					}
					
					// 동적으로 페이징버튼 만들기
					// list의 마지막 인덱스에 "pi"가 담겨있음
					if(list[list.length-1] != null){
						
						var innerPagi = '';
						
						console.log("hi");
						var pi = list[list.length-1];
						console.log(pi);						
						if(pi.currentPage == 1){
							innerPagi += '<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>'
						} else {
							innerPagi +=  '<li class="page-item"><a class="page-link" onclick="selectDiaryList('+(pi.currentPage - 1)+');" >이전</a></li>'
						

						}
						
						for(var i=pi.startPage ; i<=pi.endPage; i++){
							innerPagi += '<li class="page-item "><a class="page-link" onclick="selectDiaryList('+i+');" >'+i+'</a></li>'

						}
						
						if(pi.currentPage == pi.maxPage){
							innerPagi += '<li class="page-item disabled"><a class="page-link" href="#" >다음</a></li>'
			                
						} else {
							innerPagi += '<li class ="page-item"><a class="page-link" onclick="selectDiaryList('+(pi.currentPage +1)+');">다음</a>'

							
						}
						
						
					}
					
				} else {
 					result= '작성한 영농일지가 없습니다'
				}                   
               	 $('#listAreaTable').html(result);
               	 $('.pagination').html(innerPagi);
               	 
			},
			error: function(){
				console.log('실패');
			}
		
			
		});
		
	}
		
	function selectDiary(diaryNo){
		$(location).attr('href', '${pageContext.request.contextPath}/detail.di?dno='+diaryNo);
		
	}
	
	//list.di가 처음 로딩될  때 default 값 
	// 검색조건 - 1년, 품목- 전체
	$(function(){
		
		selectPeriod('oneYear');
		selectDiaryList();
		
		// checkAll 클릭시 전체 체크박스 선택
		$(document).on('click', 'input:checkbox[name="checkAll"]',function() {
			var checkAll = $(this).is(":checked");
			if(checkAll){
				$(".check").prop("checked", true);
				
			} else {
				$(".check").prop("checked", false);
			}

	    });
		
		// 전체 체크박스가 선택되었을 시 checkAll selected
		$(document).on('click', 'input:checkbox[name="accountNo"]',function() {
			var total = $('input:checkbox[name=accountNo]').length;
			var checked = $('input:checkbox[name="accountNo"]:checked').length;
			

			
			if(total != checked) {
				$("#checkAll").prop("checked", false);
			} else{
				$("#checkAll").prop("checked", true); 
			}
		});

		
		
		
	});

	// 동적으로 생성된 체크박스 제어하기
	
	//"선택삭제"를 누를 시 동작하는 함수 및 ajax
	function deleteSelected(){
	  var checkboxArr = []; 
	  $('input:checkbox[name="diaryNo"]:checked').each(function() {
	  checkboxArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	  console.log(checkboxArr);
	});
	
	  $.ajax({
	      type  : "POST",
	      url    : "deleteSelected.di",
	      data: {
	      checkboxArr : checkboxArr        // folder seq 값을 가지고 있음.
	      },
	      success: function(result){
	      	console.log(result);
	      	alert(result);
	      	selectDiaryList();
	      	
	      },
	      error: function() {
	      	alert('실패');
	      }  
	   });
	}
		
	
</script>






	

</body>
</html>

