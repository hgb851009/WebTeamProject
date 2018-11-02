<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../WEB-INF/modules/location.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게시판</title>
    <link href="../assets/css/plugins/plugins.css" rel="stylesheet">
    <link href="../assets/plugins/dzsparallaxer/dzsparallaxer.css" rel="stylesheet">
    <link href="../assets/plugins/dzsparallaxer/scroller.css" rel="stylesheet">
    <link href="../assets/plugins/dzsparallaxer/advancedscroller/plugin.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<style>
		#board_table thead tr th {
			text-align: center;
			white-space: nowrap;
			padding: 0.5rem;
		}
		#board_table tbody tr td {
			text-align: center;
			white-space: nowrap;
			padding: 0.5rem;
		}
	</style>
</head>
<body>
<%@include file="../WEB-INF/modules/navbar/commNav.jsp"%>
<!--page title-->
<div class="cta-bg-slider bg-primary auto-init height-is-based-on-content" data-options='{   direction: "reverse"}'>
    <div class="container pt100 pb100">
        <div class="row">
            <div class="col-md-8 ml-auto mr-auto wow bounceIn" data-wow-delay=".2s">
                <h3 class="h3 mb30 text-center font300 text-white">게시판</h3>
            </div>
        </div>
    </div>
</div>
<!--/.page-title-->
<div class="container pt20 pb20">
	<table id="board_table" class="table table-bordered table-hover" style="border: 1px solid #dddddd; width: 80%; margin: 0 auto;">
		<thead>
			<tr>
				<th style="background-color: #0083ff; color: #eee; width: 6%;">번호</th>
				<th style="background-color: #0083ff; color: #eee;">제목</th>
				<th style="background-color: #0083ff; color: #eee; width: 10%">작성자</th>
				<th style="background-color: #0083ff; color: #eee; width: 7%;">조회수</th>
				<th style="background-color: #0083ff; color: #eee; width: 11%;">작성일</th>
			</tr>
		</thead>
		<tbody>
		<tr>
			<td>3</td>
			<td style="text-align: left">안녕하세요</td>
			<td>관리자</td>
			<td>1</td>
			<td>2018-09-13</td>
		</tr>
		<tr>
			<td>2</td>
			<td style="text-align: left">처리가 끝났습니다.</td>
			<td>관리자</td>
			<td>1</td>
			<td>2018-09-13</td>
		</tr>
		<tr>
			<td>1</td>
			<td style="text-align: left">JSTL과 커스텀태그</td>
			<td>관리자</td>
			<td>1</td>
			<td>2018-09-13</td>
		</tr>
		<tr>
			<td colspan="5"><a href="boardWrite.jsp" class="btn btn-primary pull-right" type="submit">글쓰기</a> </td>
		</tr>
		</tbody>
	</table>
</div>

<%--footer--%>
<%@include file="../footer.jsp"%>
<%--footer--%>
<%--오류메시지--%>
<%@include file="../WEB-INF/modules/logError.jsp"%>
<!--/.footer-->
<script src="../assets/js/bundle/bundle.js" type="text/javascript"></script>
<script src="../assets/js/versa.custom.js"></script>
<!--dz parallaxer-->
<script type="text/javascript" src="../assets/plugins/dzsparallaxer/dzsparallaxer.js"></script>
<script type="text/javascript" src="../assets/plugins/dzsparallaxer/scroller.js"></script>
<script type="text/javascript" src="../assets/plugins/dzsparallaxer/advancedscroller/plugin.js"></script>
<!--page script-->
</body>
</html>