package action;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import domain.p_VO;
import persistence.cp_DAO;


public class cp_NewPrintAction implements Action {
	private String path;
	public cp_NewPrintAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		UploadFileUtils utils=new UploadFileUtils();
		HashMap<String, String> dataMap=utils.uploadFile(req,2);
		
		p_VO vo=new p_VO();
		
		vo.setPname(dataMap.get("pname"));
		vo.setImg(dataMap.get("img"));
		vo.setFile(dataMap.get("file"));

		cp_DAO dao=new cp_DAO();
		
		int result=dao.newPrint(vo);
		
		if(result==0)
			path="error/error.jsp";
		
		return new ActionForward(path, true);

	}
}
