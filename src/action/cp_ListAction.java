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
		
		if(session!=null) {
		user=(String) session.getAttribute("id");
		}else{
			path="error/error.jsp";
		}
		if(!user.equals("root")) {
			clist=dao.cList(user);
			plist=dao.pList();
		}else if(user.equals("root")){
			clist=dao.cList();
			plist=dao.pList();
		}
		
		if(!plist.isEmpty()&&!plist.isEmpty()) {
		
			req.setAttribute("clist",clist);
			req.setAttribute("plist",plist);
			
		}else if(!clist.isEmpty()) {
			req.setAttribute("plist", plist);
		}else {
			path="error/error.jsp";
		}
		
		return new ActionForward(path,false);
	}

}
