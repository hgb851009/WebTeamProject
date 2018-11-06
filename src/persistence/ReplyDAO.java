package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import domain.b_rVO;
import domain.sn_ReplyVO;


public class ReplyDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	private Connection getConnection() {
		try {Context ctx=new InitialContext();
			 	DataSource ds=(DataSource) ctx.lookup("java:comp/env/jdbc/MySQL");
			 	return ds.getConnection();
		} catch (NamingException | SQLException e) {
				e.printStackTrace();
		}return null;}
	
	private void close(Connection con,PreparedStatement pstmt,ResultSet rs) {
		try {if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
		}catch(SQLException e) {
			e.printStackTrace();}}
	
	private void close(Connection con,PreparedStatement pstmt) {
		try {	if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
		}catch(SQLException e) {
			e.printStackTrace();}}
	
//댓글수 구하기
	public int replyCount(int bno) {
		int replyCount=0;
		
		String sql="select count(*) from schoolnotice_reply where noticebno=?";
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs=pstmt.executeQuery();
			if(rs.next())
				replyCount=rs.getInt(1);
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(con,pstmt,rs);
		}
		return replyCount;}
	
//댓글 목록 가져오기
	public ArrayList<sn_ReplyVO> getReplyList(int bno){
		ArrayList<sn_ReplyVO> list=new ArrayList<sn_ReplyVO>();	

			String sql="select noticebno, replyno, replycontent,replyuser,replydate "
							 + "from schoolnotice_reply where noticebno=?";
			
		try {	
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs=pstmt.executeQuery();
				while(rs.next()) {
				sn_ReplyVO vo=new sn_ReplyVO();
				vo.setNoticeBno(rs.getInt(1));
				vo.setReplyNo(rs.getInt(2));
				vo.setReplyContent(rs.getString(3));
				vo.setReplyUser(rs.getString(4));
				vo.setReply_Date(rs.getDate(5));
				vo.setReply_Time(rs.getTime(5));
				list.add(vo);}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(con,pstmt,rs);}
		return list;}
		
//새 댓글 등록
public int newReply(int noticeBno,String userID,String newReplyContent) {
	int result=0;
	int maxNo=replyCount(noticeBno);
	
		try {
			con=getConnection();
			con.setAutoCommit(false);
			String sql="insert into schoolnotice_reply(noticebno,replyno,replycontent,replyuser) " 
							 + "values(?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, noticeBno);
			pstmt.setInt(2, maxNo+1);
			pstmt.setString(3, newReplyContent);
			pstmt.setString(4, userID);
			result=pstmt.executeUpdate();
			if(result>0)
				con.commit();
		}  catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			close(con,pstmt);
		}
			return result;}
		
//댓글 삭제
	public int delReply(int noticeBno,int replyno) {
	int result=0;
		try {
			con=getConnection();
			con.setAutoCommit(false);
			String sql="delete from schoolnotice_reply where noticebno=? AND replyno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, noticeBno);
			pstmt.setInt(2, replyno);
			result=pstmt.executeUpdate();
			if(result>0)
				con.commit();
		}  catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			close(con,pstmt);
		}
			return result;}

	
	
/*  위 schoolnotice, 아래 board  */
	
	
	
//board댓글수 구하기
	public int board_replyCount(int bno) {
		int replyCount=0;
			
		String sql="select count(rno) from board_reply where bno=?";
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs=pstmt.executeQuery();
			if(rs.next())
				replyCount=rs.getInt(1);
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(con,pstmt,rs);
		}
		return replyCount;}

//댓글 목록 가져오기
	public ArrayList<b_rVO> board_getReplyList(int bno){
		ArrayList<b_rVO> list=new ArrayList<b_rVO>();	
		
		String sql="select bno, rno, content, user, regdate "
					 + "from board_reply where bno=?";
				
		try {	
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs=pstmt.executeQuery();
					while(rs.next()) {
					b_rVO vo=new b_rVO();
					vo.setBno(rs.getInt(1));
					vo.setRno(rs.getInt(2));
					vo.setContent(rs.getString(3));
					vo.setUser(rs.getString(4));
					vo.setRegDate(rs.getDate(5));
					vo.setRegTime(rs.getTime(5));
					list.add(vo);}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(con,pstmt,rs);}
		return list;}
	
//새 댓글 등록
	public int board_newReply(int bno,String userID,String newReplyContent) {
		int result=0;
		int maxNo=board_replyCount(bno);
		
		try {
			con=getConnection();
			con.setAutoCommit(false);
		String sql="insert into board_reply(bno,rno,content,user) " 
				 + "values(?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setInt(2, maxNo+1);
			pstmt.setString(3, newReplyContent);
			pstmt.setString(4, userID);
			result=pstmt.executeUpdate();
				if(result>0)
					con.commit();
		}  catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
				e.printStackTrace();
		}finally {
			close(con,pstmt);
		}
			return result;}
			
//댓글 삭제
	public int board_delReply(int bno,int rno) {
	int result=0;
	
		try {
				con=getConnection();
				con.setAutoCommit(false);
				String sql="delete from board_reply where bno=? AND rno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, bno);
				pstmt.setInt(2, rno);
				result=pstmt.executeUpdate();
				if(result>0)
					con.commit();
		}  catch (SQLException e) {
				try {
					con.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
		}finally {
				close(con,pstmt);
		}
				return result;}
}
