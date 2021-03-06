package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import domain.PageVO;
import domain.SearchVO;
import domain.b_bVO;
import persistence.b_DAO;

public class b_SearchAction implements Action {
	private String path;
	public b_SearchAction(String path) {
	super();
	this.path = path;}
	
	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		String criteria = req.getParameter("criteria");
		String keyword= req.getParameter("keyword");
		int bkind=Integer.parseInt(req.getParameter("bkind"));
		b_DAO dao = new b_DAO();
		
		int page=1;
		if(req.getParameter("page")!=null)
			page=Integer.parseInt(req.getParameter("page"));
		int limit=10;
		int totalRows=dao.totalRows(criteria,keyword,bkind);
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
		
		SearchVO searchVO= new SearchVO();
		searchVO.setCriteria(criteria);
		searchVO.setKeyword(keyword);
		
		ArrayList<b_bVO> search= dao.getSearchList(page, limit, criteria, keyword, bkind);
		
		if(bkind==0) {
			path="classBoard/b_list.jsp";
		}else {
			path="classBoard/b_selectList.jsp";
		}
		
		if(!search.isEmpty()) {
			req.setAttribute("list", search);
			req.setAttribute("pInfo", pInfo);
			req.setAttribute("search", searchVO);
			req.setAttribute("bkind", bkind);	
		}
		
		return new ActionForward(path, false);
	}

}
