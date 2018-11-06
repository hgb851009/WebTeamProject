package action;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import persistence.sn_DAO;


public class sn_CountUpAction implements Action {
	private String path;
	public sn_CountUpAction(String path) {
	super();
	this.path = path;}
	
	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		int bno=Integer.parseInt(req.getParameter("bno"));
		int page=Integer.parseInt(req.getParameter("page"));
		
		String criteria=req.getParameter("criteria");
		String keyword= URLEncoder.encode(req.getParameter("keyword"), "utf-8");
		
		sn_DAO dao=new sn_DAO();
		
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
