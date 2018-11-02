<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String messageContent = null;
    if(session.getAttribute("messageContent") != null){
        messageContent = (String)session.getAttribute("messageContent");
    }

    String messageType = null;
    if(session.getAttribute("messageType") != null){
        messageType = (String)session.getAttribute("messageType");
    }
    if(messageContent != null){
        out.print("<div id=\"error\" style=\"display: none\">");
        out.print("<div id=\"onloadModal\" class=\"magnific-popup\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"mySmallModalLabel\" aria-hidden=\"true\">");
        out.print("<h4>"+messageType+"</h4>");
        out.print("<p>"+messageContent+"</p>");
        out.print("</div>");
        out.print("</div>");
        session.removeAttribute("messageContent");
        session.removeAttribute("messageType");
    }
%>




<%--<%--%>
<%--String msg = (String) request.getAttribute("error");--%>
<%--if (msg == null){--%>
<%--msg = "";--%>
<%--} else{--%>
<%--out.print("<div id=\"onloadModal\" class=\"magnific-popup\">");--%>
<%--out.print("<h4>로그인 오류</h4>");--%>
<%--out.print("<p>"+msg+"</p>");--%>
<%--//        out.print("<p>"+backPage+"</p>");--%>
<%--out.print("</div>");--%>
<%--}--%>
<%--%>--%>
<%--세션에러체크--%>