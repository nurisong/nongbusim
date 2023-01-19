<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../myPageFarmerCommon.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#listAreaTable img {
		width: 200px;
		height: 150px;
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
    
    
    
	  #listAreaTable img {
	  transform: scale(1);
	  -webkit-transform: scale(1);
	  -moz-transform: scale(1);
	  -ms-transform: scale(1);
	  -o-transform: scale(1);
	  transition: all 0.3s ease-in-out;   
		
	}
	#listAreaTable img:hover {
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

<h1>농작물입출금 모아보기</h1>


<!--조회기간 설정 후, "검색"버튼 누를 시 ajax 실행 -->
<div class="selectArea" style="float:left">
	<div class="selectPeriod">
		조회기간 &nbsp; &nbsp;
		<button type="button" onclick="selectPeriod('oneMonth');">1개월</button>
		<button type="button" onclick="selectPeriod('threeMonths');">3개월</button>
		<button type="button" onclick="selectPeriod('sixMonths');">6개월</button>
		<button type="button" onclick="selectPeriod('oneYear');">1년</button>
		<input type="date" id="startDate" name="startDate"> ~ <input type="date" id="endDate" name="endDate">
	</div>
	<div class="selectTransaction">
      <label><input type="radio" name="type" value="selectAll" checked> 전체 </label>
	  <label><input type="radio" name="type" value="I"> 수입 </label>
      <label><input type="radio" name="type" value="O"> 지출 </label>
	</div>	
	
	<div class="selectCategory">
		분류 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select id="enrolledCategory">		
			<c:choose>
			<%-- db에서 select해온 items(카테고리&품목이 담긴 arratyList)가 비어있지 않다면 반복문을 통해 select태그를 생성--%>
				<c:when test="${ not empty catAndGoods}">
					<option value="selectAll" selected>전체</option>				
					<c:forEach var="account" items="${catAndGoods}">
						<c:if test="${account.accountCategory ne ' '}">
							<option>${ account.accountCategory }</option>
						</c:if>
					</c:forEach>				
				</c:when>
				<c:otherwise>
					<option value="noCategory">등록된 카테고리가 없습니다.</option>
				</c:otherwise>
			</c:choose>
		</select>
	</div>		
	<div class="selectGoods">
		품목 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select id="enrolledGoods">		
			<c:choose>
			<%-- db에서 select해온 items(카테고리&품목이 담긴 hashmap)가 비어있지 않다면 반복문을 통해 select태그를 생성--%>
				<c:when test="${ not empty catAndGoods}">
					<option value="selectAll" selected>전체</option>				
					<c:forEach var="account" items="${catAndGoods}">
						<c:if test="${account.goods ne ' '}">
							<option>${account.goods }</option>
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<option value="noGoods">등록된 품목이 없습니다.</option>
				</c:otherwise>
			</c:choose>
		</select>
	</div>		
	<div>
		<button type="button" onclick="selectAccountList(1);">검색</button>
		<a href="enrollForm.ac">입출금일지 작성하기</a>
		 <a href="calView.ac">달력으로 보기</a>
	</div>

	<br><br><Br>
	<button>선택삭제</button>
	<button>선택수정</button>
	<button>엑셀 다운로드</button>

	<div id="listArea">
		<table id="listAreaTable">
		</table>
	</div>	

	<div id="pagingArea">
        <ul id="pagination">
        </ul>
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
	
	
	//기간, 구분, 분류, 품목 지정 후 "검색" 버튼 누를 시 시행되는 함수 (ajax)
	function selectAccountList(cpage){		
		// yyyy-mm-dd형식
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		
		
		// category.val 에는 카테고리명 or noCategory
		var accountCategory = $('#enrolledCategory').val();
		var goods = $('#enrolledGoods').val();
		// type (selectAll, income, outcome)중 체크된 라디오버튼
		var type=$("input[name=type]:checked").val();
		// ajax로 해당 조건을 만족하는 accountList받아오기
		$.ajax({
			url: 'selectAccountList.ac',
			data : {
				startDate : startDate,
				endDate : endDate,
		 		accountCategory : accountCategory,		
				goods: goods,
				type: type,
				cpage : cpage
			},
			success: function(list){
				var result = '<div class="item-area">'
					+'<tr><th><input type="checkbox" id="checkAll"></th><th>날짜</th><th>구분</th><th>분류</th><th>품목</th><th>금액</th><th>내용</th></tr>';
				// 만약 돌아온 list가 없다면, 마지막에 list.add()로 pi를 넣어뒀으므로
				// list[0] 엔 pi가, list[1] 부터는 비어있을 것
				if(list[1] != null ){

					for(var i=0; i<list.length-1 ; i++) {                
					result 
						+='<div class="item-area">'
						+ '<tr onclick="selectAccount('+list[i].accountNo+');">'
						+'<td><input type="checkbox" class="check" name="accountNo" value="'+list[i].accountNo+'"></td>'
						+'<td><p>' + list[i].createDate + '</p></td>'
						+'<td><p>'+list[i].type+'</p></td>'
						+ '<td><p>' + list[i].accountCategory + '</p></td>'
						+ '<td><p>' + list[i].goods + '</p></td>'
						+ '<td><p>' + list[i].amount + '</p></td>'						
						+ '<td><p>' + list[i].accountContent + '</p></td>'                 
						+ '<input type="hidden" name="accountNo" id="accountNo" value="'+list[i].accountNo+'">'
						+'</div>'                    
					}
					
					
					// 동적으로 페이징버튼 만들기
					// list의 마지막 인덱스에 "pi"가 담겨있음
					if(list[list.length-1] != null){
						
						var innerPagi = '';
						
						console.log("hi");
						var pi = list[list.length-1];
						console.log(pi);						
						if(pi.currentPage == 1){
							innerPagi += '<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>'
						} else {
							innerPagi +=  '<li class="page-item"><a class="page-link" onclick="selectAccountList('+(pi.currentPage - 1)+');" >Previous</a></li>'
						

						}
						
						for(var i=pi.startPage ; i<=pi.endPage; i++){
							innerPagi += '<li class="page-item "><a class="page-link" onclick="selectAccountList('+i+');" >'+i+'</a></li>'

						}
						
						if(pi.currentPage == pi.maxPage){
							innerPagi += '<li class="page-item disabled"><a class="page-link" href="#" >Next</a></li>'
			                
						} else {
							innerPagi += '<li class ="page-item"><a class="page-link" onclick="selectAccountList('+(pi.currentPage +1)+');">NEXT</a>'
						
						}
						
					}
					
					
				} else {
 					result= '작성한 영농일지가 없습니다'
				}                   
               	 $('#listAreaTable').html(result);
               	 $('#pagination').html(innerPagi);
			},
			error: function(){
				console.log('실패');
			}
		
			
		});
		
	}

		
	function selectAccount(accountNo){
		$(location).attr('href', '${pageContext.request.contextPath}/detail.ac?ano='+accountNo);
		
	}
	
	//list.di가 처음 로딩될  때 default 값 
	// 검색조건 - 1년, 품목- 전체
	$(function(){
		
		selectPeriod('oneYear');
		selectAccountList();
		
	});
	

	
	
    $("#checkAll").change(function(){
	    if($(this).attr("checked", true)){
	       	$(".check").attr("checked", true);
	   } else {
	       	$(".check").attr("checked", false);
	   }
    });
	
    
	// 체크박스 
	$("#checkAll").change(function() {
		if($("#checkAll").attr("checked", true)){
			$("input[name=accountNo]").attr("checked", true);	
		} else{
			$("input[name=accountNo]").attr("checked", false);
		}
	});

	$(".check").click(function() {
		var total = $(".check").length;
		var checked = $("input[name=accountNo]:checked").length;

		if(total != checked) $("#checkAll").attr("checked", false);
		else $("#check").attr("checked", true); 
	});
      
	
 
</script>






	

</body>
</html>
