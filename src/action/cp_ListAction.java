package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import domain.c_VO;
import domain.p_VO;
import persistence.cp_DAO;

public class cp_ListAction implements Action {
	private String path;
	public cp_ListAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		String user="";
		ArrayList<c_VO> clist=new ArrayList<>();
		ArrayList<p_VO> plist=new ArrayList<>();
		
		cp_DAO dao=new cp_DAO();
		HttpSession session=req.getSession(false);
		
		if(session.getAttribute("id") == null) {
			path = "error/error3.jsp";
		}
		else {
			if(session!=null) {
			user=(String) session.getAttribute("id");
			}
	
			if(user.equals("root")) {
				clist=dao.cList(user);
				plist=dao.pList();
			}else if(!user.equals("root")){
				clist=dao.cList();
				plist=dao.pList();
			}
			
			req.setAttribute("clist",clist);
			req.setAttribute("plist",plist);
		
		}
		return new ActionForward(path,false);
	}

}
