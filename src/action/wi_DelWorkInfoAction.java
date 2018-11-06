package action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import persistence.wi_DAO;

public class wi_DelWorkInfoAction implements Action {
	private String path;
	public wi_DelWorkInfoAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		int bno=Integer.parseInt(req.getParameter("bno"));
		int page=Integer.parseInt(req.getParameter("page"));
		
		String criteria = req.getParameter("criteria");
		String keyword = req.getParameter("keyword");
		
		wi_DAO dao=new wi_DAO();
		int result=dao.delInfo(bno);
		
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
