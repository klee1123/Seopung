package com.kh.accompany.model.vo;

import java.sql.Date;

public class Accompany {

	private int accomNo;
	private Date accomApply;
	private String accomStatus;
	private Date accomComplete; 
	private int userNo1;				// 신청자
	private int userNo2;				// 구인자
	private int planNo;					// 일정 번호(PLAN)
	private String userId;
	private String userNick;
	
	

	public Accompany() {};
	
	public Accompany(int accomNo, Date accomApply, String accomStatus, Date accomComplete, int userNo1, int userNo2,
			int planNo) {
		super();
		this.accomNo = accomNo;
		this.accomApply = accomApply;
		this.accomStatus = accomStatus;
		this.accomComplete = accomComplete;
		this.userNo1 = userNo1;
		this.userNo2 = userNo2;
		this.planNo = planNo;
	}
	
	

	public Accompany(int accomNo,  String userId, String userNick , int userNo1 , int userNo2, int planNo) {
		super();
		this.accomNo = accomNo;
		this.userId = userId;
		this.userNick = userNick;
		this.userNo1 = userNo1;
		this.userNo2 = userNo2;
		this.planNo = planNo;
	}

	public int getAccomNo() {
		return accomNo;
	}

	public void setAccomNo(int accomNo) {
		this.accomNo = accomNo;
	}

	public Date getAccomApply() {
		return accomApply;
	}

	public void setAccomApply(Date accomApply) {
		this.accomApply = accomApply;
	}

	public String getAccomStatus() {
		return accomStatus;
	}

	public void setAccomStatus(String accomStatus) {
		this.accomStatus = accomStatus;
	}

	public Date getAccomComplete() {
		return accomComplete;
	}

	public void setAccomComplete(Date accomComplete) {
		this.accomComplete = accomComplete;
	}

	public int getUserNo1() {
		return userNo1;
	}

	public void setUserNo1(int userNo1) {
		this.userNo1 = userNo1;
	}

	public int getUserNo2() {
		return userNo2;
	}

	public void setUserNo2(int userNo2) {
		this.userNo2 = userNo2;
	}

	public int getPlanNo() {
		return planNo;
	}

	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}

	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getUserNick() {
		return userNick;
	}
	
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	
	@Override
	public String toString() {
		return "Accompany [accomNo=" + accomNo + ", accomApply=" + accomApply + ", accomStatus=" + accomStatus
				+ ", accomComplete=" + accomComplete + ", userNo1=" + userNo1 + ", userNo2=" + userNo2 + ", planNo="
				+ planNo + "]";
	}
	
	
	
	
}
