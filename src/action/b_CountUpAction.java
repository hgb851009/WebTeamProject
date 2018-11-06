package action;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import persistence.b_DAO;

public class b_CountUpAction implements Action {
	private String path;
	public b_CountUpAction(String path) {
	super();
	this.path = path;}
	
	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		int bno=Integer.parseInt(req.getParameter("bno"));
		int page=Integer.parseInt(req.getParameter("page"));
		
		String criteria=req.getParameter("criteria");
		String keyword= URLEncoder.encode(req.getParameter("keyword"), "utf-8");
		
		b_DAO dao=new b_DAO();
		
		int result=dao.CountUp(bno);
		
		if(result==0)
			path="error/error.jsp";
		else {
			if(criteria.isEmpty())
				path+="?bno="+bno+"&page="+page;
			else

				path+="?bno="+bno+"&page="+page+"&criteria="+criteria+"&keyword="+keyword;
		}
		
		return new ActionForward(path,true);
	}

}
