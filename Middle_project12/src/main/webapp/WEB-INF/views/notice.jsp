<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<!--
	Forty by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>notice</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="resources/assets/css/noscript.css" /></noscript>
	</head>

	<style>

		a:hover {
			text-decoration: underline;
		}
		#one{
			background-color:white;
		}
		#banner.style2{
			background-color: rgba(123, 172, 118, 0.774);;
		}
		div.content{
			background-color: whitesmoke;
		}
	
	</style>

	
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
				<!-- Note: The "styleN" class below should match that of the banner element. -->
					<header id="header" class="alt style2">
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
					
				<!-- Banner -->
				<!-- Note: The "styleN" class below should match that of the header element. -->
					<section id="banner" class="style2">
						<div class="inner">
							<span class="image">
								<img src="resources/images/asd.jpg" alt="" />
							</span>
							<header class="major">
							
								<h1 style="color:rgba(123, 172, 118, 0.774);;; font-family: sans-serif;">유의사항</h1>
							</header>
							<p style="color:rgba(123, 172, 118, 0.774);;; font-size: 15px; font-family: sans-serif;">제품 사용 안내 및 주의사항</p>
							<div class="content">
								
							</div>

						</div>
					</section>

				<!-- Main -->
					<div id="main">

						<!-- One -->
							<section id="one">
								<div class="inner">
									
									<header class="major">
										<h2 style="color:rgba(123, 172, 118, 0.774);;">모바일 기기 호환성</h2>
									</header>
									<p style="color:rgba(123, 172, 118, 0.774);;">오래된 기기나 최신 버전의 운영체제를 지원하지 않는 기기는 호환성 문제가 발생할 수 있습니다</p>
									<a href="generic.html" class="image">
										<img src="resources/images/candy.jpg" alt="" data-position="center center" />
									</a>
								</div>
								
							</section>

						<!-- Two -->
							<section id="two" class="spotlights">
								<section>
									
									<div class="content">
										<div class="inner">
											<header class="major">
												<h3 style="color:rgba(123, 172, 118, 0.774);;">GPS 정확도</h3>
												
											</header>
											<p style="color:rgba(123, 172, 118, 0.774);;">GPS 시스템 자체의 보정 문제
												와 내부 시계의 오차 문제가
												정확도에 영향을 미칠 수 있습니다</p>
										</div>
									</div>
									<a href="generic.html" class="image">
										<img src="resources/images/gps.gif" alt="" data-position="center center" />
									</a>
								</section>
							
				

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
     		setInterval(function() {alarm()}, 3000)
     	 })
     	 
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

	</body>
</html>