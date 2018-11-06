package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import domain.c_VO;
import domain.p_VO;



public class cp_DAO {	
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

	
//Counselling 목록 가져오기
	public ArrayList<c_VO> cList(String user){
	ArrayList<c_VO> list=new ArrayList<c_VO>();	
	
		String sql="select cno,ckind,content,answer,state,regdate "
						 + "from counselling where user=? order by cno desc";
	try {
		con=getConnection();
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, user);
		rs=pstmt.executeQuery();
			while(rs.next()) {
			c_VO vo=new c_VO();
			vo.setCno(rs.getInt(1));
			vo.setCkind(rs.getString(2));
			vo.setContent(rs.getString(3));
			vo.setAnswer(rs.getString(4));
			vo.setState(rs.getString(5));
			vo.setRegDate(rs.getDate(6));
			vo.setRegTime(rs.getTime(6));
			vo.setUser(user);
			list.add(vo);}
		} catch (SQLException e) {
				e.printStackTrace();
		}finally {
				close(con,pstmt,rs);}
		return list;}

//Counselling 목록 가져오기 (ROOT)
		public ArrayList<c_VO> cList(){
		ArrayList<c_VO> list=new ArrayList<c_VO>();	
		
			String sql="select cno,ckind,content,answer,state,regdate,user "
							 + "from counselling order by cno desc";
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
				while(rs.next()) {
				c_VO vo=new c_VO();
				vo.setCno(rs.getInt(1));
				vo.setCkind(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setAnswer(rs.getString(4));
				vo.setState(rs.getString(5));
				vo.setRegDate(rs.getDate(6));
				vo.setRegTime(rs.getTime(6));
				vo.setUser(rs.getString(7));
				list.add(vo);}
			} catch (SQLException e) {
					e.printStackTrace();
			}finally {
					close(con,pstmt,rs);}
			return list;}
		
//Counselling 답변할 목록 가져오기
		public ArrayList<c_VO> cOneList(int cno){
		ArrayList<c_VO> list=new ArrayList<c_VO>();	
		
			String sql="select cno,ckind,content,answer,state,regdate,user "
							 + "from counselling where cno=? order by cno desc";
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, cno);
			rs=pstmt.executeQuery();
				while(rs.next()) {
				c_VO vo=new c_VO();
				vo.setCno(rs.getInt(1));
				vo.setCkind(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setAnswer(rs.getString(4));
				vo.setState(rs.getString(5));
				vo.setRegDate(rs.getDate(6));
				vo.setRegTime(rs.getTime(6));
				vo.setUser(rs.getString(7));
				list.add(vo);}
			} catch (SQLException e) {
					e.printStackTrace();
			}finally {
					close(con,pstmt,rs);}
			return list;}
	
	
//Print 목록 가져오기
		public ArrayList<p_VO> pList(){
		ArrayList<p_VO> list=new ArrayList<p_VO>();	
		
			String sql="select * from print";
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
				while(rs.next()) {
				p_VO vo=new p_VO();
				vo.setPno(rs.getInt(1));
				vo.setPname(rs.getString(2));
				vo.setImg(rs.getString(3));
				vo.setFile(rs.getString(4));
				list.add(vo);}
			} catch (SQLException e) {
					e.printStackTrace();
			}finally {
					close(con,pstmt,rs);}
			return list;}

	
//새 상담글 등록
	public int newCounselling(String ckind, String content,String user){
		int result=0;
		int cno=0;
		try {
			con=getConnection();
			con.setAutoCommit(false);
			pstmt=con.prepareStatement("select max(cno) from counselling");
			rs=pstmt.executeQuery();
			if(rs.next()) cno=rs.getInt(1)+1;
			else
				cno=1;
			
			String sql="insert into counselling(cno,ckind,content,user,state) values(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, cno);
			pstmt.setString(2, ckind);
			pstmt.setString(3, content);
			pstmt.setString(4, user);
			pstmt.setString(5, "대기중");
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
	
//상담글 삭제	
	public int delCounselling(int cno) {
		int result=0;

		try {
			con=getConnection();
			con.setAutoCommit(false);
			String sql="delete from counselling where cno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, cno);
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
	
//새 출력파일 등록
		public int newPrint(p_VO vo){
			int result=0;
			int pno=0;
			try {
				con=getConnection();
				con.setAutoCommit(false);
				pstmt=con.prepareStatement("select max(pno) from print");
				rs=pstmt.executeQuery();
				if(rs.next()) pno=rs.getInt(1)+1;
				else
					pno=1;
				
				String sql="insert into print values(?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, pno);
				pstmt.setString(2, vo.getPname());
				pstmt.setString(3, vo.getImg());
				pstmt.setString(4, vo.getFile());
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
		
//파일 삭제	
		public int delPrint(int pno) {
			int result=0;

			try {
				con=getConnection();
				con.setAutoCommit(false);
				String sql="delete from print where pno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, pno);
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
		
//답변 등록
		public int newAnswer(int cno,String answer){
			int result=0;
			
			try {
				con=getConnection();
				con.setAutoCommit(false);

					String sql="update counselling set answer=? , state=? where cno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, answer);
				pstmt.setString(2, "처리중");
				pstmt.setInt(3, cno);
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
		
//완료처리 등록
		public int endAnswer(int cno){
			int result=0;
					
				try {
					con=getConnection();
					con.setAutoCommit(false);

						String sql="update counselling set state=? where cno=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, "처리 완료");
					pstmt.setInt(2, cno);
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

/*
//글 수정
	public int updateRow(sn_VO vo) {
		int result=0;
		int count=0;
		
		try {
			con=getConnection();
			con.setAutoCommit(false);
			String sql="update schoolnotice set content=?, title=?";
			
			if(vo.getImg1()!=null) {
				sql+=", img1=?";
				count+=1;
			}
			if(vo.getImg2()!=null) {
				sql+=", img2=?";
				count+=2;
			}
			if(vo.getImg3()!=null) {
				sql+=", img3=?";
				count+=5;
			}
			
			if(count==1) {
				sql+=" where bno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, vo.getContent());
				pstmt.setString(2, vo.getTitle());
				pstmt.setString(3, vo.getImg1());
				pstmt.setInt(4, vo.getBno());
			}else if(count==2) {
				sql+=" where bno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, vo.getContent());
				pstmt.setString(2, vo.getTitle());
				pstmt.setString(3, vo.getImg2());
				pstmt.setInt(4, vo.getBno());
			}else if(count==5) {
				sql+=" where bno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, vo.getContent());
				pstmt.setString(2, vo.getTitle());
				pstmt.setString(3, vo.getImg3());
				pstmt.setInt(4, vo.getBno());
			}else if(count==3) {
				sql+=" where bno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, vo.getContent());
				pstmt.setString(2, vo.getTitle());
				pstmt.setString(3, vo.getImg1());
				pstmt.setString(4, vo.getImg2());
				pstmt.setInt(5, vo.getBno());
			}else if(count==6) {
				sql+=" where bno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, vo.getContent());
				pstmt.setString(2, vo.getTitle());
				pstmt.setString(3, vo.getImg1());
				pstmt.setString(4, vo.getImg3());
				pstmt.setInt(5, vo.getBno());
			}else if(count==7) {
				sql+=" where bno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, vo.getContent());
				pstmt.setString(2, vo.getTitle());
				pstmt.setString(3, vo.getImg2());
				pstmt.setString(4, vo.getImg3());
				pstmt.setInt(5, vo.getBno());
			}else if(count==8) {
				sql+=" where bno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, vo.getContent());
				pstmt.setString(2, vo.getTitle());
				pstmt.setString(2, vo.getImg1());
				pstmt.setString(3, vo.getImg2());
				pstmt.setString(4, vo.getImg3());
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
		return result;}*/

}
