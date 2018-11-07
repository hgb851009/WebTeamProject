package persistence;

import javax.crypto.Cipher;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import domain.AvatarVO;
import domain.UserVO;

import java.security.Key;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {
	DataSource dataSource;

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	/*	private static String algorithm = "DESede";
	private static Key Key = null;
	private static Cipher cipher = null;
	
	//SQL 연동 메소드
	public Connection getConnection() {
		DataSource ds;
		try {
			Context ctx = new InitialContext();
			ds  = (DataSource)ctx.lookup("java:comp/env/jdbc/MySQL");
			//dataSource = (DataSource)envContext.lookup("jdbc/user");
			//conn = dataSource.getConnection();
			return ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	private void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
	
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
	
	//로그인 메소드
	public int login(String userID, String userPwd) {
		int result=0;
		
		con = getConnection();
		String SQL = "SELECT count(*) FROM user WHERE userID=? AND userpwd=?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPwd);
			rs = pstmt.executeQuery();
			if(rs.next())
			result=rs.getInt(1);
		} catch (SQLException e) {
				e.printStackTrace();
		}finally {
				close(con,pstmt,rs);}
		return result;}
	
/*	//로그인 메소드
	public int login(String userID, String userPwd) {
		con = getConnection();
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(2).equals(userPwd)) {
					return 1; // 로그인 성공
				} else {
					return 0; // 비밀번호 불일치
				}
			}
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close(con, pstmt, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -2; // 데이터베이스 오류
	}*/
	//사용자 레벨 확인
	public String[] getUserInfo(String userID) {
		con = getConnection();
		String[] userInfo = new String[2];
    	String SQL = "SELECT * FROM user WHERE userID = ?";
    	try{
    		pstmt = con.prepareStatement(SQL);
    		pstmt.setString(1, userID);
    		rs = pstmt.executeQuery();
    		if(rs.next()){
    			userInfo[0] = rs.getString("userNickName");
    			userInfo[1] = rs.getString("userLevel");
    			return userInfo;
		    }
	    } catch (Exception e){
    		e.printStackTrace();
	    } finally {
		    try {
				close(con, pstmt, rs);
		    } catch (Exception e) {
			    e.printStackTrace();
		    }
	    }
		return userInfo;
	}
	//개인정보조회
	public UserVO userInfo(String userID) {
		con = getConnection();
		UserVO dto = new UserVO();
		String SQL2 = "SELECT * FROM user WHERE userID = ?";
		try {
			pstmt = con.prepareStatement(SQL2);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String userid = rs.getString("userID");
				String username = rs.getString("userName");
				String usernickname = rs.getString("userNickName");
				String userpwd = rs.getString("userPwd");
				String userLevel = rs.getString("userLevel");
				dto.setUserID(userid);
				dto.setUserName(username);
				dto.setUserNickName(usernickname);
				dto.setUserPwd(userpwd);
				dto.setUserLevel(userLevel);
				return dto;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close(con, pstmt, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	//회원탈퇴처리 (미완)
	public int userInfoDelete(String userID) {
		con = getConnection();
		String SQL = "delete from user where userID = ?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, userID);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				close(con, pstmt, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // 데이터베이스 오류
	}
	//개인정보변경
	public int userInfoModify(String userID, String userNickName, String userPwd, String userLevel) {
		String SQL = "update user set userNickName=?,userPwd=?,userLevel=? where userID=?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, userNickName);
			pstmt.setString(2, userPwd);
			pstmt.setString(3, userLevel);
			pstmt.setString(4, userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close(con, pstmt, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // 데이터베이스 오류
	}
	//아이디중복
	public UserVO registerCheck(String userID) {
		con = getConnection();
		UserVO vo=null;
		try {
			con=getConnection();
			con.setAutoCommit(false);
			if(con!=null) {
			pstmt = con.prepareStatement("SELECT userid FROM user WHERE userID = ?");
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next() || userID.equals("")) {
				vo=new UserVO();
				vo.setUserID(rs.getString(1)); // 가입 가능한 회원 아이디
			}
			con.commit();
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				close(con, pstmt, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return vo; // 데이터베이스 오류
	}
	//회원가입
	public UserVO register(String userID, String userName,String userNickName,String userPwd) {
		UserVO result=null;
		try {
			con=getConnection();
			con.setAutoCommit(false);
			if(con!=null){
			pstmt = con.prepareStatement("INSERT INTO user VALUES (?, ?, ?, ?)");
			pstmt.setString(1, userID);
			pstmt.setString(2, userName);
			pstmt.setString(3, userNickName);
			pstmt.setString(4, userPwd);
			pstmt.executeUpdate();
			con.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result; // 데이터베이스 오류
	}
	//관리자모드 전체조회
	public ArrayList<UserVO> getMemberAll() {
		con = getConnection();
		ArrayList<UserVO> list = new ArrayList<UserVO>();
		try {
			String SQL = "select * from user";
			pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				UserVO dto = new UserVO();
				dto.setUserID(rs.getString("userID"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setUserLevel(rs.getString("userLevel"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public UserVO selelctUser(String userId) {
		con = getConnection();
		UserVO vo = new UserVO();
		
		String sql = "SELECT userID, userName, userPoint  FROM user WHERE userid = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				vo.setUserID(rs.getString(1));
				vo.setUserName(rs.getString(2));
				vo.setUserPoint(rs.getInt(3));
			}
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return vo;
	}
	
	public AvatarVO selelctAvatar(String avatarId) {
		con = getConnection();
		AvatarVO vo = new AvatarVO();
		String sql = "SELECT * FROM userAvatarTBL WHERE avatarId = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, avatarId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				vo.setAvatarId(rs.getString(1));
				vo.setAvatarBody(rs.getInt(2));
				vo.setAvatarHair(rs.getInt(3));
				vo.setAvatarShirt(rs.getInt(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return vo;
	}
	
	public int purchaseItem(String userId, int userPoint) {
		con = getConnection();
		int result = 0;
		String sql = "update user set userPoint=? where userid=?";
		try {
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,userPoint);
			pstmt.setString(2,userId);

			result = pstmt.executeUpdate();
			if(result > 0)
				con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return result;
	}
	
	public int updateItem(String userId, int bid, int hid, int sid) {
		con = getConnection();
		int result = 0;
		String sql = "UPDATE userAvatarTBL "
				+ "SET avatarBody=?, avatarHair=?, avatarShirt=? "
				+ "WHERE avatarId=?";
		try {
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,bid);
			pstmt.setInt(2,hid);
			pstmt.setInt(3,sid);
			pstmt.setString(4,userId);

			
			result = pstmt.executeUpdate();
			if(result > 0)
				con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return result;
	}
}