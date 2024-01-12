<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 모든페이지 도난예상 메서드 호출하는거 써야함 -->
<html>
<head>
      <title>Landing - Forty by HTML5 UP</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="resources/assets/css/main.css" />
      <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
      <noscript><link rel="stylesheet" href="resources/assets/css/noscript.css" /></noscript>
   <style>
       
   *{
      font-family: 'Jua', sans-serif;
   }
      
   a:hover {
   text-decoration: underline;
   }


   #alert_wrap {
    background-color: red; 
    color: black; 
   text-align:center;      
   position:relative;   
   bottom:-30px;
 
   }

   html{
   background-color: black;
   }


   

   .li{
      font-size: 50px;  

   }
    /* 이미지 */
   .image-container {
            position: relative;
            width: 300px;
            height: 300px;
            overflow: hidden;
         margin:auto;
      
        }

        img { display:block; }

        .image-container img {
            width: 100%;
            height: 100%;
            animation: fadeInOut 1s infinite alternate; 
        }

        @keyframes fadeInOut {
            0% {
                opacity: 0;
            }

            100% {
                opacity: 1;
            }
        }

      /*텍스트*/

      .text-container {
            font-size: 50px; 
            opacity: 0; 
            animation: fadeInOutSizeChange 1s infinite alternate; 
         color:red;
         text-align:center; 
      }

        @keyframes fadeInOutSizeChange {
            0%, 100% {
                opacity: 0;             
            }
            50% {
                opacity: 1;
              
            }
        }

  
      
   </style>
 
</head>
<body class="is-preload">
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

         
                  <div class="inner">
                  <button onclick="location.href='testAlarm'">testAlarm</button>                  
                      
                     <div class="text-container">도난 발생</div>
                     <br>

                     <script>
                       
                        document.addEventListener('DOMContentLoaded', function() {
                           var text = document.querySelector('.text-container');
                           text.style.opacity = '1';
                        });
                     </script>
                     
                     <div class="image-cont++ainer">
                        <img src="resources/images/pic15_alarm_03.jpg" alt="" style="width: 100%;" />
                     </div>
                     
                     <!-- TODO -->
                     <ul class="alert_wrap" id="alert_wrap">
                        <button onclick="location.href='stopAlarm'" type="submit" class="alert_text" id="log.join">
                                          <span class="btn_text">알람 중지</span>
                        </button>                  
                     </ul>
                  
                  </div>
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