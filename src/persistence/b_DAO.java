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

import domain.UserVO;
import domain.b_bVO;



public class b_DAO {
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
		try {if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}catch(SQLException e) {
			e.printStackTrace();}}
	
//boardkind 목록 가져오기
	public ArrayList<b_bVO> boardKindList(int page,int limit, int bkind){
		ArrayList<b_bVO> list=new ArrayList<b_bVO>();
		ReplyDAO redao=new ReplyDAO();
		int start=(page-1)*10;
				
			String sql="select bkind,bno,title,content,user,regdate,readcount "
							 + "from classboard where bkind=? order by bno desc limit ?,?";
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bkind);
			pstmt.setInt(2, start);
			pstmt.setInt(3, limit);
			rs=pstmt.executeQuery();
				while(rs.next()) {
				b_bVO vo=new b_bVO();
				vo.setBkind(rs.getInt(1));
				int bn= rs.getInt(2);
				vo.setBno(bn);
				vo.setTitle(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setUser(rs.getString(5));
				vo.setRegDate(rs.getDate(6));
				vo.setRegTime(rs.getTime(6));
				vo.setReadCount(rs.getInt(7));
				vo.setReplyCount((redao.board_replyCount(bn)));
				list.add(vo);}
		} catch (SQLException e) {
				e.printStackTrace();
		}finally {
				close(con,pstmt,rs);}
			return list;}
		
//전체 목록 가져오기 + 검색
	public ArrayList<b_bVO> getSearchList(int page, int limit, String criteria, String keyword, int bkind){
		int start=(page-1)*10;
		ArrayList<b_bVO> list=new ArrayList<b_bVO>();	
			ReplyDAO redao=new ReplyDAO();
				
			String sql="select bkind,bno,title,content,user,regdate,readcount "
						+ "from classboard where bkind=? AND "+criteria+" like ? "
						+ "order by bno desc limit ?,?";
			try {
				con=getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, bkind);
				pstmt.setString(2, "%"+keyword+"%");
				pstmt.setInt(3, start);
				pstmt.setInt(4, limit);
				rs=pstmt.executeQuery();
					while(rs.next()) {
						b_bVO vo=new b_bVO();
						vo.setBkind(rs.getInt(1));
						int bn= rs.getInt(2);
						vo.setBno(bn);
						vo.setTitle(rs.getString(3));
						vo.setContent(rs.getString(4));
						vo.setUser(rs.getString(5));
						vo.setRegDate(rs.getDate(6));
						vo.setRegTime(rs.getTime(6));
						vo.setReadCount(rs.getInt(7));
						vo.setReplyCount((redao.board_replyCount(bn)));
						list.add(vo);}
				} catch (SQLException e) {
						e.printStackTrace();
				}finally {
						close(con,pstmt,rs);}
				return list;}
	

//목록 수 구하기
	public int totalRows(int bkind) {
		int totalRows=0;
		try {
			con=getConnection();
			String sql="select count(*) from classboard where bkind=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bkind);
			rs=pstmt.executeQuery();
			if(rs.next())
				totalRows=rs.getInt(1);
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(con,pstmt,rs);
		}
		return totalRows;}
	
//전체 목록 수 구하기 + 검색
	public int totalRows(String criteria, String keyword, int bkind) {
		int totalRows=0;
		try {
			con=getConnection();
			String sql="select count(*) from classboard "
						 + "where bkind=? AND "+criteria+" like ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bkind);
			pstmt.setString(2, "%"+keyword+"%");
			rs=pstmt.executeQuery();
				if(rs.next())
				totalRows=rs.getInt(1);
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(con,pstmt,rs);
		}
		return totalRows;}
	
//조회수 업데이트
	public int CountUp(int bno) {
		int result=0;
		String sql="update classboard set readcount=readcount+1 where bno=?";
		try {
			con=getConnection();
			con.setAutoCommit(false);
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bno);
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
	
//글정보 가져오기		
	public b_bVO getRow(int bno) {
		b_bVO vo=null;
		ReplyDAO redao=new ReplyDAO();
		con=getConnection();
			
			String sql="select bkind,title,content,user,img,file,regdate,readcount "
						 + "from classboard where bno=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,bno);
			rs=pstmt.executeQuery();
					if(rs.next()) {
						vo=new b_bVO();
						vo.setBkind(rs.getInt(1));
						vo.setBno(bno);
						vo.setTitle(rs.getString(2));
						vo.setContent(rs.getString(3));
						vo.setUser(rs.getString(4));
						vo.setImg(rs.getString(5));
						vo.setFile(rs.getString(6));
						vo.setRegDate(rs.getDate(7));
						vo.setRegTime(rs.getTime(7));
						vo.setReadCount(rs.getInt(8));
						vo.setReplyCount(redao.board_replyCount(bno));
					}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(con,pstmt,rs);
		}
			return vo;}	
	
//새 글 등록
	public int newBoard(b_bVO vo){
		int result=0;
		int bno=0;
		
		try {
			
			con=getConnection();
			String sql="select max(bno) from classboard";
			
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
				bno=rs.getInt(1)+1;
			
			con.setAutoCommit(false);
		
			
			sql="insert into classboard(bkind,bno,title,content,user,img,file) "
			   + "values(?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getBkind());
			pstmt.setInt(2, bno);
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getUser());
			pstmt.setString(6, vo.getImg());
			pstmt.setString(7, vo.getFile());
			result=pstmt.executeUpdate();
				if(result>0)
					con.commit();
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
				e.printStackTrace();
		}finally {
			close(con,pstmt,rs);
		}
			return result;}

//글 삭제	
	public int delBoard(int bno) {
		int result=0;

		try {
			con=getConnection();
			con.setAutoCommit(false);
			String sql="delete from classboard where bno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bno);
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

//글 수정
	public int updateRow(b_bVO vo) {
		int result=0;
		int count=0;
		
		try {
			con=getConnection();
			con.setAutoCommit(false);
			String sql="update classboard set content=?, title=?";
			
			if(vo.getImg()!=null) {
				sql+=", img=?";
				count+=1;
			}
			if(vo.getFile()!=null) {
				sql+=", file=?";
				count+=2;
			}
			
				
			if(count==1) {
				sql+=" where bno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, vo.getContent());
				pstmt.setString(2, vo.getTitle());
				pstmt.setString(3, vo.getImg());
				pstmt.setInt(4, vo.getBno());
			}else if(count==2) {
				sql+=" where bno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, vo.getContent());
				pstmt.setString(2, vo.getTitle());
				pstmt.setString(3, vo.getFile());
				pstmt.setInt(4, vo.getBno());
			}else if(count==3) {
				sql+=" where bno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, vo.getContent());
				pstmt.setString(2, vo.getTitle());
				pstmt.setString(3, vo.getImg());
				pstmt.setString(4, vo.getFile());
				pstmt.setInt(5, vo.getBno());
			}else if(count==0) {
				sql+=" where bno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, vo.getContent());
				pstmt.setString(2, vo.getTitle());
				pstmt.setInt(3, vo.getBno());
			}
				
			result=pstmt.executeUpdate();
				
				if(result>0)
					con.commit();
		} catch (SQLException e) {
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
	
//loginuser 정보 가져오기		
	public UserVO getLoginUserInfo(String userid) {
		UserVO vo=new UserVO();
		
		con=getConnection();
				

		try {
			String sql="select usernickname, classno, level from user where userid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo.setUserNickName(rs.getString(1));
				vo.setClassNo(rs.getString(2));
				vo.setLevel(rs.getString(3));
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(con,pstmt,rs);
		}
			return vo;}	
	
	//작성자정보 가져오기		
		public String getWriterInfo(String usernickname) {
			String writerid="";
			con=getConnection();

			try {
				String sql="select userid "
						 + "from user where usernickname=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1,usernickname);
				rs=pstmt.executeQuery();
				if(rs.next())
					writerid=rs.getString(1);
					
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(con,pstmt,rs);
			}
				return writerid;}	
}
