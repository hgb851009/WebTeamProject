package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import persistence.cp_DAO;

public class cp_EndAnswerAction implements Action {
	private String path;
	public cp_EndAnswerAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		int cno=Integer.parseInt(req.getParameter("newAno"));
		
		cp_DAO dao=new cp_DAO();
		int result=dao.endAnswer(cno);
		
		if(result==0)
			path="error/error.jsp";
		
		return new ActionForward(path, true);

	}
}
