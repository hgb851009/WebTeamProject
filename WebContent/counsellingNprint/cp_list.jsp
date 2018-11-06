<%@page import="persistence.sn_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%	String loginUser=String.valueOf(session.getAttribute("id")); %>	  	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DAEWOO</title>
<style>
	#s-container {
        width: 940px;
        margin: 0px auto;
        padding: 20px;
        border: 1px dotted silver;}
	#s-title {
        margin-bottom: 5px;
        padding-bottom: 5px;
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
</style>
</head>
<body>
<c:set var="user" value="<%=loginUser%>"></c:set>
<c:out value="LOGIN ID : ${user }"></c:out>
<div id="s-container">
<%-- 	<c:if test="${userName eq 'root'}">
		<a href="schoolNotice/sn_new.jsp" style="float: right; background: orange;">글쓰기</a><br><br>
	</c:if> --%>
<div id="s-title">
	<h3 align="center">${user } 님의 현재 신청 목록</h3>
	    <table align="center">
    <colgroup>
   <col width="15%" />
   <col width="25%" />
   <col width="25%" />
   <col width="30%" />
   <col width="25%" />
  </colgroup>
   <thead style="font-size:small;">
		<tr>
		<th>신청 번호</th>
		<th>신청 종류</th>
		<th>현재 상태</th>
		<th>신청 날짜</th>
		</tr>
	</thead>
<tbody>
	<c:forEach var="c" items="${clist }">
	<c:if test="${c.state != '처리 완료' }">
	
<form role="clistForm" method="post" style="font-size: 18px; font-weight: bold;" align="center">
<input type="hidden" value="cno" name="DelcNo"/>
</form><tr>
<td style="font-size: 10px" align="center">${c.cno } </td>
<td style="font-size: 15px" align="center">${c.ckind }</td>
<td style="font-size: 15px" align="center">${c.state }</td>
<td style="font-size: 10px" align="center">${c.regDate } ${c.regTime }</td>
<td><a href="javascript:cDetailView(${c.cno });" style="font-size: 12px; background-color: orange;">자세히</a></td>

</td>
<td><input type="button" id="cDel" value="취소" onclick="deleteOpen(${c.cno })"/></td></tr>
<script>
	function deleteOpen(c){
		 var msg = confirm("신청을 취소하시겠습니까?");    
         if(msg == true){
				javascript:del(c);
 		}else{
     			return false;}
         }
</script>
<div  id="cD${c.cno }" align="center" style="display:none; border: 0.5px dotted silver;">
<p style="font-size: 13px" align="center"><strong>[ ${c.cno } ${c.ckind } ${c.regDate } ${c.regTime } ]</strong></p>
<p style="font-size: 15px" align="center"><b>신청 내용</b><br><br><pre> ${c.content }</pre>
<br><br><br>
	</c:if>
	</c:forEach>
</tbody>
</table>
</div>
<div id="s-content">
<input name="newend" type="radio" value="new">신청하기&nbsp;&nbsp;&nbsp;&nbsp;
<input name="newend" type="radio" value="end"/>완료 내역&nbsp;&nbsp;&nbsp;&nbsp;
<input name="newend" type="radio" value="print"/>출력<br>
</form>
<div id="newC" align="center" style="display:none">
<form action="cNew.do" method="post" name='cNew'>
<h6 align="center">신청 종류 : 
<select name="ckind">
<option value="n" <c:out value="${cNew.ckind eq null?'selected':''}"/>>-</option>
<option value="상담" <c:out value="${cNew.ckind eq '상담'?'selected':''}"/>>상 담</option>
<option value="휴가" <c:out value="${cNew.ckind eq '휴가'?'selected':''}"/>>휴 가</option>
<option value="조퇴" <c:out value="${cNew.ckind eq '조퇴'?'selected':''}"/>>조 퇴</option>
<option value="외출" <c:out value="${cNew.ckind eq '외출'?'selected':''}"/>>외 출</option>
<option value="그외" <c:out value="${cNew.ckind eq '그외'?'selected':''}"/>>그 외</option>
</select></h6>
<textarea name="newContent" cols="100" rows="10" style="resize: none; font-size: 12pt;" maxlength="80"></textarea>
<br><br><input type="button" value="신청" id="cbtn" style="font-size: 20px; font-weight: bold;">
</form>
</div>
<div id="endC" align="center" style="display:none">
	    <table>
    <colgroup>
   <col width="15%" />
   <col width="25%" />
   <col width="25%" />
   <col width="30%" />
   <col width="25%" />
  </colgroup>	
   <thead style="font-size:small;">
		<tr>
		<th>신청 번호</th>
		<th>신청 종류</th>
		<th>현재 상태</th>
		<th>신청 날짜</th>
		</tr>
	</thead>
<tbody>
<c:forEach var="c" items="${clist }">
<c:if test="${c.state == '처리 완료' }">
<tr>
<td style="font-size: 10px" align="center">${c.cno } </td>
<td style="font-size: 15px" align="center">${c.ckind }</td>
<td style="font-size: 15px" align="center">${c.state }</td>
<td style="font-size: 10px" align="center">${c.regDate } ${c.regTime }</td>
<td><a href="javascript:endDetailView(${c.cno });" style="font-size: 12px; background-color: orange;">자세히</a></td>
</tr>
</div>
<tr>
<div  id="endD${c.cno }" align="center" style="display:none; border: 0.5px dotted silver;">
<p style="font-size: 13px" align="center"><strong>[ ${c.cno } ${c.ckind } ${c.regDate } ${c.regTime } ]</strong></p>
<p style="font-size: 15px" align="center"><b>신청 내용</b><br><br><pre> ${c.content }</pre>
<br><br><sup>---------------------------------------------------------------------------------------------------------------------------------------------------------</sup><br><br>
<b>답변 내용</b><br>
<p style="font-size: 15px" align="center"><pre>${c.answer }</pre></p><br>
</tr>
</c:if>
</c:forEach>
</tbody>
</table>
</div>
<c:set var="i" value="0"/>
<div id="printC" align="center" style="display:none">
	    <table>
    <colgroup>
   <col width="40%" />
   <col width="40%" />
  </colgroup>
<tbody align="center">


	<c:forEach var="p" items="${plist }">
	<c:choose>
	<c:when test="${i eq 0 }">
<tr><td>
<a href="fileDown/fileDown.jsp?fileName=${p.file }&no=2"><img width="300px" height="450px" src="print/${p.img }"/></a>
<br>${p.pno } ${p.pname } <br><br><br><br><br><br></td>
<c:set var="i" value="1"/>
	
	</c:when>
	<c:otherwise>
<td>
<a href="fileDown/fileDown.jsp?fileName=${p.file }&no=2"><img width="300px" height="450px" src="print/${p.img }"/></a>
<br>${p.pno } ${p.pname } <br><br><br><br><br><br></td></tr>
<c:set var="i" value="0"/>
	</c:otherwise>
	</c:choose>
	</c:forEach>
</tbody>
</div>

</div>

</body>
<script>
function del(c){
		$("input[name='DelcNo']").val(c);
	 	var formObj=$("form[role='clistForm']");
	formObj.attr("action", "cDel.do");
	formObj.submit();	
};
var before;
var before2;
	$("input[name='newend']").click(function(){
		$('#newC').css('display',($(this).val()==='new')?'block':'none');
	});
	$("input[name='newend']").click(function(){
		$('#endC').css('display',($(this).val()==='end')?'block':'none');
	});
	$("input[name='newend']").click(function(){
		$('#printC').css('display',($(this).val()==='print')?'block':'none');
	});
 	function endDetailView(cno){
		var con=document.getElementById("endD"+cno);
		if(before==null){
			if(con.style.display=='none'){
				con.style.display='block';
				before=con;
			}else
				con.style.display='none';
		}else{
				if(con.style.display=='none'){
					before.style.display='none';
					con.style.display='block';
					before=con;
				}else
					con.style.display='none';
		}
	} 
 	function cDetailView(cno){
		var con=document.getElementById("cD"+cno);
		if(before2==null){
			if(con.style.display=='none'){
				con.style.display='block';
				before2=con;
			}else
				con.style.display='none';
		}else{
				if(con.style.display=='none'){
					before2.style.display='none';
					con.style.display='block';
					before2=con;
				}else
					con.style.display='none';
		}
	} 
	$(function(){
		$("#searchGo").click(function(){
			if($("input[name='keyword']").val()==""){
				alert("검색어를 입력해주세요");
				$("input[name='keyword']").focus();
				return;
			}
			$("form[name='search']").submit();
		});
		$("#cbtn").click(function(){
			var msg=confirm("신청을 완료하시겠습니까?");
			if(msg==true){
				if($("select[name='ckind']").val()=="n"){
					alert("종류가 선택되지 않았습니다.");
					$("select[name='ckind']").focus();
					return;
				}else if($("textarea[name='newContent']").val()==""){
					alert("내용이 입력되지 않았습니다.");
					$("textarea[name='newContent']").focus();
					return;
				}else{
					$("form[name='cNew']").submit();
			}}
		});
	});
</script>
</html>
 