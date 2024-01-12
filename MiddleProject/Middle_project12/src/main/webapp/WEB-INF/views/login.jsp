<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Generic - Forty by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="resources/assets/css/noscript.css" />
</noscript>
</head>


<style>
h1 {
	color: green;
	margin: 20px;
	text-align: center;
}

a:hover {
	text-decoration: underline;
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
			<a href="index.html" class="logo"><strong>IoT</strong> <span>by
					Arguinom</span></a>
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

		<!-- Main -->
		<div id="main" class="alt">

			<!-- One -->
			<section id="one">
				<body>

					<h1>로그인</h1>
					</a>

					</select>
		</div>
	</div>
	</header>

	<div id="container" class="container">
		<!-- content -->


		</li>
		</ul>
		<form id="frmNIDLogin" name="frmNIDLogin" target="_top"
			autocomplete="off" action="loginClick" method="POST">
			<input type="hidden" id="localechange" name="localechange" value="">
			<input type="hidden" name="dynamicKey" id="dynamicKey"
				value="JHSs2G2-GRno8iU95dkacSv1gcjhKqpbu4NS7EJcrinZHYcH80OYdwoj4R8uIF45kScwHtT2RLhYlZ9GvMMoTScM1D7spBsIVtBDk0VEOEY">
			<input type="hidden" name="encpw" id="encpw" value=""> <input
				type="hidden" name="enctp" id="enctp" value="1"> <input
				type="hidden" name="svctype" id="svctype" value="1"> <input
				type="hidden" name="smart_LEVEL" id="smart_LEVEL" value="1">
			<input type="hidden" name="bvsd" id="bvsd" value=""> <input
				type="hidden" name="encnm" id="encnm" value=""> <input
				type="hidden" name="locale" id="locale" value="ko_KR"> <input
				type="hidden" name="url" id="url" value="">


			<ul class="panel_wrap">
				<li class="panel_item" style="display: block;">
					<div class="panel_inner" role="tabpanel" aria-controls="loinid">
						<div class="id_pw_wrap">
							<div class="input_row" id="id_line">
								<div class="icon_cell" id="id_cell">
									<span class="icon_id"> <span class="blind">아이디</span>
									</span>
								</div>
								<br> <input type="text" id="id" name="id" placeholder="아이디"
									title="아이디" class="input_text" maxlength="41" value="">
								<span role="button" class="btn_delete" id="id_clear"
									style="display: none;"> <span class="icon_delete">

								</span>
								</span>
							</div>
							<br>
							<div class="input_row" id="pw_line">
								<div class="icon_cell" id="pw_cell">
									<span class="icon_pw"> <span class="blind">비밀번호</span>
									</span>
								</div>
								<br> <input type="password" id="pw" name="pw"
									placeholder="비밀번호" title="비밀번호" class="input_text"
									maxlength="16"> <span role="button" class="btn_delete"
									id="pw_clear" style="display: none;"> <span
									class="icon_delete"> </span>
								</span>
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
					</div>
					<div class="btn_login_wrap">
						<br>



					</div>
	</div>
	</li>
	</ul>
	</form>
	</div>
	<br>
	<ul class="alert_wrap" id="alert_wrap">
		<button onclick="location.href='index.html'" type="submit"
			class="alert_text" id="log.join">
			<span class="btn_text">로그인</span>
		</button>
	</ul>
	<ul class="find_wrap" id="find_wrap">
		<button onclick="location.href='join'" type="submit" class="find_text"
			id="log.join">
			<span class="btn_text">회원가입</span>
		</button>
	</ul>



	<input type="hidden" id="nclicks_nsc" name="nclicks_nsc"
		value="nid.login_kr">
	<input type="hidden" id="nid_buk" name="nid_buk" value="exist">
	<input type="hidden" id="removeLink" name="removeLink" value="">
	<input type="hidden" id="hide_util" name="hide_util" value="">
	<input type="hidden" id="ncaptchaSplit" name="ncaptchaSplit"
		value="none">
	<input type="hidden" id="id_error_msg" name="id_error_msg"
		value="<strong>아이디</strong>를 입력해주세요.">
	<input type="hidden" id="pw_error_msg" name="pw_error_msg"
		value="<strong>비밀번호</strong>를 입력해주세요.">
	<input type="hidden" id="locale" name="locale" value="ko_KR">
	<input type="hidden" id="adult_surl_v2" name="adult_surl_v2" value="">
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

</body>
</html>