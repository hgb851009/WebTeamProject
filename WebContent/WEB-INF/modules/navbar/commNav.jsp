<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg navbar-light navbar-transparent navbar-sticky">
	<c:choose>
		<c:when test="${empty sessionScope.userID}">
			<div class="navbar-right-col">
				<ul class="list-inline">
					<li class="list-inline-item">
						<a href="#" data-toggle="dropdown"><p data-toggle="tooltip" data-placement="bottom" title="로그인">&nbsp;<i class="fa fa-sign-in mr-1"></i></p></a>
						<div class="dropdown-menu dropdown-form dropdown-menu-right" style="margin: 18px 0px;">
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
									<p class="mb0 text-small">아이디가 기억나지 않으세요? <a href="../../../user/register.jsp" class="btn btn-underline">회원가입</a>
									</p>
									<p class="mb0 text-small">아이디가 기억나지 않으세요? <a href="#" class="btn btn-underline">ID찾기</a></p>
									<p class=" text-small mb0">비밀번호가 기억나지 않으세요? <a href="#" class="btn btn-underline">비밀번호찾기</a>
									</p>
								</div>
							</div>
						</div>
					</li>
					<li class="list-inline-item">
						<a href="../../../user/register.jsp"><p data-toggle="tooltip" data-placement="top" title="회원가입">&nbsp;<i class="fa fa-user-plus mr-1"></i></p></a>
					</li>
				</ul>
			</div>
		</c:when>
		<c:when test="${not empty sessionScope.userID}">
			<div class="navbar-right-col">
				<ul class="list-inline">
					<li class="list-inline-item">
						<a href="#"><p data-toggle="tooltip" data-placement="bottom" title="알림">&nbsp;<i class="fa fa-bell mr-1"></i></p></a>
					</li>
					<li class="list-inline-item dropdown dropdown-search">
						<a href="#" data-toggle="dropdown" class="dropdown-toggle"><p style="margin-left: -4px">&nbsp;<i class="fa fa-cog"></i></p></a>
						<div class="dropdown-menu search-dropdown-menu dropdown-menu-left" style="left: -88px;min-width: 120px;">
							<div style="background-color: white; border-radius: 5px; width:120px;text-align: center;">
								<a class="dropdown-item" href="#" style="border-radius: 5px"><i class="fa fa-user mr-1"></i>정보수정</a>
								<a class="dropdown-item" href="/logout" style="border-radius: 5px"><i class="fa fa-sign-out mr-1"></i>로그아웃</a>
								<c:if test="${sessionScope.userLevel eq 1}">
									<a class="dropdown-item" href="../user/memberlist.jsp" style="border-radius: 5px"><i class="fa fa-user-secret mr-1"></i>회원관리</a>
								</c:if>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</c:when>
	</c:choose>

	<a class="navbar-brand" href="../index.jsp">
		<img src="../../../images/logo-light.png" alt="" class="logo-visible-desktop logo-default">
		<img src="../../../images/logo.png" alt="" class="logo-hidden-desktop logo-scroll">
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarCollapse">
		<ul class="navbar-nav  ml-auto">
			<li class="nav-item">
				<a class="nav-link" href="../index.jsp">홈 </a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">프로필 </a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">포트폴리오 </a>
			</li>
			<li class="nav-item dropdown active">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="/">커뮤니티 </a>

				<ul class="dropdown-menu">
					<li><a href="board.jsp" class="dropdown-item"><i class="fa fa-comments-o mr-2 text-muted"></i> 게시판</a>
					</li>
					<li><a href="../../../articles/gallery.jsp" class="dropdown-item"><i class="fa fa-image mr-2 text-muted"></i> 갤러리</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>
</nav>