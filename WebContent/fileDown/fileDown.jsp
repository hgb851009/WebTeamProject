<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String fileName = request.getParameter("fileName");
	int no=Integer.parseInt(request.getParameter("no"));
	
	FileInputStream in=null;
	if(no==0){ //schoolnotice
		String filePath = request.getSession().getServletContext().getRealPath("/sn/"+fileName);
		in = new FileInputStream(filePath);
	}else if(no==1){ //workinfo
		String filePath = request.getSession().getServletContext().getRealPath("/work/"+fileName);
		in = new FileInputStream(filePath);
	}else if(no==2){ //counsellingNprint
		String filePath = request.getSession().getServletContext().getRealPath("/print/"+fileName);
		in = new FileInputStream(filePath);
	}else if(no==3){ //classboard
		String filePath = request.getSession().getServletContext().getRealPath("/boardFile/"+fileName);
		in = new FileInputStream(filePath);
	}

	//response헤더 설정
	response.setContentType("application/octect-stream");
	String agent = request.getHeader("User-Agent");

	boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1)
													 || (agent.indexOf("Edge") > -1);
	//익스 or 크롬
	if (ieBrowser) 
	{
		fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
	} 
	else 
	{
		fileName = new String(fileName.getBytes("UTF-8"), "iso-8859-1");
	}
	
	//UUID 제거
	int start=fileName.lastIndexOf("_");
	String oriName=fileName.substring(start+1);

	//응답헤더 설정
	response.setHeader("Content-Disposition", "attachment;filename=" + oriName);
	out.clear();
	out = pageContext.pushBody();

	BufferedOutputStream buf = new BufferedOutputStream(response.getOutputStream());

	int numRead;
	byte b[] = new byte[4096];
	while ((numRead = in.read(b, 0, b.length)) != -1) 
	{
		buf.write(b, 0, numRead);
	}
	buf.flush();
	buf.close();
	in.close();
%>
