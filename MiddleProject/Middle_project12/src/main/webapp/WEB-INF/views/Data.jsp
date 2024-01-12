<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>라이딩 기록</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style.css">
    <!-- Kakao 지도 API JavaScript 라이브러리 추가 -->
    <link rel="stylesheet" href="assets/css/main.css" />
      <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
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
</style>
  
</style>

<body>
     <!-- Wrapper -->
  <div id="wrapper">

    <!-- Header -->
       <header id="header" class="alt">
          <a href="index.html" class="logo"><strong>IoT</strong> <span>by Arguinom</span></a>
          <nav>
             <a href="#menu">Menu</a>
          </nav>
       </header>

    <!-- Menu -->
       <nav id="menu">
          <ul class="links">
             <li><a href="index.html">Home</a></li>
             <li><a href="Mypage.html">마이페이지</a></li>                     
             <li><a href="lockUnlock.html">LOCK/UNLOCK</a></li>         
             <li><a href="Board_01.html">게시판</a></li>                              
             <li><a href="notice.html">유의사항</a></li>
          </ul>
          <ul class="actions stacked">
            
             <li><a href="login.html" class="button fit">Log In</a></li>
          </ul>
       </nav>
    <div class="container">
        <h1>라이딩 기록</h1>
        <div id="gps-data">
            <p>평균속도: <span id="speed">0</span></p>
            <p>소모칼로리: <span id="calorie">0</span></p>
            <p>시간: <span id="time">0</span>시간</p>
            <p>거리: <span id="distance">0</span>km</p>
        </div>
    </div>
    <div id="map-container">
        <div id="map" style="width:82%;height:350px;"></div>
    </div>
    <script src="script.js"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(35.14990889560243, 126.91996389645088), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


        // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
        var linePath = [
            new kakao.maps.LatLng(35.14990889560243, 126.91996389645088),
            new kakao.maps.LatLng(35.14999692662143, 126.92018878509691),
            new kakao.maps.LatLng( 35.1496028590547, 126.92061168155914 )
        ];

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
    </script>
     <!-- Scripts -->
     <script src="assets/js/jquery.min.js"></script>
     <script src="assets/js/jquery.scrolly.min.js"></script>
     <script src="assets/js/jquery.scrollex.min.js"></script>
     <script src="assets/js/browser.min.js"></script>
     <script src="assets/js/breakpoints.min.js"></script>
     <script src="assets/js/util.js"></script>
     <script src="assets/js/main.js"></script>

</body>

</html>
