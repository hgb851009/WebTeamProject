package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import domain.AvatarVO;
import domain.ItemVO;
import domain.SearchVO;
import domain.UserVO;
import domain.b_bVO;
import domain.b_rVO;
import persistence.ItemDAO;
import persistence.ReplyDAO;
import persistence.UserDAO;
import persistence.b_DAO;


public class b_ViewAction implements Action {
	private String path;
	public b_ViewAction(String path) {
	super();
	this.path = path;}
	
	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		int bno=Integer.parseInt(req.getParameter("bno"));
		int page=Integer.parseInt(req.getParameter("page"));
		
		SearchVO search=new SearchVO();
		search.setCriteria(req.getParameter("criteria"));
		search.setKeyword(req.getParameter("keyword"));
		
		b_DAO dao=new b_DAO();
		ReplyDAO redao=new ReplyDAO();
		b_bVO vo=dao.getRow(bno);
		
		String writerid=dao.getWriterInfo(vo.getUser());
		ArrayList<b_rVO> rlist=redao.board_getReplyList(bno);
		
		UserDAO udao=new UserDAO();
		ItemDAO idao=new ItemDAO();
		UserVO uvo= udao.selelctUser(writerid);
		AvatarVO avo= udao.selelctAvatar(writerid);
		ItemVO body = idao.selectItem(avo.getAvatarBody());
		ItemVO hair = idao.selectItem(avo.getAvatarHair());
		ItemVO shirt = idao.selectItem(avo.getAvatarShirt());
		
		
		HttpSession session=req.getSession(false);
		String userid=(String) session.getAttribute("id");
		UserVO loginuser=dao.getLoginUserInfo(userid);
		
		if(vo!=null && search.getCriteria()==null) {
			req.setAttribute("vo", vo);
			req.setAttribute("rlist", rlist);
			req.setAttribute("loginuser", loginuser);
			req.setAttribute("writer_body", body);
			req.setAttribute("writer_hair", hair);
			req.setAttribute("writer_shirt", shirt);
			
		}else {
			req.setAttribute("vo",vo);
			req.setAttribute("rlist", rlist);
			req.setAttribute("search",search);
			req.setAttribute("loginuser", loginuser);
			req.setAttribute("writer_body", body);
			req.setAttribute("writer_hair", hair);
			req.setAttribute("writer_shirt", shirt);
		}
		path+="?page="+page;
		
		return new ActionForward(path, false);
	}
}
