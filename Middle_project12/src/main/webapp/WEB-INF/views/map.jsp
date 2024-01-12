<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<!-- 포트번호 도메인주소랑 맞춰야함 -->
<html><head>
	<title>my Bicycle</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="resources/assets/css/main.css">
	<noscript><link rel="stylesheet" href="resources/assets/css/noscript.css" /></noscript>
	<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c10e4a48ec6793986fa9e465f242a813"></script>
</head>

<style>
	a:hover {
			text-decoration: underline;
	}
</style>

<body class="">

	<!-- Wrapper -->
		<div id="wrapper">

			<!-- Header -->
				<header id="header">
					<a href="1" class="logo"><strong>IoT</strong> <span>by Arguinom</span></a>
						<nav>

							<a href="#menu">Menu</a>
						</nav>
				</header>

			<!-- Menu -->
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

			<!-- Main -->
				<div id="main" class="alt">

					<!-- One -->
	<div id="map" style="width:500px;height:400px;"></div>
    
    <script>
        //(2) 지도 생성
        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(35.450701, 126.570667), //지도의 중심좌표.
            level: 3 //지도의 레벨(확대, 축소 정도)
        };

        //(3) 마커 생성
        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
        // 마커가 표시될 위치입니다 
        var markerPosition = new kakao.maps.LatLng(result.substr(0,9), result.substr(10));
												 //아두이노에서 가져온 값 들어갈 위치
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);

        // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
        // marker.setMap(null);    

        var iwContent = '<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            position: iwPosition,
            content: iwContent
        });

        // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
        infowindow.open(map, marker);    
			
</script>
			<!-- Contact -->
				

			<!-- Footer -->
				<footer id="footer">
					<div class="inner">
						<ul class="icons">
							<li><a href="#" class="icon brands alt fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon brands alt fa-facebook-f"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon brands alt fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon brands alt fa-github"><span class="label">GitHub</span></a></li>
							<li><a href="#" class="icon brands alt fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
						</ul>
						<ul class="copyright">
							<li>© Untitled</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
						</ul>
					</div>
				</footer>

		</div>

	<!-- Scripts -->
		<script src="resources/assets/js/jquery.min.js"></script>
		<script src="resources/assets/js/jquery.scrolly.min.js"></script>
		<script src="resources/assets/js/jquery.scrollex.min.js"></script>
		<script src="resources/assets/js/browser.min.js"></script>
		<script src="resources/assets/js/breakpoints.min.js"></script>
		<script src="resources/assets/js/util.js"></script>
		<script src="resources/assets/js/main.js"></script>
		<script>
         $(document).ready(function(){
        	setInterval(function() {getLocationMethod()}, 3000);
     		setInterval(function() {alarm()}, 3000)
     	 })
     	 
     	 let result;
     	 
     	 function getLocationMethod(){
			$.ajax({
				url : "CheckNowLocation",
				type : "get",
				datatype : "String",
				success : function(res){
					result = res;
					console.log(result.substr(0,9));
					console.log(result.substr(10));
					console.log(res.substr(0,9));
					console.log(res.substr(10));
				},
				error : function(){
					console.log("실패");
				}
			})
		} // TODO -> 위도 경도 값 같이 보낼텐데, 파싱 어떻게? => res.substr(0,9)=위도, res.substr(10)=경도
				
		function alarm(){
			$.ajax({
				url : "checkTheft",
				type : "post",
				datatype : "text",
				success : function(res){ //성공하면 페이지 이동 되야함 ㅇㅇ
					console.log("서버 응답 성공");
				
	                if (res === "Alert: Theft detected!") {
	                    console.log("도난 감지됨!");

	                    alert("도난 감지됨!");
	                    window.location.href = "Alarm";
	                } else {
	                    console.log("평화로움..");
	                }
				},
				error : function(){
					console.log("서버 응답 실패");
				}
			})
		}
         </script>
</html>