<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../WEB-INF/modules/location.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
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
			text-align: left;
			white-space: nowrap;
			padding: 0.5rem;
			padding-left: 5%;
			padding-right: 5%;
			vertical-align: middle;
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
	<form method="post" action="/boardTest" enctype="multipart/form-data">
	<table id="board_table" class="table table-sm" style="border: 0px solid #dddddd; width: 80%; margin: 0 auto;">
		<%--<thead>--%>
			<%--<tr>--%>
				<%--<th colspan="3" style="background-color: #0083ff; color: #eee; width: 6%;">글작성</th>--%>
			<%--</tr>--%>
		<%--</thead>--%>
		<tbody>
		<tr>
			<td style="text-align: right;width: 10%; padding-right: 0;">이름</td>
			<td colspan="2">${userNickName}<input name="userNickName" type="hidden" value="${userNickName}"></td>
		</tr>
		<tr>
			<td style="text-align: right; padding-right: 0;">제목</td>
			<td colspan="2"><input name="boardTitle" style="margin: 0;border-radius: 0;min-height: 0;" type="text" maxlength="50" class='form-control' placeholder="글 제목을 입력하세요."></td>
		</tr>
		<tr>
			<td colspan="3">
				<textarea name="boardContent" class='form-control' style="margin: 0;border-radius: 0;min-height: 0;" rows="14" maxlength="2048" placeholder="글 내용을 입력하세요."></textarea>
			</td>
		</tr>
		<tr>
			<td style="text-align: right; padding-right: auto;padding-left: auto">파일업로드</td>
			<td colspan="2">
				<input name="boardFile" type="file" class="form-control-file table-bordered" style="width: 100%;">
			</td>
		</tr>
		<tr>
			<td colspan="3"><a href="boardWrite.jsp" class="btn btn-primary pull-right" type="submit">등록</a> </td>
		</tr>
		</tbody>
	</table>
	</form>
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