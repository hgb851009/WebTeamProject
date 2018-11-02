package com.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "userInfoModifyServlet", urlPatterns = "/userInfoModify")
public class userInfoModifyServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userID = request.getParameter("userID");
		String userNickName = request.getParameter("userNickName");
		String userPwd = request.getParameter("userPwd");
		String userLevel = request.getParameter("userLevel");
//		System.out.println(userID);
//		System.out.println(userNickName);
//		System.out.println(userPwd);
//		System.out.println(userLevel);
		response.getWriter().write(new userDAO().userInfoModify(userID,userNickName,userPwd,userLevel)+"");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
