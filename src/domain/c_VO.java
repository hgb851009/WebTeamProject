package domain;

import java.sql.Time;
import java.util.Date;

public class c_VO {
	private int cno;
	private String ckind;
	private String content;
	private String answer;
	private String user;
	private String state;
	private Date regDate;
	private Time regTime;
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCkind() {
		return ckind;
	}
	public void setCkind(String ckind) {
		this.ckind = ckind;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Time getRegTime() {
		return regTime;
	}
	public void setRegTime(Time regTime) {
		this.regTime = regTime;
	}
	
	
}
