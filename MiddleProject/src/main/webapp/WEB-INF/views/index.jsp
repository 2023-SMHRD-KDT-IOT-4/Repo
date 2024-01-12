<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>

<html>

<head>
   <title>Forty by BAS UP</title>
   <meta charset="utf-8" />
   <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
   <link rel="stylesheet" href="${path}/resources/assets/css/main.css" />
   <link rel="stylesheet" href="${path}/resources/assets/css/custom.css" />
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
   <noscript>
      <link rel="stylesheet" href="assets/css/noscript.css" />
   </noscript>
</head>
<style>
   *{
      font-family: 'Jua', sans-serif;
   }
   a:hover {
      text-decoration: underline;
      }
   #menu{
      font-size: 20px;
   }
</style>

<body class="is-preload">

   <!-- Wrapper -->
   <div id="wrapper">

      <!-- Header -->
      <header id="header" class="alt">
         <a href="index.html" class="logo" style="font-family: 'Jua', sans-serif;"><strong>IoT</strong> <span>by Arguinom</span></a>
         <nav>
            <a href="#menu" style="font-family: 'Jua', sans-serif;">Menu</a>
         </nav>
      </header>

      <!-- Menu -->
      <nav id="menu" style="font-family: 'Jua', sans-serif;">
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

      <!-- Banner -->
      <section id="banner" class="major">
         <div class="inner">
            <header class="major">
               <h1 style="font-family: 'Jua', sans-serif; font-size: 60px;">Bicycle Security Security</h1>
            </header>
            <div class="content">
               <p style="font-family: 'Jua', sans-serif; font-size: 20px; color: aliceblue;">엄복동의 나라 대한민국 당신의 자전거를 지켜드립니다.
               </p>
               <ul class="actions">
                  <li><a href="#one" class="button next scrolly" style="font-family: 'Jua', sans-serif;">Let's Go</a></li>
               </ul>
            </div>
         </div>
      </section>

      <!-- Main -->
      <div id="main">

         <!-- One -->
         <section id="one" class="tiles">
            <article>
               <span class="image">
                  <img src="resources/images/lock1.jpg" alt="" />
               </span>
               <header class="major">
                  <h3 style="font-family: 'Jua', sans-serif; font-size: 40px;"><a href="lockUnlock.html" class="link">LOCK/UNLOCK</a></h3>
                  <p style="font-size: 20px;">잠금/잠금해제</p>
               </header>
            </article>
            <article>
               <span class="image">
                  <img src="resources/images/bicycle.jpg" alt="" />
               </span>
               <header class="major">
                  <h3 style="font-size: 40px;"><a href="Data.html" class="link">라이딩 주행 기록</a></h3>
                  <p style="font-size: 20px;">라이딩 거리,속력,주행시간 및 칼로리 소모량</p>
               </header>
            </article>
            <article>
               <span class="image">
                  <img src="resources/images/gps.jpg" alt="" />
               </span>
               <header class="major">
                  <h3 style="font-size: 40px;"><a href="map.html" class="link">my Bicycle</a></h3>
                  <p style="font-size: 20px;">나의 Bicycle 찾기</p>
               </header>
            </article>
            <article>
               <span class="image">
                  <img src="resources/images/write.jpg" alt="" />
               </span>
               <header class="major">
                  <h3 style="font-size: 40px;"><a href="Board_01.html" class="link">게시판</a></h3>
                  <p style="font-size: 20px;">자유롭게 소통하는 공간</p>
               </header>
            </article>
            <article>
               <span class="image">
                  <img src="resources/images/dng.jpg" alt="" />
               </span>
               <header class="major">
                  <h3 style="font-size: 40px;"><a href="notice.html" class="link">유의사항</a></h3>
                  <p style="font-size: 20px;">주의사항 및 제품 사용 안내</p>
               </header>
            </article>
            <article>
               <span class="image">
                  <img src="resources/images/page.jpg" alt="" />
               </span>
               <header class="major">
                  <h3 style="font-size: 40px;"><a href="Mypage.html" class="link">마이페이지</a></h3>
                  <p style="font-size: 20px;">회원 정보 수정</p>
               </header>
            </article>

         </section>



      </div>

      <!-- Contact -->




   </div>

   <!-- Scripts -->
   <script src="${path}/resources/assets/js/jquery.min.js"></script>
   <script src="${path}/resources/assets/js/jquery.scrolly.min.js"></script>
   <script src="${path}/resources/assets/js/jquery.scrollex.min.js"></script>
   <script src="${path}/resources/assets/js/browser.min.js"></script>
   <script src="${path}/resources/assets/js/breakpoints.min.js"></script>
   <script src="${path}/resources/assets/js/util.js"></script>
   <script src="${path}/resources/assets/js/main.js"></script>

</body>

</html>