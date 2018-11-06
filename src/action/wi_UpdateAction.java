package action;

import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import domain.wi_VO;
import persistence.wi_DAO;

public class wi_UpdateAction implements Action {
	private String path;
	public wi_UpdateAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		UploadFileUtils utils=new UploadFileUtils();
		HashMap<String, String> dataMap=utils.uploadFile(req,1);
		
		int bno=Integer.parseInt(dataMap.get("bno"));
		String title=dataMap.get("title");
		String content=dataMap.get("content");
		String criteria=dataMap.get("criteria");
		String keyword=URLEncoder.encode(dataMap.get("keyword"),"utf-8");
		
		int page=Integer.parseInt(dataMap.get("page"));

		wi_VO vo=new wi_VO();
		vo.setBno(bno);
		vo.setTitle(title);
		vo.setContent(content);
		
		if(dataMap.get("img")!=null)
			vo.setImg(dataMap.get("img"));
		if(dataMap.get("file1")!=null)
			vo.setFile1(dataMap.get("file1"));
		if(dataMap.get("file2")!=null)
			vo.setFile2(dataMap.get("file2"));
		
		wi_DAO dao=new wi_DAO();
		int result= dao.updateRow(vo);

		if(result==0)
			path="error/error.jsp";
		else {
			if(criteria.isEmpty())
				path+="?bno="+bno+"&page="+page;
			else
				path+="?bno="+bno+"&page="+page+"&criteria="+criteria+"&keyword"+keyword;
		}
		   return new ActionForward(path, true);
	}

}
