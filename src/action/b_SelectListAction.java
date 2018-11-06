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

public class b_SelectListAction implements Action {
	private String path;
	public b_SelectListAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		int bkind=Integer.parseInt(req.getParameter("boardkind"));
		
		b_DAO dao=new b_DAO();
		
		int page=1;
		if(req.getParameter("page")!=null)
			page=Integer.parseInt(req.getParameter("page"));
		int limit=10;
		int totalRows=dao.totalRows(bkind);
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
		
		ArrayList<b_bVO> list=dao.boardKindList(page, limit, bkind);

			req.setAttribute("list",list);
			req.setAttribute("pInfo",pInfo);	
			req.setAttribute("bkind", bkind);
			req.setAttribute("loginuser", loginuser);
		
		return new ActionForward(path,false);
	}

}
