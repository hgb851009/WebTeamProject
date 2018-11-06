package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import domain.SearchVO;
import domain.sn_ReplyVO;
import domain.sn_VO;
import persistence.ReplyDAO;
import persistence.sn_DAO;

public class sn_ViewAction implements Action {
	private String path;
	public sn_ViewAction(String path) {
	super();
	this.path = path;}
	
	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		int bno=Integer.parseInt(req.getParameter("bno"));
		int page=Integer.parseInt(req.getParameter("page"));
		
		SearchVO search=new SearchVO();
		search.setCriteria(req.getParameter("criteria"));
		search.setKeyword(req.getParameter("keyword"));
		
		sn_DAO dao=new sn_DAO();
		ReplyDAO redao=new ReplyDAO();
		sn_VO vo=dao.getRow(bno);
		ArrayList<sn_ReplyVO> rlist=redao.getReplyList(bno);
		
		if(vo!=null && search.getCriteria()==null) {
			req.setAttribute("vo", vo);
			req.setAttribute("rlist", rlist);
		}else {
			req.setAttribute("vo",vo);
			req.setAttribute("rlist", rlist);
			req.setAttribute("search",search);
		}
		path+="?page="+page;
		
		return new ActionForward(path, false);
	}
}
