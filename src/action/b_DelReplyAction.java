package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;


import persistence.ReplyDAO;
import persistence.b_DAO;
import domain.SearchVO;
import domain.b_bVO;
import domain.b_rVO;


public class b_DelReplyAction implements Action {
	private String path;
	public b_DelReplyAction(String path) {
	super();
	this.path = path;}
	
	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		int bno=Integer.parseInt(req.getParameter("bno"));
		int rno=Integer.parseInt(req.getParameter("rno"));
		int page=Integer.parseInt(req.getParameter("page"));
		String criteria = req.getParameter("criteria");
		String keyword = req.getParameter("keyword");
		SearchVO search=new SearchVO();
		search.setCriteria(criteria);
		search.setKeyword(keyword);
		
		ReplyDAO redao=new ReplyDAO();
		int result=redao.board_delReply(bno,rno);
		
		b_DAO dao=new b_DAO();
		b_bVO vo=dao.getRow(bno);
		ArrayList<b_rVO> rlist=redao.board_getReplyList(bno);
		
		if(result==0)
			path="error/error.jsp";
		else{
			if(search.getCriteria()==null) {
				req.setAttribute("vo", vo);
				req.setAttribute("rlist", rlist);
			}else {
				req.setAttribute("vo",vo);
				req.setAttribute("rlist", rlist);
				req.setAttribute("search",search);
		}
		path+="?page="+page;
		}
		
		return new ActionForward(path, false);
		
	}

}
