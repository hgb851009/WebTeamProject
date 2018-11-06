package action;

import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import domain.sn_VO;
import persistence.sn_DAO;

public class sn_UpdateAction implements Action {
	private String path;
	public sn_UpdateAction(String path) {
	super();
	this.path = path;}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		UploadFileUtils utils=new UploadFileUtils();
		HashMap<String, String> dataMap=utils.uploadFile(req,0);
		
		int bno=Integer.parseInt(dataMap.get("bno"));
		String title=dataMap.get("title");
		String content=dataMap.get("content");
		String criteria=dataMap.get("criteria");
		String keyword=URLEncoder.encode(dataMap.get("keyword"),"utf-8");
		
		int page=Integer.parseInt(dataMap.get("page"));

		sn_VO vo=new sn_VO();
		vo.setBno(bno);
		vo.setTitle(title);
		vo.setContent(content);
		
		if(dataMap.get("img1")!=null)
			vo.setImg1(dataMap.get("img1"));
		if(dataMap.get("img2")!=null)
			vo.setImg2(dataMap.get("img2"));
		if(dataMap.get("img3")!=null)
			vo.setImg3(dataMap.get("img3"));
		
		sn_DAO dao=new sn_DAO();
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
