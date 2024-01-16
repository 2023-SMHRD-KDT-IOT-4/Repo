<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="/bicycle/resources/assets/css/main.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <noscript><link rel="stylesheet" href="resources/assets/css/noscript.css" /></noscript>
</head>
<body>
               
		<div id="wrapper">

            <!-- Header -->
           <header id="header" class="alt">
                  <a href="/bicycle/" class="logo"><strong>IoT</strong> <span>by Arguinom</span></a>
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
                <script src="resources/assets/js/jquery.min.js"></script>
         <script src="resources/assets/js/jquery.scrolly.min.js"></script>
         <script src="resources/assets/js/jquery.scrollex.min.js"></script>
         <script src="resources/assets/js/browser.min.js"></script>
         <script src="resources/assets/js/breakpoints.min.js"></script>
         <script src="resources/assets/js/util.js"></script>
         <script src="resources/assets/js/main.js"></script>

<div class="container">
  <h2 style="color:black;">Arguinom 게시판</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
    <div class="panel-body">
    	<table class="table table-bordered">
    		<tr>
    			<td>번호</td>
    			<td>${content.comm_seq }</td>
    		</tr>
    		<tr>
    			<td>제목</td>
    			<td>${content.comm_title }</td>
    		</tr>
    		<tr>
    			<td>내용</td>
    			<td>${content.comm_content }</td>
    		</tr>
    		<tr>
    			<td>작성자</td>
    			<td>${content.user_id }</td>
    		</tr>
    		<tr>
    			<td>작성일</td>
    			<td>${content.created_at }</td>
    		</tr>
    		<tr>
    			<td>이미지</td>
    			<td><img width=300px alt="이미지 업로드 실패!" src="data:image/jpeg;base64,${content.comm_file }"></td>
    		</tr>
    		<tr>
    			<td colspan="2" align="center">
    				<button onclick="location.href='/bicycle/Board_01'" class="btn btn-sm btn-success">리스트</button>    			
    			</td>
    		</tr>
    	</table>
    
    </div>
    <div class="panel-footer">Arguinom</div>
  </div>
</div>
</body>
</html>