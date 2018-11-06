package action;

import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import domain.b_bVO;
import persistence.b_DAO;



public class b_UpdateAction implements Action {
	private String path;
	public b_UpdateAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		UploadFileUtils utils=new UploadFileUtils();
		HashMap<String, String> dataMap=utils.uploadFile(req,3);
		
		int bno=Integer.parseInt(dataMap.get("bno"));
		String title=dataMap.get("title");
		String content=dataMap.get("content");
		String criteria=dataMap.get("criteria");
		String keyword=URLEncoder.encode(dataMap.get("keyword"),"utf-8");
		
		int page=Integer.parseInt(dataMap.get("page"));

		b_bVO vo=new b_bVO();
		vo.setBno(bno);
		vo.setTitle(title);
		vo.setContent(content);
		
		if(dataMap.get("img")!=null)
			vo.setImg(dataMap.get("img"));
		if(dataMap.get("file")!=null)
			vo.setFile(dataMap.get("file"));
		
		b_DAO dao=new b_DAO();
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
