<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<title>Landing - Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="resources/assets/css/noscript.css" /></noscript>
	</head>
	<style>
		
		
.panel-heading {
	font-family:fantasy ;
    font-size: 50px; 
    text-align: center;
    padding: 30px; 
   
    color:#1b9c5e; 
}
th {
    text-align: center; 
	
    
}


td {
    text-align: center; 
	
    
}


.btn-success {
    font-size: 12px; 
	
}
html{
	background-color:  rgba(123, 172, 118, 0.774); 

}
.success{
	background-color: rgb(135, 221, 135);
	margin: 20px;
	}


	</style>
	
	<body class="is-preload">
		<div class="container">
			
		
			<div class="panel panel-default">
			  <div class="panel-heading">게시판</div>
			  <div class="panel-body" id="list">
				
				   <table class="table table-bordered">
					<thead>
					  <tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>삭제</th>
					  </tr>
					</thead>
					<tbody>
				   <!-- 게시물 출력 -->
					  <tr>
						 <td colspan="4">
							<button onclick="location.href='Board_02'" class="success">글작성</button>
						 </td>
					  </tr>
					</tbody>
				  </table>
			  </div>
			 
		  </div>

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
				<!-- Banner -->
				<!-- Note: The "styleN" class below should match that of the header element. -->
					

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