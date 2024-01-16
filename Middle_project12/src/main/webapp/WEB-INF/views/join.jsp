<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
	<head>
		<title>Generic - Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="resources/assets/css/noscript.css" /></noscript>
	</head>
	<style>
	h1{
		color: green;
		margin: 20px;
		text-align: center;
	}
		
	#alert_wrap {
    color: black; /* 텍스트 색상을 흰색으로 지정 */
	text-align:center;		
    /* 다른 스타일 속성들도 필요에 따라 추가할 수 있습니다. */
	}
	html{
	background-color: rgba(123, 172, 118, 0.774);
	display: flex;	
}
#pw {
	color:black;
}
#pw.input_text{
	background-color: whitesmoke;
	
}
#id.input_text{
	background-color: whitesmoke;
	
}
span.blind{
	font-weight: bold;
	vertical-align: middle;
	size: 20px
	
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

							<div id="wrapper" width="400px">

										<div class="content">
											<div class="inner">
												<h1>회원가입</h1>
												<form action="joinClick" method=post enctype="multipart/form-data">
													
													<div class="input_row" id="pw_line">
														<div class="icon_cell" id="pw_cell">
															<span class="icon_pw">
																<span class="blind">프로필 이미지</span>
																<input name="user_profile_img" type="file">
															</span>
															<br>
														<!-- 삭제버튼 blind라 안나오는듯 왜구현한거죵 -->
														<span role="button" class="btn_delete" id="pw_clear" style="display: none;">
															<span class="icon_delete">
																<span class="blind">삭제</span>
															</span>
														</span>
														</div>
													
												  
													<div class="input_row" id="pw_line">
														<div class="icon_cell" id="pw_cell">
															<span class="icon_pw">
																<span class="blind">이름</span>
															</span>
														</div>
														<br>
														<input type="text" id="pw" name="user_name" placeholder="이름" title="이름" class="input_text" maxlength="16">
														<span role="button" class="btn_delete" id="pw_clear" style="display: none;">
															<span class="icon_delete">
																<span class="blind">삭제</span>
															</span>
														</span>
													</div>
				
				
													<br>
													<div class="input_row" id="id_line">
														<div class="icon_cell" id="id_cell">
															<span class="icon_id">
																<span class="blind">아이디</span>
															</span>
														</div>
														<br>
														<input type="text" id="id" name="user_id" placeholder="아이디" title="아이디" class="input_text" maxlength="41" value="">
														<span role="button" class="btn_delete" id="id_clear" style="display: none;">
															<span class="icon_delete">
																<span class="blind">삭제</span>
															</span>
														</span>
													</div>
													<br>
													<div class="input_row" id="pw_line">
														<div class="icon_cell" id="pw_cell">
															<span class="icon_pw">
																<span class="blind">비밀번호</span>
															</span>
														</div>
														<br>
														<input type="password" id="pw" name="user_pw" placeholder="비밀번호" title="비밀번호" class="input_text" maxlength="16">
														<span role="button" class="btn_delete" id="pw_clear" style="display: none;">
															<span class="icon_delete">
																<span class="blind">삭제</span>
															</span>
														</span>
													</div>
				
													<br>
													<div class="input_row" id="pw_line">
														<div class="icon_cell" id="pw_cell">
															<span class="icon_pw">
																<span class="blind">비밀번호 확인 </span>
															</span>
														</div>
														<br>
														<input type="password" id="pw" name="user_pw2" placeholder="비밀번호  확인" title="비밀번호  확인" class="input_text" maxlength="16">
														<span role="button" class="btn_delete" id="pw_clear" style="display: none;">
															<span class="icon_delete">
																<span class="blind">삭제</span>
															</span>
														</span>
													</div>
													<br>
													
													<div class="input_row" id="pw_line">
														<div class="icon_cell" id="pw_cell">
															<span class="icon_pw">
																<span class="blind">생년월일 </span>																
																
															</span>
														</div>
														<br>
														<input type="date" id="pw" name="user_birthdate" placeholder="생년월일" title="생년월일" class="input_text" maxlength="16">
														<span role="button" class="btn_delete" id="pw_clear" style="display: none;">
															<span class="icon_delete">
																<span class="blind">삭제</span>
															</span>
														</span>
													</div>


													
														
													</div>
													
													<ul class="alert_wrap" id="alert_wrap">
														<input type="submit"
															class="alert_text" id="log.join" value="회원가입 완료">
													</ul>
													
											
												</form>
											</div>
										</div>
										<nav>
									</header>
				
								
						
							<div id="bg"></div>

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