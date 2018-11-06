package domain;

import java.sql.Date;
import java.sql.Time;

public class sn_ReplyVO {
	private int noticeBno;
	private int replyNo;
	private String replyContent;
	private String replyUser;
	private Date reply_Date;
	private Time reply_Time;
	public int getNoticeBno() {
		return noticeBno;
	}
	public void setNoticeBno(int noticeBno) {
		this.noticeBno = noticeBno;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyUser() {
		return replyUser;
	}
	public void setReplyUser(String replyUser) {
		this.replyUser = replyUser;
	}
	public Date getReply_Date() {
		return reply_Date;
	}
	public void setReply_Date(Date reply_Date) {
		this.reply_Date = reply_Date;
	}
	public Time getReply_Time() {
		return reply_Time;
	}
	public void setReply_Time(Time reply_Time) {
		this.reply_Time = reply_Time;
	}
	
	
	
	
}
