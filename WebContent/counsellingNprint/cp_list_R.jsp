<%@page import="persistence.sn_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%	String loginUser=String.valueOf(session.getAttribute("id")); %>	  	
<!DOCTYPE html>
<html>
<head>
<a href="index3.jsp"><img src="images/한글빛로고최종.png" height="120px" align="left"></a>
<meta charset="UTF-8">
<title>DAEWOO</title>
<style>
	#s-container {
        width: 940px;
        margin: 0px auto;
        padding: 20px;
        border: 1px dotted silver;}
	#s-banner {
 		position: fixed;
		width: 300px;
		height: 400px;
		top: 480px;
		right: 50%;
        padding: 20px;
		margin-right: -900px;
		border: 0.5px dotted silver;}
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

<div id="newP" align="center" style="display:none" >
<div id="s-banner" align="center">
<h4>파일 올리기</h4><br>
<form action="pNew.do" method="post" name='pNew' align="center" enctype="multipart/form-data">
	<h6>제목: <input type="text" style="width:250px;" name="pname" ></h6>
	<h6>이미지:&nbsp;<input type="file" name="img"></h6>
	<h6>&nbsp;&nbsp;&nbsp;파일: <input type="file" name="file"></h6><br><br>
	<button type="reset">reset</button>
	<button type="submit" id="newPbtn" style="font-size: 15px; font-weight: bold;">submit</button>
</form>
</div></div>


<div id="s-container">
<div id="s-title">
	<h3 align="center">대기중인 신청 목록</h3>
	    <table>
    <colgroup>
   <col width="10%" />
   <col width="20%" />
   <col width="20%" />
   <col width="20%" />
   <col width="25%" />
   <col width="40%" />
  </colgroup>
   <thead style="font-size:small;">
		<tr>
		<th>신청 번호</th>
		<th>신청 종류</th>
		<th>현재 상태</th>
		<th>신청 학생</th>
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
<td style="font-size: 15px" align="center">${c.user }</td>
<td style="font-size: 10px" align="center">${c.regDate } ${c.regTime }</td>
<td><a href="javascript:cDetailView(${c.cno });" style="font-size: 12px; background-color: orange;">자세히</a></td>

</td>
<td><input type="button" id="cDel" value="삭제" onclick="deleteOpen(${c.cno })"/></td></tr>
<script>
	function deleteOpen(c){
		 var msg = confirm("삭제하시겠습니까?");    
         if(msg == true){
				javascript:del(c);
 		}else{
     			return false;}
         }
</script>
<div id="cD${c.cno }" align="center" style="display:none; border: 0.5px dotted silver;">
<p style="font-size: 13px" align="center"><strong>[ ${c.cno } ${c.ckind } ${c.regDate } ${c.regTime } ] ${c.user }</strong></p>
<p style="font-size: 15px" align="center"><b>신청 내용</b><br><br><pre> ${c.content }</pre>
<br><br><sup>-------------------------------------------------------------------------------------------------------------------------------------------------</sup><br><br>
<b>답변 </b><br>
<p style="font-size: 15px" align="center"><pre>${c.answer }</pre><br>
<form role='cAnswer' method="post" ><br>
<br>
<input type="button" id="endAbtn" value="처리 완료" onclick="endAOpen(${c.cno })"  />
<input type="button" id="cAbtn" value="답변 작성" onclick="newAOpen(${c.cno })"  />
<input type="hidden" value="cno" name="newAno"/>
<br><br>
</form>
	</c:if>
	</c:forEach>
</tbody>
</table>
</div>
<script>
 	function newAOpen(c){
				newA(c);
         } 
	function endAOpen(c){
		 var msg = confirm("완료 처리를 하시겠습니까?");    
        if(msg == true){
				javascript:endA(c);
		}else{
    			return false;}
        }
</script>
<div id="s-content">
<input id="end" name="newend" type="radio" value="end"/>완료 내역&nbsp;&nbsp;&nbsp;&nbsp;
<input id="end" name="newend" type="radio" value="print"/>출력<br><br>

<div id="endC" align="center" style="display:none">

	    <table>
    <colgroup>
   <col width="10%" />
   <col width="20%" />
   <col width="20%" />
   <col width="20%" />
   <col width="25%" />
   <col width="40%" />
  </colgroup>	
   <thead style="font-size:small;">
		<tr>
		<th>신청 번호</th>
		<th>신청 종류</th>
		<th>현재 상태</th>
		<th>신청 학생</th>
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
<td style="font-size: 15px" align="center">${c.user }</td>
<td style="font-size: 10px" align="center">${c.regDate } ${c.regTime }</td>
<td><a href="javascript:endDetailView(${c.cno });" style="font-size: 12px; background-color: orange;">자세히</a></td>
</tr>
</div>
<tr>
<div id="endD${c.cno }" align="center" style="display:none; border: 0.5px dotted silver;">
<p style="font-size: 13px" align="center"><strong>[ ${c.cno } ${c.ckind } ${c.regDate } ${c.regTime } ]</strong></p>
<p style="font-size: 15px" align="center"><b>신청 내용</b><br><br><pre> ${c.content }</pre>
<br><br><sup>-------------------------------------------------------------------------------------------------------------------------------------------------</sup><br><br>
<b>답변 내용</b><br>
<p style="font-size: 15px" align="center"><pre>${c.answer }</pre></p><br>
</tr>
</c:if>
</c:forEach>
</tbody>
</table>
</div>
<c:set var="i" value="0"/>
<div id="printC" align="center" style="display:none; padding: 20px;">
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
<br><p style="font-size: 5px;">${p.pno } ${p.pname } </p><input type="button" id="cDel" value="삭제" onclick="deleteP(${p.pno })"></td>

<c:set var="i" value="1"/>
	</c:when>
	<c:otherwise>
<td>
<a href="fileDown/fileDown.jsp?fileName=${p.file }&no=2"><img width="300px" height="450px" src="print/${p.img }"/></a>
<br><p style="font-size: 5px;">${p.pno } ${p.pname } </p><input type="button" id="cDel" value="삭제" onclick="deleteP(${p.pno })"></td></tr>
<c:set var="i" value="0"/>
	</c:otherwise>
	</c:choose>
	</c:forEach>
	</div>
<form role="plistForm" method="post" style="font-size: 18px; font-weight: bold;" align="center">
<input type="hidden" value="pno" name="DelpNo"/>

</form>

<script>
	function deleteP(p){
		 var msg = confirm("삭제하시겠습니까?");    
         if(msg == true){
				javascript:delp(p);
 		}else{
     			return false;}
         }
</script>
</tbody>


</div>
<div id="s-bottom" align="center">
<!-- 검색 ( title OR content ) -->
<%-- <form action="search.do" method="post" name='search' align="right">
	<select name="criteria">
<option value="title"<c:out value="${search.criteria eq 'title'?'selected':''}"/>>title</option>
<option value="content"<c:out value="${search.criteria eq 'content'?'selected':''}"/>>content</option>
	</select>
<input type="text" name="keyword" value="${search.keyword }">
<input type="button" value="검색" id="searchGo">
</form>
</div> --%>
</div>
</body>
<script>
function del(c){
		$("input[name='DelcNo']").val(c);
	 	var formObj=$("form[role='clistForm']");
	formObj.attr("action", "cDel_R.do");
	formObj.submit();	
};
function delp(c){
	$("input[name='DelpNo']").val(c);
 	var formObj=$("form[role='plistForm']");
formObj.attr("action", "pDel.do");
formObj.submit();	
};
function newA(c){
	$("input[name='newAno']").val(c);
 	var formObj=$("form[role='cAnswer']");
formObj.attr("action", "cAnswer.do");
formObj.submit();	
};
function endA(c){
	$("input[name='newAno']").val(c);
 	var formObj=$("form[role='cAnswer']");
formObj.attr("action", "cEnd.do");
formObj.submit();	
};
var before=0;
var before2=0;
	$("input[name='newend']").click(function(){
		$('#newC').css('display',($(this).val()==='new')?'block':'none');
	});
	$("input[name='newend']").click(function(){
		$('#endC').css('display',($(this).val()==='end')?'block':'none');
	});
	$("input[name='newend']").click(function(){
		$('#printC').css('display',($(this).val()==='print')?'block':'none');
		$('#newP').css('display',($(this).val()==='print')?'block':'none');
	});
 	function endDetailView(cno){
		var con=document.getElementById("endD"+cno);
		if(before==0){
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
		if(before2==0){
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
					return false;
				}if($("textarea[name='newContent']").val()==""){
					alert("내용이 입력되지 않았습니다.");
					$("textarea[name='newContent']").focus();
					return false;
				}
					$("form[name='cNew']").submit();
			}
		});
		$("#newPbtn").click(function(){
			var msg=confirm("등록하시겠습니까?");
			if(msg==true){
				if($("input[name='pname']").val()==""){
					alert("파일 제목을 입력해주세요.");
					$("select[name='filename']").focus();
					return false;
				}
				if($("input[name='img']").val()==""){
					alert("이미지가 첨부되지 않았습니다.");
					$("textarea[name='img']").focus();
					return false;
				}
				if($("input[name='file']").val()==""){
					alert("파일이 첨부되지 않았습니다.");
					$("textarea[name='newContent']").focus();
					return false;
				}
					$("form[name='pNew']").submit();
			}
		});

	});
</script>
</html>
 