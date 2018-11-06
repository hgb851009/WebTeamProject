package action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import persistence.sn_DAO;


public class sn_DelNoticeAction implements Action {
	private String path;
	public sn_DelNoticeAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		int bno=Integer.parseInt(req.getParameter("bno"));
		int page=Integer.parseInt(req.getParameter("page"));
		
		String criteria = req.getParameter("criteria");
		String keyword = req.getParameter("keyword");
		
		sn_DAO dao=new sn_DAO();
		int result=dao.delNotice(bno);
		
		if(result==0)
			path="error/error.jsp";
		else {
			if(criteria.equals(""))
				path+="?page="+page;
		else				
			path="search.do?page="+page+"&criteria="+criteria+"&keyword="+keyword;
		}
	
		return new ActionForward(path, true);
	}

}
