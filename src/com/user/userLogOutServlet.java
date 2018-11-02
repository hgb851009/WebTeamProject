package com.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "userLogOutServlet", urlPatterns = "/logout")
public class userLogOutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);

        if(session != null && session.getAttribute("userID") != null){
            session.invalidate();
            out.print("로그아웃");
        }
        Cookie[] ck = request.getCookies();
        String location = "";
        if(ck != null) {
            for(int i = 0; i < ck.length; ++i) {
                String name = ck[i].getName();
                if(name.equals("location")) {
                    location = ck[i].getValue();
                    break;
                }
            }
        }else{
            location = "index.jsp";
        }

        response.sendRedirect(location);
    }
}
