package com.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "userRegisterServlet", urlPatterns = "/userRegister")
public class userRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String userID  = request.getParameter("userID");
        String userPwd = request.getParameter("userPwd");
        String userPwd2 = request.getParameter("userPwd2");
        String userName = request.getParameter("userName");
        String userNickName = request.getParameter("userNickName");
        
        //가입창 내용입력받을때
        if(userID == null || userID.equals("")|| userPwd == null || userPwd.equals("")|| userPwd2 == null ||userPwd2.equals("")|| userName == null ||userName.equals("") || userNickName == null || userNickName.equals("")){
            request.getSession().setAttribute("messageType", "오류 메세지");
            request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요.");
            response.sendRedirect("register.jsp");
            return;
        }
        //비번
        if(!userPwd.equals(userPwd2)){
            request.getSession().setAttribute("messageType", "오류 메세지");
            request.getSession().setAttribute("messageContent", "비밀번호가 서로 일치하지 않습니다.");
            response.sendRedirect("register.jsp");
            return;
        }


        //입력한 내용을 담도록 함
	    userVO result = new userDAO().register(userID, userName, userNickName, userPwd2)
        if (result == null) {
            request.getSession().setAttribute("messageType", "성공 메세지");
            request.getSession().setAttribute("messageContent", "회원가입에 성공했습니다.");
            HttpSession session = request.getSession(false);
            session.setAttribute("id", userID);
            response.sendRedirect("index.jsp");
        } else {
            request.getSession().setAttribute("messageType", "오류 메세지");
            request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
            response.sendRedirect("register.jsp");
            return;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
