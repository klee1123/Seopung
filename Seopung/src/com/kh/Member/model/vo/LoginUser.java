package com.kh.Member.model.vo;

public class LoginUser {
	
	private int userNo;
	private String userName;
	private int category;
	
	public LoginUser() {
		
	}

	public LoginUser(int userNo, String userName, int category) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.category = category;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "LoginUser [userNo=" + userNo + ", userName=" + userName + ", category=" + category + "]";
	}

}
