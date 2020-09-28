package com.kh.inquire.model.vo;

import java.sql.Date;

public class Inquire {

	private int inquireNo;				// 문의글 번호
	private String inquireTitle;		// 문의글 제목
	private String inquireContent;		// 문의글 내용
	private Date inquireEnrollDate;		// 문의글 작성 날짜
	private String inquireStatus;		// 문의글 상태 (기본N, 답변 시Y)
	private String inquireEmail;		// 비회원이메일
	private String inquireResponse;		// 문의글 관리자 답변
	private Date responseDate;			// 문의글 관리자 답변 날짜
	private String status;				// 상태(y/n)
	private int userNo;					// 작성자 
	private int adminNo;				// 관리자
	private String inquireSep;			// 회원/비회원
	private String inquireType;			// 문의글유형
	
	
	public Inquire() {}


	public Inquire(int inquireNo, String inquireTitle, String inquireContent, Date inquireEnrollDate,
			String inquireStatus, String inquireEmail, String inquireResponse, Date responseDate, String status,
			int userNo, int adminNo, String inquireSep, String inquireType) {
		super();
		this.inquireNo = inquireNo;
		this.inquireTitle = inquireTitle;
		this.inquireContent = inquireContent;
		this.inquireEnrollDate = inquireEnrollDate;
		this.inquireStatus = inquireStatus;
		this.inquireEmail = inquireEmail;
		this.inquireResponse = inquireResponse;
		this.responseDate = responseDate;
		this.status = status;
		this.userNo = userNo;
		this.adminNo = adminNo;
		this.inquireSep = inquireSep;
		this.inquireType = inquireType;
	}
	
	

	public Inquire(int inquireNo, String inquireTitle, String inquireContent, String inquireStatus) {
		super();
		this.inquireNo = inquireNo;
		this.inquireTitle = inquireTitle;
		this.inquireContent = inquireContent;
		this.inquireStatus = inquireStatus;
	}


	public int getInquireNo() {
		return inquireNo;
	}


	public void setInquireNo(int inquireNo) {
		this.inquireNo = inquireNo;
	}


	public String getInquireTitle() {
		return inquireTitle;
	}


	public void setInquireTitle(String inquireTitle) {
		this.inquireTitle = inquireTitle;
	}


	public String getInquireContent() {
		return inquireContent;
	}


	public void setInquireContent(String inquireContent) {
		this.inquireContent = inquireContent;
	}


	public Date getInquireEnrollDate() {
		return inquireEnrollDate;
	}


	public void setInquireEnrollDate(Date inquireEnrollDate) {
		this.inquireEnrollDate = inquireEnrollDate;
	}


	public String getInquireStatus() {
		return inquireStatus;
	}


	public void setInquireStatus(String inquireStatus) {
		this.inquireStatus = inquireStatus;
	}


	public String getInquireEmail() {
		return inquireEmail;
	}


	public void setInquireEmail(String inquireEmail) {
		this.inquireEmail = inquireEmail;
	}


	public String getInquireResponse() {
		return inquireResponse;
	}


	public void setInquireResponse(String inquireResponse) {
		this.inquireResponse = inquireResponse;
	}


	public Date getResponseDate() {
		return responseDate;
	}


	public void setResponseDate(Date responseDate) {
		this.responseDate = responseDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getAdminNo() {
		return adminNo;
	}


	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}


	public String getInquireSep() {
		return inquireSep;
	}


	public void setInquireSep(String inquireSep) {
		this.inquireSep = inquireSep;
	}


	public String getInquireType() {
		return inquireType;
	}


	public void setInquireType(String inquireType) {
		this.inquireType = inquireType;
	}


	@Override
	public String toString() {
		return "Inquire [inquireNo=" + inquireNo + ", inquireTitle=" + inquireTitle + ", inquireContent=" + inquireContent
				+ ", inquireEnrollDate=" + inquireEnrollDate + ", inquireStatus=" + inquireStatus + ", inquireEmail="
				+ inquireEmail + ", inquireResponse=" + inquireResponse + ", responseDate=" + responseDate + ", status="
				+ status + ", userNo=" + userNo + ", adminNo=" + adminNo + ", inquireSep=" + inquireSep
				+ ", inquireType=" + inquireType + "]";
	}

}
	