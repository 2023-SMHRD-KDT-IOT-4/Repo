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
	display: block;
    margin: 0 auto;
    margin-top:10px;
    margin-bottom:10px;
	}


	</style>
	
	<body class="is-preload">
	<%String user_id = (String)session.getAttribute("user_id"); %>
		<div class="container">
			
		
			<div class="panel panel-default">
			  <div class="panel-heading">게시판</div>
			  <div class="panel-body" id="list">
				
				   <table class="table table-bordered">
					<thead>
					  <tr>
						<th style="text-align: center;">번호</th>
						<th style="text-align: center;">제목</th>
						<th style="text-align: center;">작성자</th>
						<th style="text-align: center;">작성일</th>
						<th style="text-align: center;">삭제</th>
					  </tr>
					</thead>
					<tbody>
				   <!-- 게시물 출력 -->
				   <c:forEach items="${list}" var="b">
							<tr>
								<td style="text-align: center;">${b.comm_seq }</td>
								<td style="text-align: center;"><a href="board/content/${b.comm_seq }">${b.comm_title }</a></td>
								<td style="text-align: center;">${b.user_id }</td>
								<td style="text-align: center;">${b.created_at }</td>
								<c:choose>
							         <c:when test="${user_id eq b.user_id }">
										<td style="text-align: center;"><a href="BoardDelete/${b.comm_seq }">삭제</a></td>
							         </c:when>
							         <c:otherwise>
							         	<td></td>
							         </c:otherwise>
						         </c:choose>
							</tr>
					</c:forEach>
					  <tr>
						 <td colspan="5">
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