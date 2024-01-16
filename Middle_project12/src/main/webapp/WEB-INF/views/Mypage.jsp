<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<title>Mypage</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="resources/assets/css/noscript.css" />
</noscript>
</head>

<style>
body {
	font-family: 'Roboto', sans-serif;
	font-size: 16px;
	color: #333333;
	line-height: 1.6;
}

h1, h2, h3, h4, h5, h6 {
	font-weight: bold;
	margin-bottom: 10px;
}

h1 {
	font-size: 2em;
}

h2 {
	font-size: 1.75em;
}

a:hover {
	text-decoration: underline;
}

input[type="text"], input[type="password"], textarea {
	border: 1px solid #ddd;
	padding: 8px 15px;
	margin-bottom: 10px;
	width: 100%;
	box-sizing: border-box;
}

input[type="submit"], button {
	background-color: rgb(126, 193, 126);
	color: white;
	border: none;
	font-size: 16px;
}

input[type="submit"]:hover, button:hover {
	background-color: rgb(90, 234, 90);
}

html {
	background-color: rgba(123, 172, 118, 0.774);
}
</style>

<body class="is-preload">


	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header" class="alt">
			<a href="1" class="logo"><strong>IoT</strong> <span>by
					Arguinom</span></a>
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
		<!-- Main -->
		<div id="main" class="alt">

			<!-- Header -->

			<div class="content">
				<div class="inner">
					<hr>
					<hr>

					<!-- 테이블 공간 생성 -->


					<div id="container" class="container">
						<!-- content -->


						</li>
						</ul>
						<form id="frmNIDLogin" name="frmNIDLogin" target="_top"
							autocomplete="off" action="update" method="POST"
							enctype="multipart/form-data">
							<ul class="panel_wrap">
								<li class="panel_item" style="display: block;">
									<div class="panel_inner" role="tabpanel" aria-controls="loinid">
										<div class="id_pw_wrap">
											<div1
												style="margin-left:50px; font-size: 60px; font-family: fantasy;">My
											page</div1>
											<div class="input_row" id="pw_line">
												<div class="icon_cell" id="pw_cell">
													<span class="icon_pw"> <br> <span class="blind">이름</span>
													</span>
												</div>
												<br> <input type="text" id="name" name="name1"
													placeholder="이름" title="이름" class="input_text"
													maxlength="16" value="${sessionScope.user_name }" readonly>
											</div>
											<br>
											<div class="input_row" id="id_line">
												<div class="icon_cell" id="id_cell">
													<span class="icon_id"> <span class="blind">아이디</span>
													</span>
												</div>
												<br> <input type="text" id="id" name="id"
													placeholder="아이디" title="아이디" class="input_text"
													maxlength="41" value="${sessionScope.user_id }" readonly>
											</div>
											<br>
											<div class="input_row" id="pw_line">
												<div class="icon_cell" id="pw_cell">
													<span class="icon_pw"> <span class="blind">변경
															할 비밀번호</span>
													</span>
												</div>
												<br> <input type="password" id="pw" name="pw"
													placeholder="비밀번호" title="비밀번호" class="input_text"
													maxlength="16">
											</div>
											 <br>
											<div class="input_row" id="pw_line">
												<div class="icon_cell" id="pw_cell">
													<span class="icon_pw"> <span class="blind">비밀번호
															확인 </span>
													</span>
												</div>
												<br> <input type="password" id="pw2" name="pw2"
													placeholder="비밀번호  확인" title="비밀번호  확인" class="input_text"
													maxlength="16">
											</div>
											<br>
											<div class="input_row" id="pw_line">
												<div class="icon_cell" id="pw_cell">
													<span class="icon_pw"> <span class="blind">생년월일
													</span> <input type="date" id="birthdate" name="birthdate"
														placeholder="생년월일" title="생년월일" class="input_text"
														style="color: black;">
												</div>
												<br>
											</div>
											<br>
											<div class="input_row" id="pw_line">
												<div class="icon_cell" id="pw_cell">
													<span class="icon_pw"> <span class="blind">프로필
															이미지</span> <input type="file" name="pimg">
												</div>
												<br>
											</div>
										</div>
										<div class="login_keep_wrap" id="login_keep_wrap">


											</label> </span>
										</div>
									</div>

									<div class="login_error_wrap" id="err_capslock"
										style="display: none;">
										<div class="error_message">
											<strong>CapsLock</strong>이 켜져 있습니다.
										</div>
									</div>

									<div class="login_error_wrap" id="err_empty_id"
										style="display: none;">
										<div class="error_message">
											<strong>아이디</strong>를 입력해 주세요.
										</div>
									</div>

									<div class="login_error_wrap" id="err_empty_pw"
										style="display: none;">
										<div class="error_message">
											<strong>비밀번호</strong>를 입력해 주세요.
										</div>
									</div>
									<div class="login_error_wrap" id="err_common"
										style="display: none;">
										<div class="error_message" style="width: 90%"></div>
									</div> <br>



									<ul class="alert_wrap" id="alert_wrap">
										<input type="submit" class="alert_wrap" id="log.join">
										<span class="btn_text">수정 완료</span>

									</ul>
					</div>
				</div>
				</li>
				</ul>
				</form>
			</div>




			<input type="hidden" id="nclicks_nsc" name="nclicks_nsc"
				value="nid.login_kr"> <input type="hidden" id="nid_buk"
				name="nid_buk" value="exist"> <input type="hidden"
				id="removeLink" name="removeLink" value=""> <input
				type="hidden" id="hide_util" name="hide_util" value=""> <input
				type="hidden" id="ncaptchaSplit" name="ncaptchaSplit" value="none">
			<input type="hidden" id="id_error_msg" name="id_error_msg"
				value="<strong>아이디</strong>를 입력해주세요."> <input type="hidden"
				id="pw_error_msg" name="pw_error_msg"
				value="<strong>비밀번호</strong>를 입력해주세요."> <input type="hidden"
				id="locale" name="locale" value="ko_KR"> <input
				type="hidden" id="adult_surl_v2" name="adult_surl_v2" value="">
			<input type="hidden" id="ispopup" name="ispopup" value="false">
			<script type="text/javascript" src="/login/js/bvsd.1.3.9.min.js"></script>
			<script type="text/javascript" async=""
				src="https://ssl.pstatic.net/tveta/libs/glad/prod/gfp-core.js"></script>
			<script type="text/javascript"
				src="/login/js/v2/default/common_202201.js?v=20230619"></script>
			<script type="text/javascript"
				src="/login/js/v2/default/default_202105.js?v=20230217"></script>
			<div id="nv_stat" style="display: none;">20</div>
			</section>

		</div>


		<!-- Scripts -->
		<script src="resources/assets/js/jquery.min.js"></script>
		<script src="resources/assets/js/jquery.scrolly.min.js"></script>
		<script src="resources/assets/js/jquery.scrollex.min.js"></script>
		<script src="resources/assets/js/browser.min.js"></script>
		<script src="resources/assets/js/breakpoints.min.js"></script>
		<script src="resources/assets/js/util.js"></script>
		<script src="resources/assets/js/main.js"></script>
		<script>
			document
					.getElementById('birthdate')
					.addEventListener(
					'change',
					function() {
					var selectedDate = this.value;
					document.getElementById('displayBirthdate').innerText = "생년월일: "
				    + selectedDate;
});
		</script>
		
		<script>
			$(document).ready(function() {
				setInterval(function() {
					alarm()
				}, 3000)
			})

			function alarm() {
				$.ajax({
					url : "checkTheft",
					type : "post",
					datatype : "text",
					success : function(res) {
					

					if (res === "Alert: Theft detected!") {
							

				    alert("도난 감지됨!");
				    window.location.href = "Alarm";
				 } 
				 },
					error : function() {
				    console.log("서버 응답 실패");
			     }
				 })
			     }
		</script>
</body>

</html>