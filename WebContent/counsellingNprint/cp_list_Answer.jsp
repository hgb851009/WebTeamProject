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
</style>
</head>
<body>
<c:set var="user" value="<%=loginUser%>"></c:set>
<c:out value="LOGIN ID : ${user }"></c:out>

<div id="s-container">
<div id="s-title">
	<h3 align="center">답변하기</h3>
	    <table>
    <colgroup>
   <col width="15%" />
   <col width="20%" />
   <col width="25%" />
   <col width="25%" />
   <col width="25%" />
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
<form action="answer.do" method="post" role="form">
<input type="hidden" value="${c.cno }" name="cno"/>
<tr>
<td style="font-size: 10px" align="center">${c.cno } </td>
<td style="font-size: 15px" align="center">${c.ckind }</td>
<td style="font-size: 15px" align="center">${c.state }</td>
<td style="font-size: 15px" align="center">${c.user }</td>
<td style="font-size: 10px" align="center">${c.regDate } ${c.regTime }</td></tr>
<td colspan="5" align="center"><sup>-------------------------------------------------------------------------------------------------------------------------------------------------</sup>
<br><h5>신청 내용</h5><pre>${c.content }</pre><br><br></td>

</c:forEach>
</tbody>
</table>
</div>
<div id="s-content" align="center">

<h4>답변</h4><br>
<textarea name="answer" cols="100" rows="10" style="resize: none; font-size: 12pt;" maxlength="80"></textarea>
<br><button type="reset">reset</button>
<button type="submit" style="font-size: 15px; font-weight: bold;">submit</button>
</form>
</div>
</div>
</body>
</html>
 