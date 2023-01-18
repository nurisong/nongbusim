<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../myPageFarmerCommon.jsp" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset='utf-8' />
   <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.0.2/index.global.min.js"></script>
	<style>
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
	.calArea{
		width: 60%;
		border: 30px;
	
	}
	</style>
    <script>

   
    var calendar = null;
      document.addEventListener('DOMContentLoaded', function() {
  
        var calendarEl = document.getElementById('calendar');
        var all_events = null;
        all_events = loadEvents();
       
        calendar = new FullCalendar.Calendar(calendarEl, {
        	 headerToolbar: {
        	        left: 'prev,next endDate',
        	        center: 'title',
        	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
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
                	location.href= "${pageContext.request.contextPath}/detail.ac?ano="+info.event.id;
               
            },
         	eventRender: function (event, element, icon) {
         		if(event.Score != '' && typeof event.Score  !== "undefined"){
         			element.find(".fc-title").append("<br/><b>"+event.Score+"</b>");
         		}
         	},

			 datesSet: function(info){
				var start= info.start;
				var end = info.end;
				changeMonth(start, end);

			 }
   		 });


           calendar.render();
		   console.log(loadEvents());
    
		});


	  	//1. 전체이벤트 데이터를  추츨해서 2. ajax로 서버에 전송하여 db저장
	function loadEvents(){
	  	
	  	var return_value;
		 $.ajax({
			type: "post",
			url: "calList.ac",
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


	//트리거로 페이지 로딩시 change 시 실행되는 이벤트핸들러 실행되도록
    //$(function(){
    //	$("#fc-dom-1").trigger("change");
    //    });
    	
  // 사용자가 선택한 년월에 변화가 일어나면 실행되는 함수  	
  // calendar처럼 동적으로 생성된 요소는 document.ready 이벤트가 작동x
  // 로드되었을 때 존재하지 않는 태그에 대해서는 이벤트를 걸 수 없음
  
  // 이벤트바인딩하기 -- 안됨 !! 풀켈린더가 시키는대로 해야함
 //  $(document).on("#fc-dom-1","change",function(){	

	function changeMonth(start, end){

		$.ajax({
			type: "post",
			url: "monthlySummary.ac",
			data: {
				start: start,
				end: end
			},
			contentType : "application/json",
			success: function(result){
				console.log(result);
			},
			error: function(){
				console.log('실패');
			}						
		});
	
	}

    
    
    </script>
  </head>
  <body>
  <div class="summaryArea">
  	<h5>입출금 장부현황</h5>
  	<table>
  		<tr>
  			<td style="width:200px; height: 200px">
  				<div style="border:1px solid black; width:100%; height:100%">
  				<h1>수입
				<h3 id="incomeOfMonth"></h3>
				<h2 id="monthlyIncome"></h2>  				
  				</div>
  			</td>
  			
  		</tr> 			
  	</table>
  </div>	
  <br>
  <div class="calArea">
      <div id='calendar'></div>
      <a href="list.ac">모아보기</a>
  </div>
  </body>

</html>