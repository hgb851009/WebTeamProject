package domain;

import java.sql.Date;
import java.sql.Time;

public class b_rVO {
	private int bno;
	private int rno;
	private String content;
	private String user;
	private Date regDate;
	private Time regTime;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
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
