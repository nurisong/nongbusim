<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.0.2/index.global.min.js"></script>
<title>영농일지 캘린더</title>
<style>	
	.container{
		padding-left:25%;
		margin: 0px;
	}
	/* 일요일 날짜 빨간색 */
	.fc-day-sun a {
	  color: red;
	  text-decoration: none;
	}
	
	/* 토요일 날짜 파란색 */
	.fc-day-sat a {
	  color: blue;
	  text-decoration: none;
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
 
	}
</style>
	

</head>

<body>
<jsp:include page="../myPageFarmerCommon.jsp" />
	<div class="container">
	   <div class="title">
			<h3>🌿영농일지 내역</h3>
			<a class=likeButton href="list.di">모아보기</a><a class=likeButton href="enrollForm.di">작성하기</a><br>
	  </div>
	  <br><br><br>
	  <div class="calArea">
	      <div id='calendar'></div>	
	  </div>
	  <br><br><br><br>
	</div>
</body>
 <script>

   
 var calendar = null;
 document.addEventListener('DOMContentLoaded', function() {

   var calendarEl = document.getElementById('calendar');
   var all_events = null;
   all_events = loadEvents();
  
   calendar = new FullCalendar.Calendar(calendarEl, {
   	 height: 700,
   	 headerToolbar: {
   	        left: 'prev,next',
   	        center: 'title',        	  
   	      },

   	 buttonText: {
   		 today: '오늘 날짜로'
   	 },    
        locale: 'ko',
	   	initialView: "dayGridMonth",
	   	slotMinTime: '09:00',
        slotMaxTime: '19:00',
        selectable: true,
        firstDay: 1,
        titleFormat: function (date) {
          year = date.date.year;
          month = date.date.month + 1;
          return year + "년 " + month + "월";
        },
        select: function(arg){
       	  var startDate= arg.startStr;
       	  // fullCalender에서 날짜를 드래그하여 선택시
       	  // arg.endStr값은 마지막 드래그날짜 +1
       	  // 실제 드래그 마지막날을 선택하려면 arg.endStr 보다 하루 빠른 날짜로 설정해야함
       	  
       	 // 실제 드래그 마지막날 변수(endDate)에 담기         	 


			 var endStr = arg.endStr;
			 var split = endStr.split('-');
			// date 문자열 분리 후, day 해당하는 부분 -1
			// 분리된 문자열로 다시 Date 객체 생성
			var endDate = new Date(split[0], split[1], split[2]-1);
			 
			// 생성된 date객체를 YYYY/mm/dd 형식으로 변환
			 var endDate2 = endDate.getFullYear() +
		  		'-' + ( (endDate.getMonth()) < 9 ? "0" + (endDate.getMonth()) : (endDate.getMonth()) )+
		  		'-' + ( (endDate.getDate()) < 9 ? "0" + (endDate.getDate()) : (endDate.getDate()) );
			 
			 // startDate와 endDate 넘기기
			 location.href="${pageContext.request.contextPath}/enrollForm.di?startDate="+startDate+"&endDate="+endDate2;
        },
        
       events: all_events,
       
       eventClick: function(info) {
           	location.href= "${pageContext.request.contextPath}/detail.di?dno="+info.event.id;
          
       },
    	eventRender: function (event, element, icon) {
    		if(event.Score != '' && typeof event.Score  !== "undefined"){
    			element.find(".fc-title").append("<br/><b>"+event.Score+"</b>");
    		}
    	},
		 datesSet: function(info){
			console.log("change datesSet");

			//calendar.getDate()
			// 화면에 보이는 calendar 월 버튼 클릭하여 변경 시 
			// 해당 월 첫 번쨰 날짜를 반환 , 초기값은 현재날짜 (sysdate)
			
			// yyyy-mm-01을 반환하는 dateformat호출
			var yearMonth =dateFormat(calendar.getDate());
			console.log(yearMonth);
		 }
		 });


      calendar.render();
	   //console.log(calendar.getDate());

	});



	  	//1. 전체이벤트 데이터를  추츨해서 2. ajax로 서버에 전송하여 db저장
	function loadEvents(){
	  	
	  	var return_value;
		 $.ajax({
			type: "post",
			url: "calList.di",
			contentType : "application/json",
			dataType:"json",
			async: false,
			success: function(result){
				console.log(result);
				return_value = result;
			},
			error: function(){
				console.log('실패');
			}			
			
		 });
		 
		 console.log(return_value);
		 return return_value;
	};
	//날짜를 yyyy-mm-01로 바꿔주는 함수
	//해당월 마지막 날짜는 oracle이 제공하는 lastday 함수 이용
	function dateFormat(date) {
		let dateFormat2 = date.getFullYear() +
		'-' + ( (date.getMonth()+1) < 9 ? "0" + (date.getMonth()+1) : (date.getMonth()+1) )+
		'-01';
		return dateFormat2;
	}


</script>
</html>