<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="WEB-INF/modules/location.jsp"%>
<%
	String loginUser = String.valueOf(session.getAttribute("id"));
%>
<c:set var="userName" value="<%=loginUser%>"></c:set>
<!DOCTYPE html>
<html lang="kr">
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="assets/js/jquery.validate.js"></script>
<script src="assets/js/additional-methods.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/joinform.js"></script>
<script src="assets/js/jquery.md5.js"></script>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>웹팀프</title>
<style>
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
}

.backimg {
	/* background-position: x-psition; */
	background-image: url('images/mm.jpg');
	min-height: 100%;
	background-position: center;
	background-size: cover;
}

.blinking {
	-webkit-animation: blink 1.5s ease-in-out infinite alternate;
	animation: blink 1.5s ease-in-out infinite alternate;
}

@
-webkit-keyframes blink { 0% {
	opacity: 0;
}

100%
{
opacity
:
1;
}
}
@
-moz-keyframes blink { 0% {
	opacity: 0;
}

100%
{
opacity
:
1;
}
}
@
keyframes blink { 0% {
	opacity: 0;
}

100%
{
opacity
:
1;
}
}
.imageclick:hover {
	transform: scale(1.2);
	-webkit-transform: scale(1.2);
	-o-transform: scale(1.2);
}

#s-login {
	position: fixed;
	width: 350px;
	height: 190px;
	top: 680px;
	right: 50%;
	padding: 20px;
	margin-right: -900px;
	border: 3px dashed white;
	background: linear-gradient(to bottom, rgba(102, 102, 153, 0.7),
		rgba(204, 255, 153, 0.6));
	color: white;
	font-size: 20px;
	border-radius: 30px;
}
</style>
<!-- 메인화면  -->
<link rel="stylesheet" href="assets/css/mainpage.css">
</head>
<body>
	<a class="navbar-brand" href="index.jsp"
		style="background-color: tranceparent; position: absolute;"> <!-- <img src="images/avatar_logo.png" align="left" id="logo2" width="auto" height="120px" alt="홈"  class="logo-home">
		 --></a>
	<div class="backimg">
		<nav class="novbar novbak-default" style="position: fixed;">

			<div class="moving-sun animated1" style="z-index: 2">
				<img src="images/sun.png" class="move-sun">
			</div>
			<div class="moving-fly animated2" style="z-index: 2">
				<img src="images/fly.png" class="move-fly">
			</div>
			<div style="position: relative; left: 470px; top: 50px;">
				<img src="images/title_logo.png" width="1000px"
					class="image blinking">
			</div>
			<!--  버튼 추가  -->
			<div style="position: relative; left: 650px; top: 460px;">
				<a href="board.do"><img class="imageclick"
					src="images/board.png" width="140px" height="90px" title="게시판"></a>
			</div>
			<c:choose>
				<c:when test="${userName eq 'root'}">
					<div style="position: relative; left: 785px; top: 400px;">
						<a href="cNpR.do"><img class="imageclick"
							src="images/myroom.png" width="180px" title="마이 페이지"></a>
					</div>
				</c:when>
				<c:otherwise>
					<div style="position: relative; left: 785px; top: 400px;">
						<a href="cNp.do"><img class="imageclick"
							src="images/myroom.png" width="180px" title="마이 페이지"></a>
					</div>
				</c:otherwise>
			</c:choose>

			<div style="position: relative; left: 850px; top: 70px;">
				<a href="select.do"><img class="imageclick"
					src="images/school.png" width="180px" title="학교"></a>
			</div>

			<div style="position: relative; left: 1600px; top: -250px;">
				<a href="shop.do"><img class="imageclick" src="images/shop.png"
					width="180px" title="SHOP"></a>
			</div>
			<div id="newlogin" align="center" style="display: block;">
				<div id="s-login" align="center">

					<c:choose>
						<c:when test="${userName ne 'null'}">
							<br>
							<form method="post" role="logout">
								<p>${userName }님 환영합니다!</p>
								<input type="button" id="logoutbtn"
									style="color: white; font-size: 15px; font-weight: bold; border-color: rgb(255, 202, 51); background-color: rgb(102, 102, 153); border-radius: 8px; height: 40px; width: 80px;"
									value="LOGOUT">
							</form>
						</c:when>
						<c:otherwise>
							<form method="post" role="login">
								<h5>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ID
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
										style="width: 170px; height: 20px; border-radius: 5px;"
										name="id">
								</h5>
								<h5>
									PASSWORD <input type="password"
										style="width: 170px; height: 20px; border-radius: 5px;"
										name="pwd">
								</h5>
								<br>
								<input type="button" id="joinbtn"
									style="color: white; font-size: 15px; font-weight: bold; border-color: rgb(255, 202, 51); background-color: rgb(102, 102, 153); border-radius: 8px; height: 40px; width: 80px;"
									value="JOIN"> <input type="button" id="loginbtn"
									style="color: white; font-size: 15px; font-weight: bold; border-color: rgb(255, 202, 51); background-color: rgb(204, 51, 0); border-radius: 8px; height: 40px; width: 80px;"
									value="LOGIN">
							</form>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</nav>
	</div>
	<!-- 회원가입 모달 -->
	<div class="modal" id="signUpModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<form id="signup-form" class="form-horizontal needs-validation">
						<div class="form-group">
							<div class="col-sm-12">
								<input id="userid" type="text" class="form-control"
									name="userid" placeholder="아이디" maxlength="20">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<input type="password" class="form-control" id="password"
									name="password" placeholder="비밀번호" maxlength="20">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<input type="password" class="form-control"
									id="confirm_password" name="confirm_password"
									placeholder="비밀번호 확인" maxlength="20">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<input type="text" class="form-control" id="usernick"
									name="usernick" placeholder="닉네임">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<input type="text" class="form-control" id="username"
									name="username" placeholder="이름">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<input type="text" class="form-control" id="useremail"
									name="useremail" placeholder="이메일">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<button type="button" id="signUp"
									class="btn btn-primary btn-block">회원가입</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(function() {
		$("#joinbtn").click(function() {
			$("#signUpModal").modal("show");
			$("#signup-form").validate();
		});
	
		$("#loginbtn").click(function() {
			var formObj = $("form[role='login']");
			formObj.attr("action", "login.do");
			formObj.submit();
		});
		$("#logoutbtn").click(function() {
			var formObj = $("form[role='logout']");
			formObj.attr("action", "logout.do");
			formObj.submit();
		});
		$("#signUp").click(function(e) {
			if ($("#signup-form").valid()) {
				$.ajax({
					type : "post",
					url : "signup.do",
					data : {
						id : $('#userid').val(),
						pw : $("#password").val(),
						nick :$("#usernick").val(),
						name : $("#username").val(),
						email : $('#useremail').val()
					},
					
					success : function(data) {
						if (data == 1) {
							alert('가입 성공');
							$('.modal').modal("hide");
						}
					},
					
					error : function(error) {
						alert('에러')
					}
				});
			} else {
				e.preventDefault();
				return;
			}
		});
	});
</script>
</html>