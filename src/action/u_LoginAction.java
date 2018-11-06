package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import persistence.UserDAO;

public class u_LoginAction implements Action {
	private String path;
	public u_LoginAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		HttpSession session=req.getSession(false);
		String userid=req.getParameter("id");
		String pwd=req.getParameter("pwd");

		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(userid, pwd);
		
		if(result==0)
			path="error/error2.jsp";
		else
			session.setAttribute("id", userid);
		
		return new ActionForward(path,true);
	}

}
