package action;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadFileUtils {
	public HashMap<String, String> uploadFile(HttpServletRequest request,int no) {
	HashMap<String, String> dataMap=new HashMap<String, String>();
	
	
	//사용자의 요청이 익스플로러 계열인지 확인하기
	String agent = request.getHeader("User-Agent");
	boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1)
													 || (agent.indexOf("Edge") > -1);


	//request안에 multipart/form-data가 있는지 확인
	boolean isMultipart=ServletFileUpload.isMultipartContent(request);

	if(isMultipart){
		//factory 생성
		DiskFileItemFactory factory=new DiskFileItemFactory();
		ServletFileUpload upload=new ServletFileUpload(factory);
		
		//업로드 가능한 사이즈 지정
		upload.setSizeMax(2000*1024);
		
		//사용자의 요청 중 일반요소(Form Field)와 file로 온 것 분리
		List<FileItem> Items = null;
		try {
			Items = upload.parseRequest(request);
		} catch (FileUploadException e1) {
			e1.printStackTrace();
		}
		
		//해석된 구문 처리하기
		Iterator<FileItem> iter=Items.iterator();
		while(iter.hasNext()){
			FileItem item=iter.next();
			
			if(item.isFormField()){ //일반요소
				String fieldName=item.getFieldName();
				String value = null;
				try {
					value = item.getString("utf-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				dataMap.put(fieldName, value);
				
			}else{//file요소
				String fieldName=item.getFieldName();
				//익스계열인 경우 fileName이 파일이 있었던 경로까지 포함해서 설정됨
				//fileName저장 시 경로를 떼어내고 저장할 것
				String fileName=null;
				if(ieBrowser){
					int pos=item.getName().lastIndexOf("\\");
					fileName=item.getName().substring(pos+1);
				}else{
					fileName=item.getName();
				}
				if(fileName!=null && item.getSize()>0) {
				//파일저장
				UUID id=UUID.randomUUID();

				File uploadfile=null;
				String encodeName="";
				//IE 11인 경우에 한글 파일명이 제대로 동작을 안함
				if(no==0) { //schoolnotice
					uploadfile=new File(request.getSession().getServletContext().getRealPath("/sn/"+id+"_"+fileName));
					encodeName=uploadfile.getName();
				}else if(no==1) { //workinfo
					uploadfile=new File(request.getSession().getServletContext().getRealPath("/work/"+id+"_"+fileName));
					encodeName=uploadfile.getName();
				}else if(no==2) { //counsellingNprint
					uploadfile=new File(request.getSession().getServletContext().getRealPath("/print/"+id+"_"+fileName));
					encodeName=uploadfile.getName();
				}else if(no==3) { //classboard
					uploadfile=new File(request.getSession().getServletContext().getRealPath("/boardFile/"+id+"_"+fileName));
					encodeName=uploadfile.getName();
				}
				
				
				//11인 경우에는 인코딩을 한 후 보낸다.
				if(agent.indexOf("Trident")>-1)
					try {
						encodeName=URLEncoder.encode(uploadfile.getName(),"utf-8");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
				
				dataMap.put(fieldName, encodeName);
				//파일저장
				try {
					
					item.write(uploadfile);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
	
	return dataMap;
	}
}
