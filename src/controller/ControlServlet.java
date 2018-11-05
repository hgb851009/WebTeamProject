package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionFactory;
import action.ActionForward;


@WebServlet("*.do")
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		
		req.setCharacterEncoding("utf-8");
				
				
		ActionFactory baf = ActionFactory.getInstance();
		Action action = baf.action(cmd);
		
		ActionForward af = null;
		
		try {
			af = action.execute(req);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(af.isRedirect())	res.sendRedirect(af.getPath());
		else
		{
			RequestDispatcher rd=  req.getRequestDispatcher(af.getPath());
			rd.forward(req, res);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
