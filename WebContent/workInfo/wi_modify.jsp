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
<c:set var="userName" value="<%=loginUser%>"></c:set>
<c:out value="LOGIN ID : ${userName }"></c:out>
<c:if test="${userName ne 'root'}">
<script>
alert('잘못된 접근');
location.replace("../");
</script>
</c:if>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채용 공고 :: 글 수정</title>
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
<form action="InfoUpdate.do" method="post" role="form" enctype="multipart/form-data">
<div id="s-container">
	<h1 align="center">글 작성</h1>
<div id="s-header">
	<label>제목 : </label>
	<input type="text" name="title" value="${vo.title}" style="width:855px; height: 30px; font-size: 18pt;"  maxlength="33">
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
         	<a href="fileDown/fileDown.jsp?fileName=${vo.img }&no=1">${img }</a>
   		</c:when>
	</c:choose>
	<br>
	<label for="file1">파일 1 첨부 : </label>
	<c:if test="${!empty vo.file1 }">
		<c:set value="${vo.file1 }" var="file1" />
			<%
			String file1=(String)pageContext.getAttribute("file1");
			int start=file1.lastIndexOf("_");
			pageContext.setAttribute("file1", file1.substring(start+1));
		%>
	</c:if>
	<c:choose>
		<c:when test="${empty vo.file1 }">
    		<input type="file" name="file1">
    	</c:when>
   		<c:when test="${!empty vo.file1 }">
         	<a href="fileDown/fileDown.jsp?fileName=${vo.file1 }&no=1">${file1 }</a>
   		</c:when>
	</c:choose>
	<br>
	<label for="file2">파일 2 첨부 : </label>
	<c:if test="${!empty vo.file2 }">
		<c:set value="${vo.file2 }" var="file2" />
			<%
			String file2=(String)pageContext.getAttribute("file2");
			int start=file2.lastIndexOf("_");
			pageContext.setAttribute("file2", file2.substring(start+1));
		%>
	</c:if>
	<c:choose>
		<c:when test="${empty vo.file2 }">
    		<input type="file" name="file2">
    	</c:when>
   		<c:when test="${!empty vo.file2 }">
         	<a href="fileDown/fileDown.jsp?fileName=${vo.file2 }&no=1">${file2 }</a>
   		</c:when>
	</c:choose>	
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