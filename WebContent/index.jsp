<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="WEB-INF/modules/location.jsp"%>
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>웹팀프</title>
	<link href="assets/css/plugins/plugins.css" rel="stylesheet">
	<link href="assets/plugins/dzsparallaxer/dzsparallaxer.css" rel="stylesheet">
	<link href="assets/plugins/dzsparallaxer/scroller.css" rel="stylesheet">
	<link href="assets/plugins/dzsparallaxer/advancedscroller/plugin.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="assets/plugins/cubeportfolio/css/cubeportfolio.min.css">
	<link href="assets/css/style.css" rel="stylesheet">
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
<body>
<!-- <nav class="navbar navbar-expand-lg navbar-light navbar-transparent navbar-sticky" style="padding: 0.0rem 1rem;"> -->
	<c:choose>
		<c:when test="${empty sessionScope.userID}">
		
			<div class="navbar-right-col" >
				<ul class="list-inline">
					<li class="list-inline-item">
						<a href="#" data-toggle="dropdown"><p data-toggle="tooltip" data-placement="bottom" title="로그인">&nbsp;<i class="fa fa-sign-in mr-1"></i></p></a>
						<div class="dropdown-menu dropdown-form dropdown-menu-right">
							<div class="card card-account">
								<div class="card-body">
									<form action="/login" method="post">
										<div class="form-group mb10">
											<label for="username">아이디</label>
											<input id="username" name="id" type="text" class="form-control" placeholder="아이디"
												   value="${cookie.uid.value}">
										</div>
										<div class="form-group mb10">
											<label for="password">비밀번호</label>
											<input id="password" name="pwd" type="password" class="form-control"
												   placeholder="비밀번호">
										</div>
										<div class="form-group mb10">
											<label class="checkbox">
												<input type="checkbox" value="on" id="rememberMe" name="ck_id" ${cookie.chk.value}> 아이디저장
											</label>
										</div>
										<button type="submit" class="btn btn-block btn-secondary btn-rounded">로그인</button>
									</form>
									<p class="mb0 text-small">아이디가 기억나지 않으세요? <a href="user/register.jsp" class="btn btn-underline">회원가입</a>
									</p>
									<p class="mb0 text-small">아이디가 기억나지 않으세요? <a href="#" class="btn btn-underline">ID찾기</a></p>
									<p class=" text-small mb0">비밀번호가 기억나지 않으세요? <a href="#" class="btn btn-underline">비밀번호찾기</a>
									</p>
								</div>
							</div>
						</div>
					</li>
					<li class="list-inline-item">
						<a href="user/register.jsp"><p data-toggle="tooltip" data-placement="top" title="회원가입">&nbsp;<i class="fa fa-user-plus mr-1"></i></p></a>
					</li>
				</ul>
			</div>
		</c:when>
		<c:when test="${not empty sessionScope.userID}">
			<div class="navbar-right-col" >
				<ul class="list-inline">
					<li class="list-inline-item">
						<a href="#">&nbsp;<i class="fa fa-bell mr-1"></i></p></a>
					</li>
					<li class="list-inline-item dropdown dropdown-search">
						<a href="#" data-toggle="dropdown" class="dropdown-toggle"><i class="fa fa-cog"></i></a>
						<div class="dropdown-menu search-dropdown-menu dropdown-menu-left" style="left: -88px;min-width: 120px;">
							<div style="background-color: white; border-radius: 5px; width:120px;text-align: center;">
								<a class="dropdown-item" href="#" style="border-radius: 5px"><i class="fa fa-user mr-1"></i>정보수정</a>
								<a class="dropdown-item" href="/logout" style="border-radius: 5px"><i class="fa fa-sign-out mr-1"></i>로그아웃</a>
									<c:if test="${sessionScope.userLevel eq 1}">
										<a class="dropdown-item" href="user/memberlist.jsp" style="border-radius: 5px"><i class="fa fa-user-secret mr-1"></i>회원관리</a>
									</c:if>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</c:when>
	</c:choose>
	<!-- 탑부분-->  
	<!-- 로고 width 를 잡아주고 height 를 auto 로 해놓으면 width 만큼 사이즈를 수직수평 동등하게 잡아줌-->
	<!-- background-repeat 배경이미지 반복여부 -->
	<a class="navbar-brand" href="index.jsp" >
		<img src="images/한글빛로고최종.png"  id="logo2" width="auto" height="300px" alt="" 
		style="background-repeat: repeat;" class="logo-visible-desktop logo-default">
	</a>
	<!-- 센터 베너추가  align = 위치를 지정해줌-->
		 <!-- <a class="navbar-brand2" href="index.jsp">
		<img src="images/한글빛베너최종.png"  id="banner" alt="" style="background-repeat: repeat">
		</a>  --> 
	<!-- 상단 우측의 버튼들 -->
	<!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarCollapse">
		<ul class="navbar-nav  ml-auto">
			<li class="nav-item active">
				<a class="nav-link" href="../index.jsp">홈 </a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">프로필 </a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">포트폴리오 </a>
			</li>
			dropdown = sing 콤보박스랑 같은개념
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티 </a>

				<ul class="dropdown-menu">
					<li><a href="articles/board.jsp" class="dropdown-item"><i class="fa fa-comments-o mr-2 text-muted"></i> 게시판</a>
					</li>
					<li><a href="articles/gallery.jsp" class="dropdown-item"><i class="fa fa-image mr-2 text-muted"></i> 갤러리</a>
					</li>
				</ul>
			</li>
		</ul>
	</div> -->
<!-- </nav> --><!--/footer-->


<!-- 미드부분 -->
<section class="dzsparallaxer auto-init dzsparallaxer---window-height use-loading" style="position: relative; height: 800px;" data-options='{  mode_scroll: "normal" }'>
	<div class="divimage dzsparallaxer--target " data-src="images/bg-4.jpg" style="width: 100%; height: 100%; background-image: url()">
		<div class="content-table"> 
			<div class="content-middle pt80 ">
				<div class="container">
					
				</div>
			</div>
		</div>
	</div>
	<div class="mouse-down"><a data-scroll href="#about"><i class="fa fa-angle-down fa-3x text-white"></i></a></div>

</section>
<!-- 하단 잡다한 텍스트 넣고 고정시킴으로써 메인페이지 짤림 방지 -->
<footer>
<div class="footer.deco" >
	
	<h3>웹팀프웹팀프웹팀프웹팀프웹팀프웹팀프</h3>
		<ul>
			<li >Phone : 123 - 456 - 789</li>
				<li>E-mail : wtp@gmail.com</li>
				<li>Fax : 123 - 456 - 789</li>
		    </ul>
		    <p>
				@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		    </p>
		</div>
</footer>
<%--footer--%>
<%@include file="footer.jsp"%>
<%--footer--%>
<%--로그인 오류메시지--%>
<%@include file="WEB-INF/modules/logError.jsp"%>
<script src="assets/js/bundle/bundle.js" type="text/javascript"></script>
<script src="assets/js/versa.custom.js"></script>
<script type="text/javascript" src="assets/plugins/dzsparallaxer/dzsparallaxer.js"></script>
<script type="text/javascript" src="assets/plugins/dzsparallaxer/scroller.js"></script>
<script type="text/javascript" src="assets/plugins/dzsparallaxer/advancedscroller/plugin.js"></script>
<script type="text/javascript" src="assets/plugins/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
<script type="text/javascript" src="assets/js/cube-portfolio-home.js"></script>
</body>
</html>
