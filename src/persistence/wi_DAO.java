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

import domain.wi_VO;

public class wi_DAO {
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
		
//전체 목록 가져오기
		public ArrayList<wi_VO> getList(int page, int limit){
		int start=(page-1)*10;
		ArrayList<wi_VO> list=new ArrayList<wi_VO>();	
		
			String sql="select bno,title,readcount,regdate "
							 + "from workinfo order by bno desc limit ?,?";
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, limit);
			rs=pstmt.executeQuery();
				while(rs.next()) {
				wi_VO vo=new wi_VO();
				vo.setBno(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setReadCount(rs.getInt(3));
				vo.setRegDate(rs.getDate(4));
				vo.setRegTime(rs.getTime(4));
				list.add(vo);}
			} catch (SQLException e) {
					e.printStackTrace();
			}finally {
					close(con,pstmt,rs);}
			return list;}
		
//전체 목록 가져오기 + 검색
		public ArrayList<wi_VO> getSearchList(int page, int limit, String criteria, String keyword){
		int start=(page-1)*10;
		ArrayList<wi_VO> list=new ArrayList<wi_VO>();
				
				String sql="select bno,title,readcount,regdate "
								 + "from workinfo where "+criteria+" like ? "
								 + "order by bno desc limit ?,?";
			try {
				con=getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, limit);
				rs=pstmt.executeQuery();
					while(rs.next()) {
					wi_VO vo=new wi_VO();
					vo.setBno(rs.getInt(1));
					vo.setTitle(rs.getString(2));
					vo.setReadCount(rs.getInt(3));
					vo.setRegDate(rs.getDate(4));
					vo.setRegTime(rs.getTime(4));
					list.add(vo);}
				} catch (SQLException e) {
						e.printStackTrace();
				}finally {
						close(con,pstmt,rs);}
				return list;}
		
//전체 목록 수 구하기
		public int totalRows() {
			int totalRows=0;
			try {
				con=getConnection();
				String sql="select count(*) from workinfo";
				pstmt=con.prepareStatement(sql);
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
		public int totalRows(String criteria, String keyword) {
			int totalRows=0;
			try {
				con=getConnection();
				String sql="select count(*) from workinfo "
								 + "where "+criteria+" like ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
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
			String sql="update workinfo set readcount=readcount+1 where bno=?";
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
			return result;
		}
		
//글정보 가져오기		
		public wi_VO getRow(int bno) {
			wi_VO vo=null;
			
			con=getConnection();
			
				String sql="select bno,title,content,img,file1,file2,readcount,regdate "
								 + "from workinfo where bno=?";
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1,bno);
				rs=pstmt.executeQuery();
					if(rs.next()) {
					vo=new wi_VO();
					vo.setBno(rs.getInt(1));
					vo.setTitle(rs.getString(2));
					vo.setContent(rs.getString(3));
					vo.setImg(rs.getString(4));
					vo.setFile1(rs.getString(5));
					vo.setFile2(rs.getString(6));
					vo.setReadCount(7);
					vo.setRegDate(rs.getDate(8));
					vo.setRegTime(rs.getTime(8));}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(con,pstmt,rs);
			}
					return vo;}	
		
//새 글 등록
		public int newWorkInfo(wi_VO vo){
			int result=0;
			int bno=0;
			try {
				bno=totalRows()+1;
				con=getConnection();
				con.setAutoCommit(false);
				
				String sql="insert into workinfo(bno,title,content,img,file1,file2) values(?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, bno);
				pstmt.setString(2, vo.getTitle());
				pstmt.setString(3, vo.getContent());
				pstmt.setString(4, vo.getImg());
				pstmt.setString(5, vo.getFile1());
				pstmt.setString(6, vo.getFile2());
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
			return result;
		}
		
//글 삭제	
		public int delInfo(int bno) {
			int result=0;

			try {
				con=getConnection();
				con.setAutoCommit(false);
				String sql="delete from workinfo where bno=?";
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
			return result;
		}

//글 수정
		public int updateRow(wi_VO vo) {
			int result=0;
			int count=0;
			
			try {
				con=getConnection();
				con.setAutoCommit(false);
				String sql="update workinfo set content=?, title=?";
				
				if(vo.getImg()!=null) {
					sql+=", img=?";
					count+=1;
				}
				if(vo.getFile1()!=null) {
					sql+=", file1=?";
					count+=2;
				}
				if(vo.getFile2()!=null) {
					sql+=", file2=?";
					count+=5;
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
					pstmt.setString(3, vo.getFile1());
					pstmt.setInt(4, vo.getBno());
				}else if(count==5) {
					sql+=" where bno=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, vo.getContent());
					pstmt.setString(2, vo.getTitle());
					pstmt.setString(3, vo.getFile2());
					pstmt.setInt(4, vo.getBno());
				}else if(count==3) {
					sql+=" where bno=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, vo.getContent());
					pstmt.setString(2, vo.getTitle());
					pstmt.setString(3, vo.getImg());
					pstmt.setString(4, vo.getFile1());
					pstmt.setInt(5, vo.getBno());
				}else if(count==6) {
					sql+=" where bno=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, vo.getContent());
					pstmt.setString(2, vo.getTitle());
					pstmt.setString(3, vo.getImg());
					pstmt.setString(4, vo.getFile2());
					pstmt.setInt(5, vo.getBno());
				}else if(count==7) {
					sql+=" where bno=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, vo.getContent());
					pstmt.setString(2, vo.getTitle());
					pstmt.setString(3, vo.getFile1());
					pstmt.setString(4, vo.getFile2());
					pstmt.setInt(5, vo.getBno());
				}else if(count==8) {
					sql+=" where bno=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, vo.getContent());
					pstmt.setString(2, vo.getTitle());
					pstmt.setString(2, vo.getImg());
					pstmt.setString(3, vo.getFile1());
					pstmt.setString(4, vo.getFile2());
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
		
}
