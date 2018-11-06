package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import persistence.cp_DAO;

public class cp_NewCounsellingAction implements Action {
	private String path;
	public cp_NewCounsellingAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		String user="";
		HttpSession session=req.getSession(false);
		
		if(session!=null)
		user=(String) session.getAttribute("id");
		
		String ckind=req.getParameter("ckind");
		String content=req.getParameter("newContent");
		

		cp_DAO dao=new cp_DAO();
		
		int result=dao.newCounselling(ckind,content,user);
		
		if(result==0)
			path="error/error.jsp";
		
		return new ActionForward(path, true);

	}
}
