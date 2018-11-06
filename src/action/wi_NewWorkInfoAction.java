package action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import domain.wi_VO;
import persistence.wi_DAO;

public class wi_NewWorkInfoAction implements Action {
	private String path;
	public wi_NewWorkInfoAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("utf-8");
		
		
		UploadFileUtils utils=new UploadFileUtils();
		HashMap<String, String> dataMap=utils.uploadFile(req,1);
		
		wi_VO vo=new wi_VO();
		vo.setTitle(dataMap.get("nTitle"));
		vo.setContent(dataMap.get("nContent"));
		if(dataMap.get("img")!=null)
			vo.setImg(dataMap.get("img"));
		if(dataMap.get("file1")!=null)
			vo.setFile1(dataMap.get("file1"));
		if(dataMap.get("file2")!=null)
			vo.setFile2(dataMap.get("file2"));
		
		wi_DAO dao=new wi_DAO();
		int result=dao.newWorkInfo(vo);
		
		if(result==0)
			path="error/error.jsp";
		
		return new ActionForward(path, true);
	}

}
