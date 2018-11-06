package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import domain.SearchVO;
import domain.b_bVO;
import domain.b_rVO;
import persistence.ReplyDAO;
import persistence.b_DAO;


public class b_NewReplyAction implements Action {
	private String path;
	public b_NewReplyAction(String path) {
	super();
	this.path = path;}
	
	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		int bno=Integer.parseInt(req.getParameter("bno"));
		String userID=req.getParameter("userID");
		String newReplyContent=req.getParameter("newReplyContent");
		int page=Integer.parseInt(req.getParameter("page"));
		String criteria = req.getParameter("criteria");
		String keyword = req.getParameter("keyword");
		
		SearchVO search=new SearchVO();
		search.setCriteria(criteria);
		search.setKeyword(keyword);
		
		ReplyDAO redao=new ReplyDAO();
		int result=redao.board_newReply(bno,userID,newReplyContent);
		
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
