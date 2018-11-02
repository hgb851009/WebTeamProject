<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>비트캠프 자바기반 웹&앱 개발자 양성과정 프로젝트</title>
	<link href="../assets/css/plugins/plugins.css" rel="stylesheet">
	<link href="../assets/plugins/dzsparallaxer/dzsparallaxer.css" rel="stylesheet">
	<link href="../assets/plugins/dzsparallaxer/scroller.css" rel="stylesheet">
	<link href="../assets/plugins/dzsparallaxer/advancedscroller/plugin.css" rel="stylesheet">
	<link type="text/css" rel="stylesheet"  href="../assets/contact-form/css/smart-forms.css">
	<link href="../assets/css/style.css" rel="stylesheet">
	<%--제이쿼리--%>
	<script src="../https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
					<div class="smart-forms smart-container">
						<form method="post" action="http://bootstraplovers.com/bootstrap4/versa-v2.1/html/contact-form/php/smartprocess.php" id="smart-form">
							<div class="form-body">
								<div class="section">
									<label class="field prepend-icon">
										<input type="text" name="sendername" id="sendername" class="gui-input" placeholder="Enter name">
										<span class="field-icon"><i class="fa fa-user" style="line-height: 42px;"></i></span>
									</label>
								</div><!-- end section -->
								<div class="section">
									<label class="field prepend-icon">
										<input type="email" name="emailaddress" id="emailaddress" class="gui-input" placeholder="Email address">
										<span class="field-icon"><i class="fa fa-envelope" style="line-height: 42px"></i></span>
									</label>
								</div><!-- end section -->

								<div class="section">
									<label class="field prepend-icon">
										<input type="text" name="sendersubject" id="sendersubject" class="gui-input" placeholder="Enter subjec">
										<span class="field-icon"><i class="fa fa-lightbulb-o" style="line-height: 42px"></i></span>
									</label>
								</div><!-- end section -->

								<div class="section">
									<label class="field prepend-icon">
										<textarea class="gui-textarea" id="sendermessage" name="sendermessage" placeholder="Enter message"></textarea>
										<span class="field-icon"><i class="fa fa-comments" style="line-height: 42px"></i></span>
										<span class="input-hint"> <strong>Hint:</strong> Please enter between 80 - 300 characters.</span>
									</label>
								</div><!-- end section -->

								<div class="result"></div><!-- end .result  section -->

							</div><!-- end .form-body section -->
							<div class="form-footer">
								<button type="submit" data-btntext-sending="Sending..." class="button btn btn-primary">Submit</button>
								<button type="reset" class="button"> Reset </button>
							</div><!-- end .form-footer section -->
						</form>
					</div>
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
<script src="../assets/contact-form/js/jquery.form.min.js" type="text/javascript"></script>
<script src="../assets/contact-form/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="../assets/contact-form/js/additional-methods.min.js" type="text/javascript"></script>
<script src="../assets/contact-form/js/smart-form.js" type="text/javascript"></script>
</body>
</html>
