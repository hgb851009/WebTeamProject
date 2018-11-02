<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${not empty sessionScope.userID}">
	<%
		response.sendRedirect("../index.jsp");
	%>
</c:if>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>헤더부분 로그인</title>
    <link href="../assets/css/plugins/plugins.css" rel="stylesheet">
    <link href="../assets/plugins/ytplayer/jquery.mb.YTPlayer.min.css" rel="stylesheet">
    <link href="../assets/plugins/dzsparallaxer/dzsparallaxer.css" rel="stylesheet">
    <link href="../assets/plugins/dzsparallaxer/scroller.css" rel="stylesheet">
    <link href="../assets/plugins/dzsparallaxer/advancedscroller/plugin.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="plugins/cubeportfolio/css/cubeportfolio.min.css">
    <link href="../assets/css/style.css" rel="stylesheet">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
<body>
<%--id쿠키체크--%>
<%--id쿠키체크--%>
<%--메뉴--%>
<%@include file="../WEB-INF/modules/navbar/loginNav.jsp"%>
<%--메뉴--%>
<!--page title-->
<div class="cta-bg-slider bg-primary auto-init height-is-based-on-content" data-options='{   direction: "reverse"}'>
    <div class="container pt100 pb100">
        <div class="row">
            <div class="col-md-8 ml-auto mr-auto wow bounceIn" data-wow-delay=".2s">
                <h3 class="h3 mb30 text-center font300 text-white">로그인해야 접근이 가능합니다.</h3>
            </div>
        </div>
    </div>
</div>
<!--parallax-->
<!--/.page-title-->
<div class='container pb50  pt50-md'>
    <div class='row'>
        <div class='col-md-6 col-lg-5 mr-auto ml-auto'>
            <div class='card card-account'>
                <div class='card-body'>
                    <form action="/login" method="post">
                        <div class='form-group'>
                            <label for='username'>아이디</label>
                            <input name="id" id='username' type='text' class='form-control' placeholder='아이디를 입략해주세요.' value="${cookie.uid.value}">
                        </div>
                        <div class='form-group'>
                            <label for='password'>이메일</label>
                            <input name="pwd" id='password' type='password' class='form-control' placeholder='비밀번호를 입력해주세요.'>
                        </div>
                        <div class='form-group'>
                            <label class="checkbox">
                                <input type="checkbox" value="on" id="rememberMe" name="ck_id" ${cookie.chk.value}> 아이디저장
                            </label>
                        </div>
                        <button class='btn btn-block btn-secondary btn-rounded' type="submit">로그인</button>
                    </form>
                    <br>
                    <p class='mb0 text-small'>아이디가 기억나지 않으세요? <a href='#' class='btn btn-underline'>ID찾기</a></p>
                    <p class=' text-small mb0'>비밀번호가 기억나지 않으세요? <a href='#' class='btn btn-underline'>비밀번호찾기</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<%--내용--%>
<%--footer--%>
<%@include file="../footer.jsp"%>
<%--footer--%>

<%--오류메시지--%>
<%@include file="../WEB-INF/modules/logError.jsp"%>
<%--오류메시지--%>
<script src="../assets/js/bundle/bundle.js" type="text/javascript"></script>
<!--dz parallaxer-->
<script type="text/javascript" src="../assets/plugins/dzsparallaxer/dzsparallaxer.js"></script>
<script type="text/javascript" src="../assets/plugins/dzsparallaxer/scroller.js"></script>
<script type="text/javascript" src="../assets/plugins/dzsparallaxer/advancedscroller/plugin.js"></script>
<script src="../assets/js/versa.custom.js"></script>
</body>
</html>
