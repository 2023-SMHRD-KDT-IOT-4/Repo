<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
   <head>
      <title>Forty by BAS UP</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="resources/assets/css/main.css" />
	  <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
      <noscript><link rel="stylesheet" href="resources/assets/css/noscript.css" /></noscript>
</head>
	  <style>
		   *{
		      font-family: 'Jua', sans-serif;
		   }
		</style>
   <body class="is-preload">

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

               <section id="banner" class="major">
                  <div class="inner">
                     <header class="major">
                        <h1 >Bicycle Safe Security</h1>
                     </header>
                     <div class="content">
                        <p>엄복동의 나라 대한민국 당신의 자전거를 지켜드립니다.
                        </p>
                        <ul class="actions">
                           <li><a href="#one" class="button next scrolly">Let's Go</a></li>
                        </ul>
                     </div>
                  </div>
               </section>

               <div id="main">

                     <section id="one" class="tiles">
                        <article>
                           <span class="image">
                              <img src="resources/images/lock1.jpg" alt="" />
                           </span>
                           <header class="major">
                           
                             <c:choose>
                     <c:when test="${empty sessionScope.user_id }">
                          <h3><a href="login" class="link">LOCK/UNLOCK</a></h3>
                                 <p>잠금/잠금해제</p>
                     </c:when>
                     <c:otherwise>
                         <h3><a href="lockUnlock" class="link">LOCK/UNLOCK</a></h3>
                                 <p>잠금/잠금해제</p>
                     </c:otherwise>
                  </c:choose>
                           
 
                           </header>
                        </article>
                        <article>
                           <span class="image">
                              <img src="resources/images/bicycle.jpg" alt="" />
                           </span>
                         
                           <header class="major">
                             <c:choose>
                     <c:when test="${empty sessionScope.user_id }">
                         <h3><a href="login" class="link">라이딩 주행 기록</a></h3>
                                 <p>라이딩 거리,속력,주행시간 및 칼로리 소모량</p>
                     </c:when>
                     <c:otherwise>
                         <h3><a href="Data" class="link">라이딩 주행 기록</a></h3>
                                 <p>라이딩 거리,속력,주행시간 및 칼로리 소모량</p>
                     </c:otherwise>
                  </c:choose>
                             
                           </header>
                        </article>
                        <article>
                           <span class="image">
                              <img src="resources/images/gps.jpg" alt="" />
                           </span>
                           <header class="major">

                  <c:choose>
                     <c:when test="${empty sessionScope.user_id }">
                     <h3><a href="login" class="link">my Bicycle</a></h3>
                              <p>나의 Bicycle 찾기</p>
                     </c:when>
                     <c:otherwise>
                     <h3><a href="map" class="link">my Bicycle</a></h3>
                              <p>나의 Bicycle 찾기</p>
                     </c:otherwise>
                  </c:choose>


                  
                           </header>
                        </article>
                        <article>
                           <span class="image">
                              <img src="resources/images/write.jpg" alt="" />
                           </span>
                           <header class="major">

                  <c:choose>
                     <c:when test="${empty sessionScope.user_id}">
                        <h3><a href="login" class="link">게시판</a></h3>
                         <p>자유롭게 소통하는 공간</p>
                     </c:when>
                     <c:otherwise>
                        <h3><a href="Board_01" class="link">게시판</a></h3>
                         <p>자유롭게 소통하는 공간</p>
                     </c:otherwise>
                  </c:choose>


                             
                           </header>
                        </article>
                        <article>
                           <span class="image">
                              <img src="resources/images/dng.jpg" alt="" />
                           </span>
                           <header class="major">
                              <h3><a href="notice" class="link">유의사항</a></h3>
                              <p>주의사항 및 제품 사용 안내</p>
                           </header>
                        </article>
                        <article>
                           <span class="image">
                              <img src="resources/images/page.jpg" alt="" />
                           </span>
                           <header class="major">



                  <c:choose>
                     <c:when test="${empty sessionScope.user_id }">
                        <h3><a href="login" class="link">마이페이지</a></h3>
                              <p>회원 정보 수정</p>
                     </c:when>
                     <c:otherwise>
                        <h3><a href="mypage" class="link">마이페이지</a></h3>
                              <p>회원 정보 수정</p>
                     </c:otherwise>
                  </c:choose>


                  
                           </header>
                        </article>
                        
                     </section>

                  

               </div>

         </div>

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