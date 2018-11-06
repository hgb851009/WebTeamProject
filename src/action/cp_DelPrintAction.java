package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import persistence.cp_DAO;


public class cp_DelPrintAction implements Action {
	private String path;
	public cp_DelPrintAction(String path) {
	super();
	this.path = path;}
	
	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {

		int pno=Integer.parseInt(req.getParameter("DelpNo"));
		
		cp_DAO dao=new cp_DAO();
		int result=dao.delPrint(pno);
		
		if(result==0)
			path="error/error.jsp";
		
		return new ActionForward(path, true);
	}

}
