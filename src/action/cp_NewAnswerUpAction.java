package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import domain.c_VO;
import domain.p_VO;
import persistence.cp_DAO;

public class cp_NewAnswerUpAction implements Action {
	private String path;
	public cp_NewAnswerUpAction(String path) {
	super();
	this.path = path;}
	
	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		int cno=Integer.parseInt(req.getParameter("cno"));
		String answer=req.getParameter("answer");
		
		cp_DAO dao=new cp_DAO();
		int result=dao.newAnswer(cno, answer);

		ArrayList<c_VO> clist=new ArrayList<>();
		ArrayList<p_VO> plist=new ArrayList<>();
		
		clist=dao.cList();
		plist=dao.pList();
		
		if(result==0)
			path="error/error.jsp";
		else{
			if(!clist.isEmpty() && !plist.isEmpty()) {
				req.setAttribute("clist",clist);
				req.setAttribute("plist",plist);
			}else{
				if(!plist.isEmpty())
					req.setAttribute("plist", plist);
				else
					path="error/error.jsp";
			}
		}
		return new ActionForward(path,false);
	}

}
