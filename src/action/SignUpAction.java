package action;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import persistence.UserDAO;

public class SignUpAction implements Action{

	private String path;
	
	
	public SignUpAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req) throws Exception {
		// TODO Auto-generated method stub
		
		String user_id = req.getParameter("id");
		String user_pw = req.getParameter("pw");
		String user_nickname = req.getParameter("nick");
		String user_name = req.getParameter("name");
		String user_email = req.getParameter("email");
		int result = 0;
		
		UserDAO dao = new UserDAO();
		result = dao.register(user_id, user_pw, user_nickname, user_name, user_email);

		req.setAttribute("result", result);
		return new ActionForward(path, false);
	}

	
	/*public boolean checkMD5(String s) {
	     if (s == null || s.trim().isEmpty())     return false;
	     Pattern p = Pattern.compile("[^A-Za-z0-9]");
	     Matcher m = p.matcher(s);
	     boolean b = m.find();
	     if (b == true) return true;
	    
	     return true;
	 }*/
}
