<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%		String cur_page=request.getParameter("page");
		String loginUser=String.valueOf(session.getAttribute("id")); 
%>
<!DOCTYPE html>
<html>
<head>
<!--     <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/shop-homepage.css" rel="stylesheet"> -->
<meta charset="UTF-8">
<title>
<c:choose>
<c:when test="${vo.bkind eq '0'}">
자유 게시판 :: ${vo.title }
</c:when>
<c:otherwise>
${vo.bkind }반 게시판 :: ${vo.title }
</c:otherwise>
</c:choose>
</title>
<style>
	#s-container {
        width: 940px;
        margin: 0px auto;
        padding: 20px;
        border: 1px dotted silver;}
	#s-header {
		height: 205px;
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
    #s-file {
        margin-bottom: 10px;
        padding: 5px;
        border-bottom: 1px dashed gray; }
    a:link{
    	color:black;
    	text-decoration:none;}
    a:visited{
    	color:black;
    	text-decoration:none;}
</style>
</head>
<body>
<c:out value="LOGIN NICKNAME : ${loginuser.userNickName }"></c:out>
<c:set var="rNo" value="1"></c:set>
<div id="s-banner" align="right">
<div align="center"><br>
<input name="boardKind" type="radio" value="0"/>자유 게시판<br><br><br>
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
<div id="s-header" style="display:block">
<div id="boardTtile" style="display:block">
<h2 style="position: absolute;"><small style="font-size:3px;">${vo.bno }.</small> ${vo.title } <br></h2> <sup style="color:silver;">${vo.regDate } ${vo.regTime }</sup>
<sup style="font-weight: bold;"> ${vo.user }</sup>
<h5 align="right" > 
<div>
<img src="img/background.png" width="150px;" style="position: absolute;   top: 120px;
  right: 500px;">
<img src="${writer_body.itemImgPath}" width="150px;" style="position: absolute; top: 120px;
  right: 500px;">
<img src="${writer_hair.itemImgPath}" width="150px;" style="position: absolute; top: 120px;
  right: 500px;">
<img src="${writer_shirt.itemImgPath}" width="150px;" style="position: absolute; top: 120px;
  right: 500px;">

<br><br><br><br><br><br><br> </h5>

</div>
</div>
<div id="s-content">
<div id="s-file">
<c:if test="${!empty vo.file }">
	<c:set value="${vo.file }" var="file"/>
		<%
		String file=(String)pageContext.getAttribute("file");
		int start=file.lastIndexOf("_");
		pageContext.setAttribute("file", file.substring(start+1));	
		%>
	</c:if>
	<c:choose>
		<c:when test="${empty vo.file }">
		<sub>파일 없음</sub>
		</c:when>
	<c:when test="${!empty vo.file }">
<sub>파일</sub>&nbsp;&nbsp;<a href="fileDown/fileDown.jsp?fileName=${vo.file }&no=3">${file }</a>
	</c:when>
	</c:choose>
	</div>
<div id="boardContent" style="display:block">
	<c:if test="${!empty vo.img }">
		<br><br><br><img src="boardFile/${vo.img }" width="600px"/><br><br>
	</c:if>
	<pre style="font-size: 15px;">${vo.content }</pre>
</div></div>
<!-- 댓글 시작 -->
<div id="s-reply">
<h5>댓글<sub>&nbsp;${vo.replyCount }</sub></h5>
	<c:choose>
        <c:when test="${vo.replyCount>0 }">
        	<c:forEach var="reply" items="${rlist}">
            	<tr>
                <td><sub>${rNo } &nbsp;&nbsp;</sub></td>
         		<td>
<!-- 관리자 or 학생 -->
         		<c:if test="${reply.user eq 'root'}">
         		***
         		</c:if>
         		<sub>${reply.user } :</sub> ${reply.content }</td>
                <td><sub>&nbsp;&nbsp;&nbsp;&nbsp;${reply.regDate } ${reply.regTime }</sub></td>
                <c:if test="${reply.user eq loginuser.userNickName || loginuser.level eq '관리자' }">
                	<input type="button" id="replyDel" value="삭제" onclick="deleteOpen(${reply.rno })">
                	<script>
                    function deleteOpen(r){
                        var msg = confirm("댓글을 삭제하시겠습니까?");    
                        if(msg == true){
									del(r);
                        }else{
                            return false;}
                    	}
              
                	</script>
                </c:if>
                <c:set var="rNo" value="${rNo+1 }"/>
                <br>
            </tr>
            </c:forEach>
		</c:when>
	<c:otherwise>
				<td>♣첫 댓글의 주인공이 되어보세요♣</td><br>
	</c:otherwise>
	</c:choose>
<br><br>
<form method="post" role="form">
<!-- 댓글 쓰기 -->
<div align="center">
<sup>-------------------------------------------------------------------------------------------------------------------------------------------------</sup><br>
	<label> ${loginuser.userNickName } :</label>
		<input type="text" name="newReplyContent" style="width:700px; height: 40px;">
		<input type="button" id="newReply" value="등록">
</div>

	<input type="hidden" value="${vo.bno }" name="bno">
	<input type="hidden" value="<%=cur_page%>" name="page">
	<input type="hidden" value="${search.criteria }" name="criteria"> 
	<input type="hidden" value="${search.keyword }" name="keyword"> 
	<input type="hidden" value="${loginuser.userNickName }" name="userID">
	<input type="hidden" value="default" name="rno">
	<input type="hidden" value="${vo.bkind }" name="boardK"/>
</form>

</div>

</div>
<div align="center">
	<c:if test="${loginuser.userNickName eq vo.user || loginuser.level eq '관리자'}">
		<button id="modify" style="font-size: 5px;">글수정</button>
		<button id="delete" style="font-size: 5px;">글삭제</button>
	</c:if>
</div>
</body>
<script>
$('input:radio[name=boardKind]:input[value=${vo.bkind }]').attr('checked',true);
$("input[name='boardKind']").click(function(){
	var cknum=($("input:radio[name='boardKind']:checked").val());
	if(cknum==0){
		view0(cknum);
	}else{
		view(cknum);
	}
});
function view(k){
 	$("input[name='boardkind']").val(k);
 	var formObj=$("form[role='view']");
 	formObj.attr("action", "boardKindList.do");
 	formObj.submit();	
};
function view0(k){
	 $("input[name='boardkind']").val(k);
	 var formObj=$("form[role='view']");
	 formObj.attr("action", "board.do");
	 formObj.submit();	
};
function del(rn){
	$("input[name='rno']").val(rn);	
	var formObj=$("form[role='form']");
	formObj.attr("action", "boardDelR.do");
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
$("#newReply").click(function(){
	var newReplyContent=$("input[name='newReplyContent']").val();
	if(newReplyContent==''){
		alert("내용을 입력해주세요");
		$("input[id='newReplyContent']").focus();
		return false;
	}else{
		var msg = confirm("댓글을 등록하시겠습니까?");    
        if(msg == true){
    	var formObj=$("form[role='form']");
        formObj.attr("action", "boardNewR.do");
      	formObj.submit();
    }else{
        return false;}
    }
});
$("#modify").click(function(){
	var formObj=$("form[role='form']");
	formObj.attr("action","modifyBoard.do");
	formObj.submit();
});
$("#delete").click(function(){
	var formObj=$("form[role='form']");
	formObj.attr("action","delBoard.do");
	formObj.submit();
});
</script>
</html>
 