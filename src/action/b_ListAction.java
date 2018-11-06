package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import domain.PageVO;
import domain.UserVO;
import domain.b_bVO;
import persistence.b_DAO;

public class b_ListAction implements Action {
	private String path;
	public b_ListAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		persistence.b_DAO dao=new b_DAO();
		
		int page=1;
		if(req.getParameter("page")!=null)
			page=Integer.parseInt(req.getParameter("page"));
		int limit=10;
		int totalRows=dao.totalRows(0);
		int totalPage=(int)((double)totalRows/limit+0.95);
		int startPage=(((int)((double)page/10+0.9))-1)*10+1;
		int endPage=startPage+10-1;
		if(endPage>totalPage) 
			endPage=totalPage;
		PageVO pInfo=new PageVO();
		pInfo.setEndPage(endPage);
		pInfo.setCurPage(page);
		pInfo.setStartPage(startPage);
		pInfo.setTotalPage(totalPage);
		
		HttpSession session=req.getSession(false);
		String userid=(String) session.getAttribute("id");
		UserVO loginuser=dao.getLoginUserInfo(userid);
		
		ArrayList<b_bVO> list=dao.boardKindList(page, limit, 0);
			req.setAttribute("list",list);
			req.setAttribute("pInfo",pInfo);
			req.setAttribute("bkind", 0);
			req.setAttribute("loginuser", loginuser);
		
		return new ActionForward(path,false);
	}

}
