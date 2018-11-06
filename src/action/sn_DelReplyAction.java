package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import domain.SearchVO;
import domain.sn_ReplyVO;
import domain.sn_VO;
import persistence.ReplyDAO;
import persistence.sn_DAO;


public class sn_DelReplyAction implements Action {
	private String path;
	public sn_DelReplyAction(String path) {
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
		int maxNo=redao.replyCount(bno);
		int result=redao.delReply(bno,rno);
		
		sn_DAO dao=new sn_DAO();
		sn_VO vo=dao.getRow(bno);
		ArrayList<sn_ReplyVO> rlist=redao.getReplyList(bno);
		
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
