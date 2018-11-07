<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%	
//session.setAttribute("id", "notroot");
String loginUser=String.valueOf(session.getAttribute("id")); 
%>	  	
<!DOCTYPE>
<html>
<head>

<c:set var="userName" value="<%=loginUser%>"></c:set>
<%-- <c:out value="LOGIN ID : ${userName }"></c:out> --%>
<c:if test="${userName ne 'root'}">
<script>
alert('잘못된 접근');
location.replace("../");
</script>
</c:if>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대우소식 :: 글 수정</title>
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
        clear: both;
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
<a href="index.jsp"><img src="images/avatar_logo.png" height="120px" align="left"></a>

<div id="s-container">
<form action="update.do" method="post" role="form" enctype="multipart/form-data">
	<h2 align="center">글 작성</h2>
<div id="s-header">
	<label>제목 : </label>
	<input type="text" name="title" value="${vo.title}" style="width:855px; height: 30px; font-size: 18pt;"  maxlength="33">
</div>
<div id="s-file">
	<label for="img1">이미지 첨부1 : </label>
		<c:if test="${!empty vo.img1 }">
			<c:set value="${vo.img1 }" var="img1" />
				<%
				String img1=(String)pageContext.getAttribute("img1");
				int start=img1.lastIndexOf("_");
				pageContext.setAttribute("img1", img1.substring(start+1));
				%>
		</c:if>
	<c:choose>
		<c:when test="${empty vo.img1 }">
    		<input type="file" name="img1">
    	</c:when>
   		<c:when test="${!empty vo.img1 }">
         	<a href="fileDown/fileDown.jsp?fileName=${vo.img1 }&no=0">${img1 }</a>
   		</c:when>
	</c:choose>
<br><label for="img2">이미지 첨부2 : </label>
	<c:if test="${!empty vo.img2 }">
		<c:set value="${vo.img2 }" var="img2" />
			<%
			String img2=(String)pageContext.getAttribute("img2");
			int start=img2.lastIndexOf("_");
			pageContext.setAttribute("img2", img2.substring(start+1));
			%>
		</c:if>
	<c:choose>
		<c:when test="${empty vo.img2 }">
    		<input type="file" name="img2">
    	</c:when>
		<c:when test="${!empty vo.img2 }">
			<a href="fileDown/fileDown.jsp?fileName=${vo.img2 }&no=0">${img2 }</a>
   		</c:when>
	</c:choose>
<br><label for="img3">이미지 첨부3 : </label>
	<c:if test="${!empty vo.img3 }">
		<c:set value="${vo.img3 }" var="img3" />
			<%
			String img3=(String)pageContext.getAttribute("img3");
			int start=img3.lastIndexOf("_");
			pageContext.setAttribute("img3", img3.substring(start+1));
			%>
		</c:if>
	<c:choose>
		<c:when test="${empty vo.img3 }">
    			<input type="file" name="img3">
			</c:when>
		<c:when test="${!empty vo.img3 }">
			<a href="fileDown/fileDown.jsp?fileName=${vo.img3 }&no=0">${img3}</a>
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
	<input type="hidden" value="${vo.bno}" name="bno">
	<input type="hidden" value='<%=request.getParameter("page")%>' name="page">
	<input type="hidden" value='${search.criteria }' name="criteria">
	<input type="hidden" value='${search.keyword }' name="keyword">
</form>
</div>
</body>
</html>