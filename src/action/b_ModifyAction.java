package action;

import javax.servlet.http.HttpServletRequest;

import domain.SearchVO;
import domain.b_bVO;
import persistence.b_DAO;


public class b_ModifyAction implements Action {
	private String path;
	public b_ModifyAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		int bno=Integer.parseInt(req.getParameter("bno"));
		int page=Integer.parseInt(req.getParameter("page"));
		String criteria = req.getParameter("criteria");
		String keyword = req.getParameter("keyword");
		SearchVO search=new SearchVO();
		search.setCriteria(criteria);
		search.setKeyword(keyword);
		
		b_bVO vo=new b_DAO().getRow(bno);
		
		if(vo!=null && search.getCriteria()==null) {
			req.setAttribute("vo", vo);
		}else {
			req.setAttribute("search", search);
			req.setAttribute("vo", vo);
		}
		path+="?page="+page;
		
		return new ActionForward(path,false);
		}

}
