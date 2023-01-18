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
  
  </head>
  <body>
  <div class="summaryArea">
  	<h5>입출금 장부현황</h5>
  	<table id="summaryTable">
  		<tr>

  			
  		</tr> 			
  	</table>
  </div>	
  <br>
  <div class="calArea">
      <div id='calendar'></div>
      <a href="list.ac">모아보기</a>
  </div>
  </body>
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

				//calendar.getDate()
				// 화면에 보이는 calendar 월 버튼 클릭하여 변경 시 
				// 해당 월 첫 번쨰 날짜를 반환 , 초기값은 현재날짜 (sysdate)
				
				// yyyy-mm-01을 반환하는 dateformat호출
				var yearMonth =dateFormat(calendar.getDate());
				
				// xxxx년 xx월에 변화가 일어날 때 마다, montlySummary를 가져오는 ajax 함수 호출
				monthlySummary(yearMonth);
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


	//ajax로 yyyy-mm-01 데이터(yearMonth)를 넘길 때, 
	// 나중에 mapper에 parameterType으로  (yearMonth, memNo) 두개를 넘겨야 하므로
	// Account vo에  두 값을 담을 것임
	// controller에서 data를 받을 때 Account로 받도록 RequestParam 설정
	function monthlySummary(yearMonth){
		console.log("here")
		console.log(yearMonth);
		var yearMonthFormat = yearMonth.substr(0,4)+'년 '+yearMonth.substr(5,2)+'월' ;
		$.ajax({
			type: "post",
			url: "monthlySummary.ac",
			data: {
				"createDate": yearMonth
			},
			success: function(list){
				if(!list.empty){
					var result="";
					console.log(list)
					for (var i=0; i<list.length; i++){
						if(list[i].amount !=null){
							result 
								+= '<td style="width:200px; height: 200px">'
				  				+'<div style="border:1px solid black; width:100%; height:100%">'	
				  				+'<h1>'+list[i].type+'</h1>'
								+'<h3>'+ yearMonthFormat+'</h3>'
								+'<h2>'+list[i].amount+'원</h2>'			
				  				+'</div>'
				  				+'</td>'
					
						} else {
							result= "<td style='width:600px; height: 200px'><h1>작성된 입출금일지가 없습니다<h1></td>";
						}
					}
				}else {
 					result= "<td style='width:600px; height: 200px'><h1>작성된 입출금일지가 없습니다<h1></td>";
				}                   
               	 $('#summaryTable').children().eq(0).html(result);
				
			},
			error: function(){
				console.log('실패');
			}						
		});
	
	}

	
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