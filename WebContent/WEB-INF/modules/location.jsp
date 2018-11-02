<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //현재주소 쿠키생성
    String uri = request.getRequestURI();
    Cookie location = new Cookie("location", uri);
    location.setPath("/");
    location.setMaxAge(-1);
    response.addCookie(location);
%>