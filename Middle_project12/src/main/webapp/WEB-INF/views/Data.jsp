<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>라이딩 기록</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="resources/assets/css/style.css">
    <!-- Kakao 지도 API JavaScript 라이브러리 추가 -->
    <link rel="stylesheet" href="resources/assets/css/main.css" />
      <noscript><link rel="stylesheet" href="resources/assets/css/noscript.css" /></noscript>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e923887a330b0f4d2ae38fbdca59028
    ">
</script>
    
</head>
<style>
    #map-container {
        display: flex;
        justify-content: center;
    }
    html{
        background-color: whitesmoke;
    }
   
   a:hover {
         text-decoration: underline;
   }
   .container{
   		padding: 0px;
   }
</style>
  
</style>

<body>

  <div id="wrapper">


       <header id="header" class="alt">
          <a href="1" class="logo"><strong>IoT</strong> <span>by Arguinom</span></a>
          <nav>
             <a href="#menu">Menu</a>
          </nav>
       </header>


       <nav id="menu">
          <ul class="links">
             <li><a href="1">Home</a></li>
             		 <c:choose>
				         <c:when test="${empty sessionScope.user_id }">
				            <li><a href="login">마이페이지</a></li>
				            <li><a href="login">LOCK/UNLOCK</a></li>
				            <li><a href="login">게시판</a></li>
				         </c:when>
				         <c:otherwise>
				                  <li><a href="mypage">마이페이지</a></li>
				                  <li><a href="lockUnlock">LOCK/UNLOCK</a></li>
				                  <li><a href="Board_01">게시판</a></li>
				         </c:otherwise>
			         </c:choose>                              
               		 <li><a href="notice">유의사항</a></li>
          </ul>
          <ul class="actions stacked">
            <c:choose>
	                  <c:when test="${empty sessionScope.user_id }">
	                     <li><a href="login" class="button fit">Log In</a></li>
	                  </c:when>
	                  <c:otherwise>
	                     <li><a href="logoutClick" class="button fit">Log out</a></li>
	                  </c:otherwise>
	               </c:choose>
          </ul>
       </nav>
    <div class="container" style="width:100%;">
        <h1 style="color:darkblue;">오늘의 라이딩 기록</h1>
        <h3 style="color:darkblue;">날짜 선택</h3>
        <form action="data2">
        	<input type="text" id="created_at" name="created_at" placeholder="YY/MM/DD" style='background-color: green'><br>  <input type=submit value="확인하기" >
        </form>
        <div id="gps-data">
            <p>평균속도: <span id="speed">0</span></p>
            <p>시간: <span id="time">0</span>h</p>
            <p>거리: <span id="distance"></span>m</p>
        </div>
    </div>
    <div id="map-container">
        <div id="map" style="width:82%;height:350px;"></div>
    </div>
    
    <script>
    
    
    

    	
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(35.14990889560243, 126.91996389645088), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


        // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
        var jsonString = '${GpsList}';
	    console.log("JSON String: ", jsonString);
	
	    try {
	        var gpsList = JSON.parse(jsonString);
	        console.log("Parsed JSON: ", gpsList);
	        
	     	// 새로운 linePath 배열 생성
	        var linePath = [];
	        
	     	for (var i = 0; i < gpsList.length; i++) {
	            linePath.push(new kakao.maps.LatLng(gpsList[i].lat, gpsList[i].lng));
	        }
	        
	     	// 지도에 표시할 선을 생성합니다
	        var polyline = new kakao.maps.Polyline({
	            path: linePath, // 선을 구성하는 좌표배열 입니다
	            strokeWeight: 5, // 선의 두께 입니다
	            strokeColor: '#FFAE00', // 선의 색깔입니다
	            strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	            strokeStyle: 'solid' // 선의 스타일입니다
	        });
	
	        // 지도에 선을 표시합니다 
	        polyline.setMap(map);
	        
	        var distanceInMeters = polyline.getLength();
	        
	        document.getElementById("distance").innerHTML = distanceInMeters.toFixed(2);
	        
	        var roundedUpNumber = Math.random() * 4;
	        
	        document.getElementById("time").innerHTML = roundedUpNumber.toFixed(1);
	        
	        var speed = (distanceInMeters.toFixed(2)/roundedUpNumber.toFixed(1))/1000;
	        
	        document.getElementById("speed").innerHTML = speed.toFixed(2); + "km/h"
	        
	    } catch (e) {
	        console.error("Error parsing JSON: ", e);
	    }

    </script>

     <script src="resources/assets/js/jquery.min.js"></script>
     <script src="resources/assets/js/jquery.scrolly.min.js"></script>
     <script src="resources/assets/js/jquery.scrollex.min.js"></script>
     <script src="resources/assets/js/browser.min.js"></script>
     <script src="resources/assets/js/breakpoints.min.js"></script>
     <script src="resources/assets/js/util.js"></script>
     <script src="resources/assets/js/main.js"></script>
     <script>
         $(document).ready(function(){
     		setInterval(function() {alarm()}, 3000)
     	 })
     	 
     	 function alarm(){
			$.ajax({
				url : "checkTheft",
				type : "post",
				datatype : "text",
				success : function(res){ //성공하면 페이지 이동
				
	                if (res === "Alert: Theft detected!") {
	                    alert("도난 감지됨!");
	                    window.location.href = "Alarm";
	                } 
				},
				error : function(){
					console.log("서버 응답 실패");
				}
			})
		}
     	 
     </script>

</body>

</html>
