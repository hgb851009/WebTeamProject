package action;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import domain.c_VO;
import persistence.cp_DAO;

public class cp_NewAnswerAction implements Action {
	private String path;
	public cp_NewAnswerAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		int cno=Integer.parseInt(req.getParameter("newAno"));

		ArrayList<c_VO> clist=new ArrayList<>();
		cp_DAO dao=new cp_DAO();
		clist=dao.cOneList(cno);
		
		if(!clist.isEmpty())
			req.setAttribute("clist", clist);
		else
			path="error/error.jsp";
	
	return new ActionForward(path,false);

	}
}
