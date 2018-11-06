<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE>
<%
	String cur_page=request.getParameter("page"); 
	String loginUser=String.valueOf(session.getAttribute("id"));
%>
<html>
<head>
<meta charset="UTF-8">
<title>대우 소식 :: ${vo.title }</title>
<style>
	#s-container {
        width: 940px;
        margin: 0px auto;
        padding: 20px;
        border: 1px dotted silver;}
	#s-header {
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid gray;}
	#s-content {
		overflow: auto;
        width: 900px;
        padding: 20px;
        margin-bottom: 20px;
        float: center;
        border: 1px solid gray;}
	#s-reply {
        clear: both;
        padding: 20px;
        border: 1px solid gray;}
</style>
</head>
<form method="post" role="form">
 <!-- 로그인정보 -->
<c:set var="userName" value="<%=loginUser%>"></c:set>
<c:out value="LOGIN ID : ${userName }"></c:out>
<!-- 관리자 메뉴  / 전체 목록으로 돌아가기-->
	<c:if test="${userName eq 'root'}">
		<button id="modify" style="font-size: 5px;">글수정</button>
		<button id="delete" style="font-size: 5px;">글삭제</button>
	</c:if>
<c:set var="rNo" value="1"></c:set><br>
<button id="list" align="left">전체 목록</button>

<div id="s-container">
<!-- 글 정보 시작 -->
<div id="s-header">
	<h1 align="center">${vo.title }</h1>
	<h5 align="right">${vo.regDate } ${vo.regTime }</h5>
</div>
	
<div id="s-content">
	<c:if test="${!empty vo.img1 }">
		<img src="sn/${vo.img1 }" width="600px">
	</c:if>
	<c:if test="${!empty vo.img2 }">
		<img src="sn/${vo.img2 }" width="600px">
	</c:if>
	<c:if test="${!empty vo.img3 }">
		<img src="sn/${vo.img3 }" width="600px">
	</c:if>
		<pre style="font-size: 15px;">${vo.content }</pre>
</div>

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
         		<c:if test="${reply.replyUser eq 'root'}">
         		***
         		</c:if>
         		<sub>${reply.replyUser } :</sub> ${reply.replyContent }</td>
                <td><sub>&nbsp;&nbsp;&nbsp;&nbsp;${reply.reply_Date } ${reply.reply_Time }</sub></td>
                <c:if test="${reply.replyUser eq userName }">
                	<input type="button" id="replyDel" value="삭제" onclick="deleteOpen(${reply.replyNo })">
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
<!-- 댓글 쓰기 -->
<div align="center">
<sup>-------------------------------------------------------------------------------------------------------------------------------------------------</sup><br>
	<label> ${userName } :</label>
		<input type="text" name="newReplyContent" style="width:700px; height: 40px;">
		<input type="button" id="newReply" value="등록">
</div>
	<input type="hidden" value="${vo.bno }" name="bno">
	<input type="hidden" value="<%=cur_page%>" name="page">
	<input type="hidden" value="${search.criteria }" name="criteria"> 
	<input type="hidden" value="${search.keyword }" name="keyword"> 
	<input type="hidden" value="<%=session.getAttribute("id")%>" name="userID">
	<input type="hidden" value="default" name="rno">
</form>
</div>
</div>
<script>
	function del(rn){
   		$("input[name='rno']").val(rn);
   	 	var formObj=$("form[role='form']");
		formObj.attr("action", "delReply.do");
		formObj.submit();	
	};
  	$(function(){
  		var formObj = $("form[role='form']");
  		$("#list").click(function(){
			var criteria=$("input[name='criteria']").val();
			var keyword=$("input[name='keyword']").val();	
			console.log(criteria);
			if(criteria!='' && keyword!=''){
				formObj.attr("action","search.do");				
			}else{
				formObj.attr("action","select.do");	
			}
			formObj.submit();	
  		});
  		$("#modify").click(function(){
  			formObj.attr("action","modify.do");
			formObj.submit();
  		});
  		$("#delete").click(function(){
  			formObj.attr("action","delNotice.do");
			formObj.submit();
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
                	formObj.attr("action", "newReply.do");
          			formObj.submit();
                }else{
                    return false;}
                }
  		});
  	});
</script>  
</html>
