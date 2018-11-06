package action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import domain.b_bVO;
import persistence.b_DAO;



public class b_NewBoardAction implements Action {
	private String path;
	public b_NewBoardAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		UploadFileUtils utils=new UploadFileUtils();
		HashMap<String, String> dataMap=utils.uploadFile(req,3);
		
		b_bVO vo=new b_bVO();
		
		vo.setTitle(dataMap.get("nTitle"));
		vo.setContent(dataMap.get("nContent"));
		vo.setBkind(Integer.parseInt(dataMap.get("bk")));
		vo.setUser(dataMap.get("writer"));
		
		if(dataMap.get("img")!=null)
			vo.setImg(dataMap.get("img"));
		if(dataMap.get("file")!=null)
			vo.setFile(dataMap.get("file"));
		
		b_DAO dao=new b_DAO();
		int result=dao.newBoard(vo);
		
		if(result==0)
			path="error/error.jsp";
		
		return new ActionForward(path, true);
	}

}
