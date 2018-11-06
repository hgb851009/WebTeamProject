package action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import domain.sn_VO;
import persistence.sn_DAO;


public class sn_NewNoticeAction implements Action {
	private String path;
	public sn_NewNoticeAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		UploadFileUtils utils=new UploadFileUtils();
		HashMap<String, String> dataMap=utils.uploadFile(req,0);
		
		sn_VO vo=new sn_VO();
		vo.setTitle(dataMap.get("nTitle"));
		vo.setContent(dataMap.get("nContent"));
		if(dataMap.get("img1")!=null)
			vo.setImg1(dataMap.get("img1"));
		if(dataMap.get("img2")!=null)
			vo.setImg2(dataMap.get("img2"));
		if(dataMap.get("img3")!=null)
			vo.setImg3(dataMap.get("img3"));
		
		sn_DAO dao=new sn_DAO();
		int result=dao.newNotice(vo);
		
		if(result==0)
			path="error/error.jsp";
		
		return new ActionForward(path, true);
	}

}
