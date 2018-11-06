package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import persistence.UserDAO;

public class u_LogoutAction implements Action {
	private String path;
	public u_LogoutAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		HttpSession session=req.getSession(false);
		session.removeAttribute("id");
		
		return new ActionForward(path,true);
	}

}
