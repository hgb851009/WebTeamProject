<%@page import="persistence.sn_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%	String loginUser=String.valueOf(session.getAttribute("id")); %>	  	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SCHOOL NOTICE</title>
<style>
	#s-container {
        width: 940px;
        margin: 0px auto;
        padding: 20px;
        border: 1px dotted silver;}
	#s-header {
        padding: 10px;
        margin-bottom: 20px;
        border: 3px solid navy;}
	#s-content {
        width: 900px;
        padding: 20px;
        margin-bottom: 20px;
        float: center;
        border: 1px solid gray;}
	#s-bottom {
        clear: both;}
    a:link{
    	color:black;
    	text-decoration:none;}
    a:visited{
    	color:black;
    	text-decoration:none;}
    sub{
    	color:silver;}
    #s-banner {
 		position: fixed;
		width: 100px;
		height: 110px;
		top: 420px;
		right: 53%;
        padding: 20px;
		margin-right: -900px;}
</style>
</head>
<body>
<a href="index3.jsp"><img src="images/한글빛로고최종.png" height="120px" align="left"></a>
<c:set var="userName" value="<%=loginUser%>"></c:set>
<%-- <c:out value="LOGIN ID : ${userName }"></c:out> --%>
<div id="s-banner" align="right"><input type="button" id="work" style="height: 80px; width:180px; font-size: 30px;
border-color: navy; background-color: white; font-weight: bold; " 
onclick="location.href='workInfo.do'" value="채용 공고 >"></div>
<div id="s-container">
	<c:if test="${userName eq 'root'}">
		<a href="schoolNotice/sn_new.jsp" style="float: right; background: orange;">글쓰기</a><br><br>
	</c:if>
<div id="s-header">
	<h1 align="center">학교 소식</h1>
</div>
<div id="s-content">
    <table>
    <colgroup>
   <col width="10%" />
   <col width="53.5%" />
   <col width="30%" />
   <col width="10%" />
  </colgroup>
   <thead>
		<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>등록일자</th>
		<th>조회수</th>
		</tr>
	</thead>
<tbody>
	<c:forEach var="vo" items="${list}">
<tr>
<td style="font-size: 5px" align="center">${vo.bno } </td>
<td align="left">
<a href="readCountUp.do?bno=${vo.bno}&page=${pInfo.curPage}&criteria=${search.criteria}&keyword=${search.keyword}">${vo.title}&nbsp;<sub>(${vo.replyCount })</sub></a></td>
<td style="font-size: 5px" align="center">${vo.regDate } ${vo.regTime }</td>
<td style="font-size: 5px" align="center">${vo.readCount }</td>
</tr>
	</c:forEach>
</tbody>
	</table>
</div>
<!-- 목차와 검색 -->      
<div id="s-bottom" align="center">
<c:if test="${pInfo.curPage<=1 }">
	<a><</a>
</c:if>
<c:if test="${pInfo.curPage>1 }">
	<c:choose>
		<c:when test="${search.criteria==null }">
			<a href="select.do?page=${pInfo.page-1 }"><</a>
		</c:when>
	<c:otherwise>
<a href="search.do?page=${pInfo.page-1 }&criteria=${search.criteria }&keyword=${search.keyword }"><</a>
	</c:otherwise>
	</c:choose>
</c:if>
	<c:forEach begin="${pInfo.startPage}" end="${pInfo.endPage}" var="idx">
		<c:choose>
			<c:when test="${idx==pInfo.curPage }">
				<a>${idx }</a>
			</c:when>
			<c:otherwise>
			<c:choose>
				<c:when test="${search.criteria==null }">
					<a href="select.do?page=${idx }">${idx }</a>
				</c:when>
				<c:otherwise>
<a href="search.do?page=${idx }&criteria=${search.criteria }&keyword=${search.keyword }">${idx }</a>
				</c:otherwise>
			</c:choose>			  				
			</c:otherwise>
		</c:choose>
	</c:forEach>
<c:if test="${pInfo.curPage>=pInfo.totalPage}">
	<a>></a>
</c:if>
<c:if test="${pInfo.curPage<pInfo.totalPage}">
	<c:choose>
		<c:when test="${search.criteria==null }">
			<a href="select.do?page=${pInfo.page+1}">></a>
		</c:when>
			<c:otherwise>
<a href="search.do?page=${pInfo.curPage+1 }&criteria=${search.criteria }&keyword=${search.keyword }">></a>
			</c:otherwise>
	</c:choose>
</c:if>

<!-- 검색 ( title OR content ) -->
<form action="search.do" method="post" name='search' align="right">
	<select name="criteria">
<option value="title"<c:out value="${search.criteria eq 'title'?'selected':''}"/>>title</option>
<option value="content"<c:out value="${search.criteria eq 'content'?'selected':''}"/>>content</option>
	</select>
<input type="text" name="keyword" value="${search.keyword }">
<input type="button" value="검색" id="searchGo">
</form>
</div>
</div>
</body>
<script>
	$(function(){
		$("#searchGo").click(function(){
			if($("input[name='keyword']").val()==""){
				alert("검색어를 입력해주세요");
				$("input[name='keyword']").focus();
				return;
			}
			$("form[name='search']").submit();
		});
	});
</script>
</html>