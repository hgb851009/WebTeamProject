<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="WEB-INF/modules/location.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%	String loginUser=String.valueOf(session.getAttribute("id")); %>	
<c:set var="userName" value="<%=loginUser%>"></c:set>
<!DOCTYPE html>
<html lang="kr">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>웹팀프</title>
<style>
	body,html{
		margin:0;
		padding:0;
		height:100%;
	}
	.backimg{
		/* background-position: x-psition; */
		background-image:url('images/mm.jpg');
		min-height:100%;
		background-position:center;
		background-size:cover;
	} 
	.blinking{
	-webkit-animation:blink 1.5s ease-in-out infinite alternate;
    animation:blink 1.5s ease-in-out infinite alternate;
}
@-webkit-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@-moz-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
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
		background: linear-gradient(to bottom, rgba(102,102,153,0.7), rgba(204,255,153,0.6));
		color: white;
		font-size: 20px;
		border-radius:30px;
		}
</style>
<!-- 메인화면  -->
<link rel="stylesheet" href="assets/css/mainpage.css">
</head>
<body>
<a class="navbar-brand" href="index3.jsp" style="background-color: tranceparent; position: absolute;">
		<img src="images/한글빛로고최종.png" align="left" id="logo2" width="auto" height="120px" alt="홈"  class="logo-home">
		</a>
		
	<div class="backimg"><nav class="novbar novbak-default" style="position: fixed;">
	
		<div class="moving-sun animated1" style="z-index: 2">
			<img  src="images/sun.png" class="move-sun">
		</div>
		<div class="moving-fly animated2" style="z-index: 2">
			<img src="images/fly.png" class="move-fly">
		</div>
		<div style="position: relative; left:470px; top:50px;">
			<img src="images/한글빛베너최종.png" width="1000px" class="image blinking">
 		</div>
	<!--  버튼 추가  -->
		<div style="position: relative; left:650px; top:460px; ">
			<a href="board.do"><img class="imageclick" src="images/board.png" width="140px" height="90px" title="게시판"></a>
 		</div>
<c:choose>
<c:when test="${userName eq 'root'}">
 		<div style="position: relative; left:785px; top:400px; ">
			<a href="cNpR.do"><img class="imageclick" src="images/myroom.png" width="180px" title="마이 페이지"></a>
 		</div>
</c:when>
<c:otherwise>
 		<div style="position: relative; left:785px; top:400px; ">
			<a href="cNp.do"><img class="imageclick" src="images/myroom.png" width="180px" title="마이 페이지"></a>
 		</div>
</c:otherwise>
</c:choose>

 		<div style="position: relative; left:850px; top:70px; ">
			<a href="select.do"><img class="imageclick" src="images/school.png" width="180px" title="학교"></a>
 		</div>
 		<div style="position: relative; left:1600px; top:-250px; ">
			<a href="shop.do"><img class="imageclick" src="images/shop.png" width="180px" title="SHOP"></a>
 		</div>
<div id="newlogin" align="center" style="display:block; " >  
<div id="s-login" align="center">

<c:choose>
<c:when test="${userName ne 'null'}">
<br>
<form method="post" role="logout">
<p>${userName } 님 환영합니다!</p>
<input type="button" id="logoutbtn" style="color:white;font-size: 15px; font-weight: bold; border-color: rgb(255,202,51); background-color:rgb(102,102,153); 
border-radius:8px; height: 40px;width: 80px;" value="LOGOUT">
</form>
</c:when>
<c:otherwise>
<form method="post" role="login">
	<h5> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" style="width:170px; height:20px; border-radius:5px;" name="id" ></h5>
	<h5> PASSWORD <input type="text" style="width:170px; height:20px; border-radius:5px;" name="pwd" ></h5>
	<input type="button" name="joinbtn" style="color:white;font-size: 15px; font-weight: bold; 
				border-color: rgb(255,202,51); background-color:rgb(102,102,153); border-radius:8px; height: 40px;width: 80px;" value="JOIN">
	<input type="button" id="loginbtn" style="color:white;font-size: 15px; font-weight: bold; 
				border-color: rgb(255,202,51); background-color:rgb(204,51,0); border-radius:8px; height: 40px;width: 80px;" value="LOGIN">
</form>
</c:otherwise>

</c:choose>


</div></div>
</nav></div>
</body>
<script>
$(function(){
	
$("#loginbtn").click(function(){
	var formObj = $("form[role='login']");
	formObj.attr("action","login.do");
	formObj.submit();
	});
$("#logoutbtn").click(function(){
	var formObj = $("form[role='logout']");
	formObj.attr("action","logout.do");
	formObj.submit();
});

});
</script>
</html>