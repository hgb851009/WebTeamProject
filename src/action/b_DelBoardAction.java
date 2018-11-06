package action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import persistence.b_DAO;




public class b_DelBoardAction implements Action {
	private String path;
	public b_DelBoardAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		int bno=Integer.parseInt(req.getParameter("bno"));
		int page=Integer.parseInt(req.getParameter("page"));
		
		String criteria = req.getParameter("criteria");
		String keyword = req.getParameter("keyword");
		
		b_DAO dao=new b_DAO();
		int result=dao.delBoard(bno);
		
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
