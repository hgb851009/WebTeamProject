package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import action.Action;
import action.ActionForward;
import domain.PageVO;
import domain.sn_VO;
import persistence.sn_DAO;

public class sn_ListAction implements Action {
	private String path;
	public sn_ListAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		sn_DAO dao=new sn_DAO();
		
		int page=1;
		if(req.getParameter("page")!=null)
			page=Integer.parseInt(req.getParameter("page"));
		int limit=10;
		int totalRows=dao.totalRows();
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
		
		ArrayList<sn_VO> list=dao.getList(page, limit);
		if(!list.isEmpty()) {
			req.setAttribute("list",list);
			req.setAttribute("pInfo",pInfo);			
		}
		
		return new ActionForward(path,false);
	}

}
