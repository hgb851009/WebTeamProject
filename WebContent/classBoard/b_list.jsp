<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%	//String loginUser=String.valueOf(session.getAttribute("id")); %>	  	
<!DOCTYPE html>
<html>
<head>
<a href="index3.jsp"><img src="images/한글빛로고최종.png" height="120px" align="left"></a>
<meta charset="UTF-8">
<title>Board</title>
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
    #s-banner {
 		position: fixed;
		width: 130px;
		height: 450px;
		top: 200px;
		left: 50%;
        padding: 20px;
		margin-left: -900px;
		border: 0.5px dotted silver;}
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
</style>
</head>
<body>
<c:out value="LOGIN NICKNAME : ${loginuser.userNickName }"></c:out>
<div id="s-banner" align="right">
<div align="center"><br>
<input name="boardKind" type="radio" value="0" checked="checked">자유 게시판<br><br><br>
<input name="boardKind" type="radio" value="1"/>1반<br><br>
<input name="boardKind" type="radio" value="2"/>2반<br><br>
<input name="boardKind" type="radio" value="3"/>3반<br><br>
<input name="boardKind" type="radio" value="4"/>4반<br><br>
<input name="boardKind" type="radio" value="5"/>5반<br><br>
<input name="boardKind" type="radio" value="6"/>6반<br><br>
<input name="boardKind" type="radio" value="7"/>7반<br><br>
</div></div>
<form role="view" method="post">
<input type="hidden" value="bk" name="boardkind"/>
</form>
<div id="s-container">
<c:choose>
<c:when test="${loginuser.level eq '관리자' }">
<a href="classBoard/b_new.jsp?class=0&writer=${loginuser.userNickName }" style="float: right; background: orange;">글쓰기</a><br><br>
</c:when>
<c:otherwise>
<a href="classBoard/b_new.jsp?class=${loginuser.classNo }&writer=${loginuser.userNickName }" style="float: right; background: orange;">글쓰기</a><br><br>
</c:otherwise>
</c:choose>
<div id="s-header" style="display:block">
<div id="board0" style="display:block">
<h1 align="center">자유 게시판</h1>
</div>

</div>

<div id="s-content" align="center">
<div id="boards" style="display:block">
    <table>
    <colgroup>
   <col width="8%" />
   <col width="40%" />
   <col width="25.5%" />
   <col width="20%" />
   <col width="8%" />
  </colgroup>
   <thead>
		<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>등록일자</th>
		<th>조회수</th>
		</tr>
	</thead>
<tbody>

	<c:forEach var="vo" items="${list }">
	<c:if test="${vo.bkind eq 0 }">
<script>
javascript:b(${vo.bkind});
</script>
<tr>
<td style="font-size: 5px" align="center">${vo.bno } </td>
<td align="left">
<a href="b_readCountUp.do?bno=${vo.bno}&page=${pInfo.curPage}&criteria=${search.criteria}&keyword=${search.keyword}">${vo.title}</a> <sub>(${vo.replyCount })</sub></td>
<td style="font-size: 5px" align="center">${vo.user }</td>
<td style="font-size: 5px" align="center">${vo.regDate } ${vo.regTime }</td>
<td style="font-size: 5px" align="center">${vo.readCount }</td>
</tr>

	</c:if>
	</c:forEach>
</tbody>
	</table>
</div></div>
<!-- 목차와 검색 -->      
<div id="s-bottom" align="center">
<c:if test="${pInfo.curPage<=1 }">
	<a><</a>
</c:if>
<c:if test="${pInfo.curPage>1 }">
	<c:choose>
		<c:when test="${search.criteria==null }">
			<a href="board.do?page=${pInfo.page-1 }"><</a>
		</c:when>
	<c:otherwise>
<a href="boardSearch.do?page=${pInfo.page-1 }&criteria=${search.criteria }&keyword=${search.keyword }"><</a>
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
					<a href="board.do?page=${idx }">${idx }</a>
				</c:when>
				<c:otherwise>
<a href="boardSearch.do?page=${idx }&criteria=${search.criteria }&keyword=${search.keyword }">${idx }</a>
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
			<a href="board.do?page=${pInfo.page+1}">></a>
		</c:when>
			<c:otherwise>
<a href="boardSearch.do?page=${pInfo.page+1 }&criteria=${search.criteria }&keyword=${search.keyword }">></a>
			</c:otherwise>
	</c:choose>
</c:if>

<!-- 검색 ( title OR content ) -->
<form action="boardSearch.do" method="post" name='search' align="right">
	<select name="criteria">
<option value="title"<c:out value="${search.criteria eq 'title'?'selected':''}"/>>title</option>
<option value="content"<c:out value="${search.criteria eq 'content'?'selected':''}"/>>content</option>
	</select>
<input type="text" name="keyword" value="${search.keyword }">
<input type="button" value="검색" id="searchGo">
<input type="hidden" value="${bkind }" name="bkind"/>
</form>
</div>
</div>
</body>
<script>
function b(k){
 	$("input[name='bkind']").val(k);
};
$("input[name='boardKind']").click(function(){
	var cknum=($("input:radio[name='boardKind']:checked").val());
	if(cknum=='0'){
		return false;
	}
	view(cknum);
});
function view(k){
 	$("input[name='boardkind']").val(k);
 	var formObj=$("form[role='view']");
 	formObj.attr("action", "boardKindList.do");
 	formObj.submit();	
 };
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
 