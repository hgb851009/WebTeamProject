package action;

import javax.servlet.http.HttpServletRequest;

import persistence.UserDAO;

public class CheckIdEmailAction implements Action{

	private String path;
	
	
	public CheckIdEmailAction(String path) {
		super();
		this.path = path;
	}


	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		// TODO Auto-generated method stub
		
		String user_id = req.getParameter("userid");
		String user_email = req.getParameter("email");
		
		UserDAO dao = new UserDAO();
		
		int result = dao.checkIdEmail(user_id, user_email);
		
		if(result > 0)
			req.setAttribute("result", "false");
		else
			req.setAttribute("result", "true");
		
			
		return new ActionForward(path, false);
	}

}
