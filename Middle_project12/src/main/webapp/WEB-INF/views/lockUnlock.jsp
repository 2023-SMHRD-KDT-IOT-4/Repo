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
      background-image: url(resources/images/lock.jpg);
      background-size: cover;
      background-position: center;
      transition: background-image 0.3s ease-in-out;
      display: flex;
    }

    .lock.off {
      background-image: url(resources/images/unlock.jpg);
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
	      // 서버에 '이동 허용' 상태를 알림
	      fetch('./move').then(response => {
	         console.log('Move allowed');
	
	      }).catch(error => {
	        console.error('Error:', error);
	      });
	    } else {
	      lock.classList.add('off');
	      // 서버에 '이동 잠금' 상태를 알림
	      fetch('./lock').then(response => {
	         console.log('Move locked');
	
	      }).catch(error => {
	        console.error('Error:', error);
	      });
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
