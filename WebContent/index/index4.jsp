<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//session.setAttribute("id", "ab12");
	//session.setAttribute("id", "test");
	session.setAttribute("id", "root");
	  
%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>기로</title>
</head>
<body>
	  <a href="select.do" role="button">SchoolNotice</a>
	  <br>
	  <a href="workInfo.do" role="button">WorkInfo</a>
	  <br>
	  <%
		String loginuser="";
		loginuser=(String) session.getAttribute("id");
	  if(loginuser!="root"){
	  %>
	  	  <a href="cNp.do" role="button">Counselling&Print</a>
	  <%}else{ %>
		  <a href="cNpR.do" role="button">Counselling&Print /ROOT</a>
	  <%}%>
	  <br>
	  <a href="board.do" role="button">Board</a>
	  <br>
</body>
</html>