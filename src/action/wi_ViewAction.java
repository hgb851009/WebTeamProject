package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import domain.SearchVO;
import domain.wi_VO;
import persistence.wi_DAO;

public class wi_ViewAction implements Action {
	private String path;
	public wi_ViewAction(String path) {
	super();
	this.path = path;}
	
	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		int bno=Integer.parseInt(req.getParameter("bno"));
		int page=Integer.parseInt(req.getParameter("page"));
		
		SearchVO search=new SearchVO();
		search.setCriteria(req.getParameter("criteria"));
		search.setKeyword(req.getParameter("keyword"));
		
		wi_DAO dao=new wi_DAO();
		wi_VO vo=dao.getRow(bno);
		
		if(vo!=null && search.getCriteria()==null) {
			req.setAttribute("vo", vo);
		}else {
			req.setAttribute("vo",vo);
			req.setAttribute("search",search);
		}
		path+="?page="+page;
		
		return new ActionForward(path, false);
	}
}
