package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import domain.AvatarVO;
import domain.ItemVO;
import domain.PageVO;
import domain.UserVO;
import persistence.ItemDAO;
import persistence.UserDAO;

public class ShopAction implements Action {
	private String path;

	public ShopAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		// String userId = req.getParameter("user_id");
		HttpSession session = req.getSession(false);
		if (session.getAttribute("id") != null) {
			String userId = String.valueOf(session.getAttribute("id"));

			UserDAO udao = new UserDAO();
			ItemDAO idao = new ItemDAO();

			UserVO uvo = udao.selelctUser(userId);
			AvatarVO avo = udao.selelctAvatar(userId);
			PageVO pvo = idao.getPage();
			ArrayList<ItemVO> item_list = idao.itemSelectPage(pvo.getCurPage(), 6);

			ItemVO body = idao.selectItem(avo.getAvatarBody());
			ItemVO hair = idao.selectItem(avo.getAvatarHair());
			ItemVO shirt = idao.selectItem(avo.getAvatarShirt());

			if (item_list != null && uvo != null && avo != null) {
				req.setAttribute("item_list", item_list);
				req.setAttribute("user", uvo);
				req.setAttribute("user_body", body);
				req.setAttribute("user_hair", hair);
				req.setAttribute("user_shirt", shirt);
				req.setAttribute("page", pvo);
			}
		}

		else
			path = "error/error3.jsp";

		return new ActionForward(path, false);
	}

}
