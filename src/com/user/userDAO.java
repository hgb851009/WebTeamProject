package com.user;

import javax.crypto.Cipher;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.security.Key;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class userDAO {
	DataSource dataSource;

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private static String algorithm = "DESede";
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
	//로그인 메소드
	public int login(String userID, String userPwd) {
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
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
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -2; // 데이터베이스 오류
	}
	//사용자 레벨 확인
	public String[] getUserInfo(String userID) {
		String[] userInfo = new String[2];
    	String SQL = "SELECT * FROM user WHERE userID = ?";
    	try{
    		pstmt = conn.prepareStatement(SQL);
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
			    if (rs != null) rs.close();
			    if (pstmt != null) pstmt.close();
			    if (conn != null) conn.close();
		    } catch (Exception e) {
			    e.printStackTrace();
		    }
	    }
		return userInfo;
	}
	//개인정보조회
	public userVO userInfo(String userID) {
		userVO dto = new userVO();
		String SQL2 = "SELECT * FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL2);
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
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	//회원탈퇴처리 (미완)
	public int userInfoDelete(String userID) {
		String SQL = "delete from user where userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
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
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userNickName);
			pstmt.setString(2, userPwd);
			pstmt.setString(3, userLevel);
			pstmt.setString(4, userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // 데이터베이스 오류
	}
	//아이디중복
	public userVO registerCheck(String userID) {
		userVO vo=null;
		try {
			conn=getConnection();
			conn.setAutoCommit(false);
			if(conn!=null) {
			pstmt = conn.prepareStatement("SELECT userid FROM user WHERE userID = ?");
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next() || userID.equals("")) {
				vo=new userVO();
				vo.setUserID(rs.getString(1)); // 가입 가능한 회원 아이디
			}
			conn.commit();
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return vo; // 데이터베이스 오류
	}
	//회원가입
	public userVO register(String userID,Sring userName,String userNickName,String userPwd) {
		userVO result=null;
		try {
			conn=getConnection();
			conn.setAutoCommit(false);
			if(conn!=null){
			pstmt = conn.prepareStatement("INSERT INTO user VALUES (?, ?, ?, ?)");
			pstmt.setString(1, userID);
			pstmt.setString(2, userName);
			pstmt.setString(3, userNickName);
			pstmt.setString(4, userPwd);
			pstmt.executeUpdate();
			conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result; // 데이터베이스 오류
	}
	//관리자모드 전체조회
	public ArrayList<userVO> getMemberAll() {
		ArrayList<userVO> list = new ArrayList<userVO>();
		try {
			String SQL = "select * from user";
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				userVO dto = new userVO();
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
				if (conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}