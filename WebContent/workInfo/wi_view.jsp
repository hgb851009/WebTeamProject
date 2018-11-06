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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채용 공고 :: ${vo.title }</title>
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
		overflow: auto;
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
    	color:blue;
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
<form method="post" role="form">
 <!-- 로그인정보 -->
<c:set var="userName" value="<%=loginUser%>"></c:set>
<c:out value="LOGIN ID : ${userName }"></c:out>

<c:set var="rNo" value="1"></c:set><br>


<div id="s-container">
<div id="s-header">
	<h1 align="center">${vo.title }</h1>
	<h5 align="right">${vo.regDate } ${vo.regTime }</h5>
</div>
<div id="s-file">
<label for="filename" class="col-sm-2 col-form-label">파일&nbsp;&nbsp;</label>
<!-- 파일명이 uuid 값이 붙어 있는 상태이므로 순수 파일명만 보여주기 --> 
<c:if test="${!empty vo.file1 }">
	<c:set value="${vo.file1 }" var="file1"/>
		<%
		String file1=(String)pageContext.getAttribute("file1");
		int start=file1.lastIndexOf("_");
		pageContext.setAttribute("file1", file1.substring(start+1));	
		%>
	</c:if>
	<c:choose>
		<c:when test="${empty vo.file1 }">
		</c:when>
	<c:when test="${!empty vo.file1 }">
		<a href="fileDown/fileDown.jsp?fileName=${vo.file1 }&no=1">${file1 }</a>
	</c:when>
	</c:choose>
<c:if test="${!empty vo.file2 }">
	<c:set value="${vo.file2 }" var="file2"/>
		<%
		String file2=(String)pageContext.getAttribute("file2");
		int start=file2.lastIndexOf("_");
		pageContext.setAttribute("file2", file2.substring(start+1));	
		%>
	</c:if>
	<c:choose>
		<c:when test="${empty vo.file2 }">
		</c:when>
	<c:when test="${!empty vo.file2 }">
		<a href="fileDown/fileDown.jsp?fileName=${vo.file2 }&no=1"> &nbsp;&nbsp;&nbsp;${file2 }</a>
	</c:when>
	</c:choose>	
</div>
<div id="s-content">
	<c:if test="${!empty vo.img }">
		<img src="work/${vo.img }" width="500px">
	</c:if>
		<pre style="font-size: 15px;">${vo.content }</pre>
</div>
	<input type="hidden" value="${vo.bno }" name="bno">
	<input type="hidden" value='<%=cur_page%>' name="page">
	<input type="hidden" value='${search.criteria }' name="criteria"> 
	<input type="hidden" value='${search.keyword }' name="keyword"> 
	<input type="hidden" value='<%=session.getAttribute("id")%>' name="userID">
<div align="center">
<button id="list">전체 목록</button>
</div>
<div align="right">
<!-- 관리자 메뉴  / 전체 목록으로 돌아가기-->
	<c:if test="${userName eq 'root'}">
		<button id="modify" style="font-size: 5px;">글수정</button>
		<button id="delete" style="font-size: 5px;">글삭제</button>
	</c:if>
	
</div>
</div>
</form>
<script>
  	$(function(){
  		var formObj = $("form[role='form']");
  		$("#list").click(function(){
			var criteria=$("input[name='criteria']").val();
			var keyword=$("input[name='keyword']").val();	
			console.log(criteria);
			if(criteria!='' && keyword!=''){
				formObj.attr("action","workInfoSearch.do");				
			}else{
				formObj.attr("action","workInfo.do");	
			}
			formObj.submit();	
  		});
  		$("#modify").click(function(){
  			formObj.attr("action","modifyWorkInfo.do");
			formObj.submit();
  		});
  		$("#delete").click(function(){
  			formObj.attr("action","delWorkInfo.do");
			formObj.submit();
  		});
  	});
</script>  
</body>
</html>