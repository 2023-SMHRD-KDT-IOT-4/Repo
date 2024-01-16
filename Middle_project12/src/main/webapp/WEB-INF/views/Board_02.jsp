<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
<!DOCTYPE html>
<html>
   <head>
      <title>Elements - Forty by HTML5 UP</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="resources/assets/css/main.css" />
      <noscript><link rel="stylesheet" href="resources/assets/css/noscript.css" /></noscript>
   </head>
   <style>
      a:hover {
      text-decoration: underline;
      }

      .panel-heading {
         font-family: 'Tektur', sans-serif;
         font-size: 50px;
         text-align: center;
         padding: 30px;
         
         color:#1b9c5e ;
         
      }
   
      th {
         text-align: center;
   
      }
   
   
      td {
         text-align: center;
   
      }
   
      html {
         background-color:rgba(123, 172, 118, 0.774); 
      }
	  label{
	color: #1b9c5e;
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

 
            <div class="container">
            <div class="panel panel-default">
               <div class="panel-heading">게시판 작성</div>
               <div class="panel-body">
                  <form class="form-horizontal" action="write" method="post" enctype="multipart/form-data">
                     <div class="form-group">
                        <label class="control-label col-sm-2" for="title">&nbsp; 제목:</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" name="comm_title" id="title" placeholder="Enter title">
                        </div>
                     </div>
         
                     <div class="form-group">
                        <label class="control-label col-sm-2" for="content">&nbsp; 내용:</label>
                        <div class="col-sm-10">
                           <textarea name="comm_content" rows="10" class="form-control"></textarea>
                        </div>
                     </div>
         
                     <div class="form-group">
                        <label class="control-label col-sm-2" for="photo">&nbsp; Photo:</label>
                        <div class="col-sm-9">
                           <input type="file" class="form-control" name="photo">
                        </div>
                     </div>
         
                     <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">


                        </div>
                     </div>
						<ul class="alert_wrap" id="alert_wrap">
							<input type="submit"
								class="alert_text" id="log.join" value="작성 완료">
						</ul>
					
					</form>
               </div>
            </div>
            <ul class="find_wrap" id="find_wrap">
               <button onclick="location.href='Board_01'" type="submit" class="find_text" id="log.join">
                  <span class="btn_text">취소</span>
               </button>
            </ul>
         </div>

        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/jquery.scrollex.min.js"></script>
        <script src="assets/js/browser.min.js"></script>
        <script src="assets/js/breakpoints.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>
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
					console.log("서버 응답 실패");
				}
			})
		}
         </script>
 
   </body>
 </html>