<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>비트캠프 자바기반 웹&앱 개발자 양성과정 프로젝트</title>
	<link href="../assets/css/plugins/plugins.css" rel="stylesheet">
	<link href="../assets/plugins/ytplayer/jquery.mb.YTPlayer.min.css" rel="stylesheet">
	<link href="../assets/plugins/dzsparallaxer/dzsparallaxer.css" rel="stylesheet">
	<link href="../assets/plugins/dzsparallaxer/scroller.css" rel="stylesheet">
	<link href="../assets/plugins/dzsparallaxer/advancedscroller/plugin.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../assets/plugins/cubeportfolio/css/cubeportfolio.min.css">
	<link href="../assets/css/style.css" rel="stylesheet">
	<%--제이쿼리--%>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<script src="register.js"></script>
</head>
<body>
<%--메뉴--%>
<%@include file="../WEB-INF/modules/navbar/loginNav.jsp" %>
<%--메뉴--%>
<!--page title-->
<div class="cta-bg-slider bg-primary auto-init height-is-based-on-content" data-options='{   direction: "reverse"}'>
	<div class="container pt100 pb100">
		<div class="row">
			<div class="col-md-8 ml-auto mr-auto wow bounceIn" data-wow-delay=".2s">
				<h3 class="h3 mb30 text-center font300 text-white">회원가입</h3>
			</div>
		</div>
	</div>
</div>
<!--parallax-->
<!--/.page-title-->
<div class='container pb50 pt50-md'>
	<div class='row'>
		<div class='col-md-6 col-lg-5 mr-auto ml-auto'>
			<div class='card card-account'>
				<div class='card-body'>
					<form method="post" action="save.jsp">
						<div class="input-group mb-3" style="margin-bottom: 0 !important;">
							<div class="input-group-addon" style="width: 35px;border-radius: 10px 0 0 10px;">
								<i class="fa fa-at"></i>
							</div>
							<input type="email" id='userID' name='userID' class='form-control' maxlength="20"
								   autocomplete="off" placeholder="아이디(이메일)를 입력해주세요"
								   aria-describedby="basic-addon2" onkeyup="fnKeyUp('userID');" required>
							<div class="input-group-append">
								<button class="btn btn-lg btn-outline-primary" onclick="registerCheckFunction();"
										type="button" style="border-radius: 0 10px 10px 0;">중복체크
								</button>
							</div>
						</div>
						<div style="text-align: center; padding: 0; margin: 0">
							<label id="checkMessage"
								   style="font-weight: bold; text-align: center; padding: 0; margin: 0"></label>
						</div>
						<div class="input-group mb-3" style="margin-top: 15px">
							<div class="input-group-addon" style="width: 35px; border-radius: 10px 0 0 10px;">
								<i class="fa fa-user"></i>
							</div>
							<input type="text" id='userName' name='userName' class='form-control' maxlength="20"
								   autocomplete="off" placeholder="이름을 입력해주세요"
								   aria-describedby="basic-addon2" required>
						</div>

						<div class="input-group mb-3">
							<div class="input-group-addon" style="width: 35px; border-radius: 10px 0 0 10px;">
								<i class="fa fa-user-md"></i>
							</div>
							<input type="text" id='userNickName' name='userNickName' class='form-control' maxlength="20"
								   autocomplete="off" placeholder="닉네임을 입력해주세요"
								   aria-describedby="basic-addon2" required>
						</div>

						<div class="input-group mb-3">
							<div class="input-group-addon" style="width: 35px; border-radius: 10px 0 0 10px;">
								<i class="fa fa-lock"></i>
							</div>
							<input type="password" id='userPwd' name='userPwd' class='form-control' maxlength="20"
								   autocomplete="off" placeholder="비밀번호를 입력해주세요"
								   aria-describedby="basic-addon2" required>
						</div>
						<div class="input-group mb-3" style="margin-bottom: 0px !important;">
							<div class="input-group-addon" style="width: 35px; border-radius: 10px 0 0 10px;">
								<i class="fa fa-unlock"></i>
							</div>
							<input type="password" id='userPwd2' name='userPwd2' class='form-control' maxlength="20"
								   autocomplete="off" placeholder="비밀번호를 한번더 입력해주세요"
								   aria-describedby="basic-addon2" onkeyup="passwordCheckfunction()" required>
						</div>
						<div style="text-align: center; padding: 0; margin: 0;">
							<label id="passwordCheckMessage"
								   style="font-weight: bold; text-align: center; padding: 0; margin: 0"></label>
						</div>
						<button type='submit' class='btn btn-lg btn-block btn-primary' style="margin-top: 15px">회원가입</button>
						<hr>
						<div class='text-center mb20'>SNS로 가입하기</div>
						<a href='#' class="btn btn-social facebook btn-block"><i class="fa fa-facebook"></i>facebook으로 가입하기</a>
						<a href='#' class="btn btn-social google btn-block"><i class="fa fa-google"></i>Google로 가입하기</a>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%--내용--%>
<%--footer--%>
<%@include file="../footer.jsp" %>
<%--footer--%>

<%--오류메시지--%>
<%@include file="../WEB-INF/modules/logError.jsp" %>
<%--오류메시지--%>
<script src="../assets/js/bundle/bundle.js" type="text/javascript"></script>
<!--dz parallaxer-->
<script type="text/javascript" src="../assets/plugins/dzsparallaxer/dzsparallaxer.js"></script>
<script type="text/javascript" src="../assets/plugins/dzsparallaxer/scroller.js"></script>
<script type="text/javascript" src="../assets/plugins/dzsparallaxer/advancedscroller/plugin.js"></script>
<script type="text/javascript" src="plugins/data-tables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="plugins/data-tables/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="plugins/data-tables/dataTables.fixedHeader.min.js"></script>
<script type="text/javascript" src="plugins/data-tables/dataTables.responsive.min.js"></script>
<script type="text/javascript" src="plugins/data-tables/responsive.bootstrap4.min.js"></script>
<script type="text/javascript" src="js/data-table.init.js"></script>
</body>
</html>
