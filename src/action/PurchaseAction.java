package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import domain.AvatarVO;
import domain.ItemVO;
import domain.PageVO;
import domain.UserVO;
import persistence.ItemDAO;
import persistence.UserDAO;

public class PurchaseAction implements Action {
	private String path;

	public PurchaseAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		String userId = req.getParameter("id");
		int bid = Integer.parseInt(req.getParameter("body"));
		int hid = Integer.parseInt(req.getParameter("hair"));
		int sid = Integer.parseInt(req.getParameter("shirt"));
		int result = 0;

		UserDAO udao = new UserDAO();
		ItemDAO idao = new ItemDAO();
		UserVO uvo = udao.selelctUser(userId);
		AvatarVO avo = udao.selelctAvatar(userId);

		if (avo.getAvatarBody() == bid && avo.getAvatarHair() == hid && avo.getAvatarShirt() == sid)
			result = 2;
		else {
			int point = uvo.getUserPoint();
			int[] price = idao.getPrice(bid, hid, sid);

			if (avo.getAvatarBody() != bid)	 point -= price[0];
			if (avo.getAvatarHair() != hid)	 point -= price[1];
			if (avo.getAvatarShirt() != sid) point -= price[2];
			
			result = udao.purchaseItem(userId, point);
			result = udao.updateItem(userId, bid, hid, sid);
		}
		/*
		 * else path = "error/error.jsp";
		 */
		
		req.setAttribute("result", result);
		return new ActionForward(path, false);
	}

}
