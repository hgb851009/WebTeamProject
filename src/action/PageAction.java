package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import domain.AvatarVO;
import domain.ItemVO;
import domain.PageVO;
import domain.UserVO;
import persistence.ItemDAO;
import persistence.UserDAO;

public class PageAction implements Action {
	private String path;

	public PageAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		int page = 0;
		if (req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));

			ItemDAO idao = new ItemDAO();
			ArrayList<ItemVO> item_list = idao.itemSelectPage(page, 6);

			if (item_list != null)
				req.setAttribute("item_list", item_list);
			
			else 
				path = "error/error.jsp";
		}

		else
			path = "error/error.jsp";

		return new ActionForward(path, false);
	}

}
