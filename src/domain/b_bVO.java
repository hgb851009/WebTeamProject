package domain;

import java.sql.Date;
import java.sql.Time;

public class b_bVO {
	private int bkind;
	private int bno;
	private String title;
	private String content;
	private String user;
	private String img;
	private String file;
	private int readCount;
	private Date regDate;
	private Time regTime;
	private int replyCount;
	
	public int getBkind() {
		return bkind;
	}
	public void setBkind(int bkind) {
		this.bkind = bkind;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
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
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	
	
}
