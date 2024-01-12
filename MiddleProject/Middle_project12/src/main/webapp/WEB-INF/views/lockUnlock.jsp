<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>lockUnlock</title>
  <link rel="stylesheet" href="resources/assets/css/main.css" />
  <noscript><link rel="stylesheet" href="resources/assets/css/noscript.css" /></noscript>

  <style>
    body {
     
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background-color: rgba(123, 172, 118, 0.774);
      overflow: hidden;
    }

    .lock-container {
      position:relative;
      width: 300px;
      height: 400px;
      display: flex;
    }

    .lock {
      width: 100%;
      height: 100%;
      background-image: url(https://th.bing.com/th/id/OIG.f50j9fdRxDR8sk5sXywQ?w=1024&h=1024&rs=1&pid=ImgDetMain);
      background-size: cover;
      background-position: center;
      transition: background-image 0.3s ease-in-out;
      display: flex;
    }

    .lock.off {
      background-image: url(https://th.bing.com/th/id/OIG.vCF6H3n3zzWTQVqWgJd6?w=1024&h=1024&rs=1&pid=ImgDetMain);
    display: flex;
    }

    .button-container {
      position: absolute;
      bottom: 10px;
      right: 10px;
    }

    .button1 {
      padding: 10px;
      background-color: rgba(97, 153, 13, 0.826);

      color: black;
      border: none;
      cursor: pointer;
    }
    P{
      text-align: center;
      font-size: 30px;
    }
  </style>
</head>
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
             <li><a href="1">Home</a></li>
             <li><a href="mypage">마이페이지</a></li>                     
             <li><a href="lockUnlock">LOCK/UNLOCK</a></li>         
           	 <li><a href="Board_01">게시판</a></li>                              
             <li><a href="notice">유의사항</a></li>
          </ul>
          <ul class="actions stacked">
            
             <li><a href="login" class="button fit">Log In</a></li>
          </ul>
       </nav>

       <p>LOCK/UNLOCK</p>
  <div class="lock-container">
    <div class="lock"></div>
    <div class="button-container">
      <button class="button1" onclick="toggleImage()">ON/OFF</button>
    </div>
  </div>

  <script>
    let isImageOn = true;

    function toggleImage() {
      const lock = document.querySelector('.lock');
      isImageOn = !isImageOn;

      if (isImageOn) {
        lock.classList.remove('off');
      } else {
        lock.classList.add('off');
      }
    }
  </script>
	<!-- Scripts -->
  <script src="resources/assets/js/jquery.min.js"></script>
  <script src="resources/assets/js/jquery.scrolly.min.js"></script>
  <script src="resources/assets/js/jquery.scrollex.min.js"></script>
  <script src="resources/assets/js/browser.min.js"></script>
  <script src="resources/assets/js/breakpoints.min.js"></script>
  <script src="resources/assets/js/util.js"></script>
  <script src="resources/assets/js/main.js"></script>

</body>
</html>
