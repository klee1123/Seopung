package com.kh.Member.model.vo;

import java.sql.Date;

public class Member {

	private int userNo;					// 회원번호
	private String userId;				// 회원아이디
	private String userPwd;				// 회원비밀번호
	private String userName;			// 이름
	private String nickName;			// 별명
	private String birth;				// 생년월일
	private String gender;				// 성별
	private String phone;				// 전화번호
	private String email;				// 이메일
	private Date enrollDate;			// 회원가입일
	private Date modifyDate;			// 정보수정일
	private String userIntro;			// 자기소개
	private String profile;				// 프로필경로
	private String status;				// 상태 기본 Y, 탈퇴, N, 블랙 B
	
	
	public Member() {}


	public Member(int userNo, String userId, String userPwd, String userName, String nickName, String birth,
			String gender, String phone, String email, Date enrollDate, Date modifyDate, String userIntro,
			String profile, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickName = nickName;
		this.birth = birth;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.userIntro = userIntro;
		this.profile = profile;
		this.status = status;
	}

	

	public Member(String userId, String userPwd, String userName, String nickName, String birth, String gender,
			String email) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickName = nickName;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
	}
	
	


	public Member(int userNo, String userId, String userPwd, String userName, String nickName, String birth,
			String gender, String email, Date enrollDate, Date modifyDate, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickName = nickName;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public String getUserIntro() {
		return userIntro;
	}


	public void setUserIntro(String userIntro) {
		this.userIntro = userIntro;
	}


	public String getProfile() {
		return profile;
	}


	public void setProfile(String profile) {
		this.profile = profile;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", nickName=" + nickName + ", birth=" + birth + ", gender=" + gender + ", phone=" + phone + ", email="
				+ email + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", userIntro=" + userIntro
				+ ", profile=" + profile + ", status=" + status + "]";
	}

}
