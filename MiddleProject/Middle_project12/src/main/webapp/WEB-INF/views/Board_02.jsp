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

 
            <div class="container">
            <div class="panel panel-default">
               <div class="panel-heading">게시판 작성</div>
               <div class="panel-body">
                  <form class="form-horizontal" action="board/write" method="post" enctype="multipart/form-data">
                     <div class="form-group">
                        <label class="control-label col-sm-2" for="title">제목:</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" name="title" id="title" placeholder="Enter title">
                        </div>
                     </div>
         
                     <div class="form-group">
                        <label class="control-label col-sm-2" for="content">내용:</label>
                        <div class="col-sm-10">
                           <textarea name="content" rows="10" class="form-control"></textarea>
                        </div>
                     </div>
         
                     <div class="form-group">
                        <label class="control-label col-sm-2" for="writer">작성자:</label>
                        <div class="col-sm-10">
                           <input type="text" name="writer" class="form-control">
                        </div>
                     </div>
         
                     <div class="form-group">
                        <label class="control-label col-sm-2" for="photo">Photo:</label>
                        <div class="col-sm-9">
                           <input type="file" class="form-control" name="photo">
                        </div>
                     </div>
         
                     <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">


                        </div>
                     </div>
                  </form>
               </div>
            </div>
            <ul class="alert_wrap" id="alert_wrap">
               <button onclick="location.href='write'" type="submit" class="alert_text" id="log.join">
                  <span class="btn_text">작성 완료</span>
               </button>
            </ul>

            <ul class="find_wrap" id="find_wrap">
               <button onclick="location.href='Board_01'" type="submit" class="find_text" id="log.join">
                  <span class="btn_text">취소</span>
               </button>
            </ul>
         </div>
      
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