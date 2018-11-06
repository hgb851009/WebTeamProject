<%@page import="domain.UserVO"%>
<%@page import="persistence.b_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE>
<%	
String loginUser=String.valueOf(session.getAttribute("id")); 
String cur_page=request.getParameter("page");
%>
<html>
<head>
<c:out value="LOGIN NICKNAME : ${vo.user }"></c:out>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>Board :: 글 수정</title>
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
<form action="updateBoard.do" method="post" name="newb" role="form" enctype="multipart/form-data">

<div id="s-container">
	<h1 align="center">글 수정</h1>
<div id="s-header">
	<label>제목 : </label>
	<input type="text" name="title" value="${vo.title }" style="width:780px; height: 30px; font-size: 18pt;"  maxlength="33"> 
<c:choose>
<c:when test="${vo.bkind eq '0' }">
<label>자유 게시판</label>
</c:when>
<c:otherwise>
<label>${vo.bkind }반 게시판</label>
</c:otherwise>
</c:choose>

</div>
<div id="s-file">
	<label for="img">이미지 첨부 : </label>
	<c:if test="${!empty vo.img }">
		<c:set value="${vo.img }" var="img" />
			<%
			String img=(String)pageContext.getAttribute("img");
			int start=img.lastIndexOf("_");
			pageContext.setAttribute("img", img.substring(start+1));
		%>
	</c:if>
	<c:choose>
		<c:when test="${empty vo.img }">
    		<input type="file" name="img">
    	</c:when>
   		<c:when test="${!empty vo.img }">
         	<a href="fileDown/fileDown.jsp?fileName=${vo.img }&no=3">${img }</a>
   		</c:when>
	</c:choose>
	<br>
	<label for="file">파일 첨부 : </label>
		<c:if test="${!empty vo.file }">
		<c:set value="${vo.file }" var="file" />
			<%
			String file=(String)pageContext.getAttribute("file");
			int start=file.lastIndexOf("_");
			pageContext.setAttribute("file", file.substring(start+1));
		%>
	</c:if>
	<c:choose>
		<c:when test="${empty vo.file }">
    		<input type="file" name="file">
    	</c:when>
   		<c:when test="${!empty vo.file }">
         	<a href="fileDown/fileDown.jsp?fileName=${vo.file }&no=3">${file }</a>
   		</c:when>
	</c:choose>
	<br>
	
</div>
	<div id="s-content" align="center">
	<label>내용</label><br>
	<textarea name="content" cols="95" rows="20" style="resize: none; font-size: 13pt;">${vo.content }</textarea>
</div>
	<div align="center">
	<button type="reset">reset</button>
	<button type="submit" style="font-size: 15px; font-weight: bold;">submit</button>
</div>
</div>
<input type="hidden" value="${vo.bno}" name="bno">
<input type="hidden" value='<%=request.getParameter("page")%>' name="page">
<input type="hidden" value='${search.criteria }' name="criteria">
<input type="hidden" value='${search.keyword }' name="keyword">
</form>
</body>
</html>