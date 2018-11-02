<%@page import="domain.UserVO"%>
<%@ page import="persistence.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="userVO" scope="request" class="domain.UserVO"></jsp:useBean>
<jsp:setProperty name="userVO" property="*"></jsp:setProperty>

<%
	//액션클래스 부분
	RequestDispatcher rd = request.getRequestDispatcher("complete.jsp");

	if (userVO.getUserID() == null || userVO.getUserID().equals("") || userVO.getUserPwd() == null || userVO.getUserPwd().equals("") || userVO.getUserPwd2() == null || userVO.getUserPwd2().equals("") || userVO.getUserName() == null || userVO.getUserName().equals("") || userVO.getUserNickName() == null || userVO.getUserNickName().equals("")) {
		request.getSession().setAttribute("messageType", "오류 메세지");
		request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요.");
		response.sendRedirect("register.jsp");
		return;
	} else if (!userVO.getUserPwd().equals(userVO.getUserPwd2())) {
		request.getSession().setAttribute("messageType", "오류 메세지");
		request.getSession().setAttribute("messageContent", "비밀번호가 서로 일치하지 않습니다.");
		response.sendRedirect("register.jsp");
		return;
	}
%>
<%
	UserDAO result = new UserDAO().register(userID, userName, userNickName, userPwd);
	//씨발 왜안되지???
	System.out.println(userVO.getUserID());
	System.out.println(userVO.getUserName());
	System.out.println(userVO.getUserNickName());
	System.out.println(userVO.getUserPwd());
	if (result !=null) {
		request.getSession().setAttribute("messageType", "성공 메세지");
		request.getSession().setAttribute("messageContent", "회원가입에 성공했습니다.");
		session = request.getSession(false);
		session.setAttribute("id", userVO.getUserID());
		rd.forward(request, response);
	} else {
		request.getSession().setAttribute("messageType", "오류 메세지");
		request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
		response.sendRedirect("register.jsp");
		return;
	}
%>


<!DOCTYPE html>
<html>
<head>
	<title>Title</title>
</head>
<body>
${userVO.userID}<br>
${userVO.userName}<br>
${userVO.userNickName}<br>
${userVO.userPwd}<br>
${userVO.userPwd2}
</body>
</html>
