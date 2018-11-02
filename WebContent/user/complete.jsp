<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="userVO" scope="request" class="domain.UserVO"></jsp:useBean>
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
	<script src="../https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<script src="register.js"></script>
</head>
<body>
<%

%>
<%--메뉴--%>
<%@include file="../WEB-INF/modules/navbar/loginNav.jsp" %>
<%--메뉴--%>
<!--page title-->
<div class="cta-bg-slider bg-primary auto-init height-is-based-on-content" data-options='{   direction: "reverse"}'>
	<div class="container pt100 pb100">
		<div class="row">
			<div class="col-md-8 ml-auto mr-auto wow bounceIn" data-wow-delay=".2s">
				<h3 class="h3 mb30 text-center font300 text-white">회원가입완료</h3>
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
				<div class='card-body' style="text-align: center;">
					<span style="display:table-cell;vertical-align: middle;">아이디:${userVO.userID}</span><br>
					<span style="display:table-cell;vertical-align: middle;">이름:${userVO.userName}</span><br>
					<span style="display:table-cell;vertical-align: middle;">닉네임:${userVO.userNickName}</span><br>
					<span style="display:table-cell;vertical-align: middle;">비밀번호${userVO.userPwd}</span><br>
					<hr>
						<button type='button' onclick="location.href='../login/login.jsp'" class='btn btn-lg btn-block btn-primary' style="margin-top: 15px">로그인</button>
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
<script src="../assets/js/versa.custom.js"></script>
</body>
</html>
