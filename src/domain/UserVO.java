package domain;

public class UserVO {
	private String userID;
	private String userName;
	private String userNickName;
	private String userPwd;
	private String userPwd2;
	private String userLevel;
	private int userPoint;
	//board 때문에 추가
	private String classNo;
	private String level;
	
	public int getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}

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

	public String getClassNo() {
		return classNo;
	}

	public void setClassNo(String classNo) {
		this.classNo = classNo;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}
}
