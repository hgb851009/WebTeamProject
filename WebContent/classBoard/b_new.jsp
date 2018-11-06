<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE>
<%	
String loginUser=String.valueOf(session.getAttribute("id")); 
String cur_page=request.getParameter("page"); 
int cl=Integer.parseInt(request.getParameter("class"));
String writer=request.getParameter("writer");
%>
<html>
<head>
<p>LOGIN NICKNAME : <%=writer %></p>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board :: 새 글</title>
<style>
	#s-container {
        width: 940px;
        margin: 0px auto;
        padding: 20px;
        border: 1px dotted silver;}
	#s-header {
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid gray;}
	#s-content {
        width: 900px;
        padding: 20px;
        margin-bottom: 20px;
        float: left;
        border: 1px solid gray;}
	#s-file {
        margin-bottom: 20px;
        padding: 20px;
        border: 1px solid gray;}
     label{
    	font-size: x-small;
     	font-weight: bold;}
   	 a:link{
    	color:black;
    	text-decoration:none;}
    a:visited{
    	color:black;
    	text-decoration:none;}
    sup{
    	background: orange;}
     }
</style>
</head>
<body>
<c:set var="clno" value="<%=cl %>"></c:set>
<form action="../newBoard.do" method="post" name="newb" role="form" enctype="multipart/form-data">
<a id="list" href="../board.do"><sup><-list</sup></a>

<div id="s-container">
	<h1 align="center">글 작성</h1>
<div id="s-header">
	<label>제목 : </label>
	<input type="text" name="nTitle" style="width:780px; height: 30px; font-size: 18pt;"  maxlength="33"> 
	<select name="bk" >
	<option value="n" <c:out value="${newb.bk eq null?'selected':''}"/>>-</option>
	<option value="0" <c:out value="${newb.bk eq '자유'?'selected':''}"/>>자유게시판</option>
	<c:choose>
	<c:when test="${clno  eq '0'}">
	<c:forEach var="no" begin="1" end="7" step="1">
<option value="${no }" <c:out value="${newb.bk eq '${no }반'?'selected':''}"/>>${no }반 게시판</option>
	</c:forEach>
	</c:when>
	<c:otherwise>
<option value="${clno }" <c:out value="${newb.bk eq '${clno }반'?'selected':''}"/>>${clno }반 게시판</option>
	</c:otherwise>
	</c:choose>
	</select>
</div>
<div id="s-file">
	<label for="img">이미지 첨부 : </label>
	<input type="file" name="img">
	<br>
	<label for="file">파일 첨부 : </label>
	<input type="file" name="file">
	<br>
	
</div>
	<div id="s-content" align="center">
	<label>내용</label><br>
	<textarea name="nContent" cols="95" rows="20" style="resize: none; font-size: 13pt;"></textarea>
	<input type="hidden" value="<%=writer %>" name="writer"/>
</div>
	<div align="center">
	<button type="reset">reset</button>
	<input type="button" value="등록" id="cbtn" style="font-size: 20px; font-weight: bold;">
</div>
</div>
</form>
</body>
<script>

$("#cbtn").click(function(){
	var msg=confirm("등록하시겠습니까?");
	if(msg==true){
		if($("select[name='bk']").val()=="n"){
			alert("게시판 종류를 선택해주세요.");
			$("select[name='bk']").focus();
			return;
		}else if($("input[name='nTitle']").val()==""){
			alert("제목이 입력되지 않았습니다.");
			$("input[name='nTitle']").focus();
			return;
		}else if($("textarea[name='nContent']").val()==""){
			alert("내용이 입력되지 않았습니다.");
			$("textarea[name='nContent']").focus();
			return;
		}else{
			$("form[name='newb']").submit();
	}}
});
</script>
</html>