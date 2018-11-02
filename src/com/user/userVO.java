package com.user;

public class userVO {
	String userID;
	String userName;
	String userNickName;
	String userPwd;
	String userPwd2;
	String userLevel;

	public String getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserPwd2() {
		return userPwd2;
	}

	public void setUserPwd2(String userPwd2) {
		this.userPwd2 = userPwd2;
	}

	@Override
	public String toString() {
		return "userDTO{" +
				"userID='" + userID + '\'' +
				", userName='" + userName + '\'' +
				", userNickName='" + userNickName + '\'' +
				", userPwd='" + userPwd + '\'' +
				", userPwd2='" + userPwd2 + '\'' +
				", userLevel='" + userLevel + '\'' +
				'}';
	}
}
