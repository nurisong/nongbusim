<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../../../common/menubar.jsp" %>   
<%@ include file="../myPageFarmerCommon.jsp" %>
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

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	 headerToolbar: {
        	        left: 'prev,next today',
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
            	  var createDate= arg.startStr;
            	  location.href="${pageContext.request.contextPath}/enrollForm.di?createDate="+createDate;
            	 
             }
           });
           calendar.render();
      });
      
      
   
      

    </script>
  </head>
  <body>
  <div class="calArea">
      <div id='calendar'></div>
      <a href="list.di">모아보기</a>
  </div>
  </body>

</html>