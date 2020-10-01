package com.kh.adminInquiry.model.vo;

import java.sql.Date;

public class AdminInquiry {
	
	private int inquireNo;
	private String inquireTitle;
	private String inquireContent;
	private Date inquireEnrollDate;
	private String inquireStatus;
	private String inquireEmail;
	private String inquireResponse;
	private Date responseDate;
	private String status;
	private int userNo;
	private int adminNo;
	private String inquireSep;
	private String inquireType;
	
	public AdminInquiry() {
		
	}

	public AdminInquiry(int inquireNo, String inquireTitle, String inquireContent, Date inquireEnrollDate,
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
		return "AdminInquiry [inquireNo=" + inquireNo + ", inquireTitle=" + inquireTitle + ", inquireContent="
				+ inquireContent + ", inquireEnrollDate=" + inquireEnrollDate + ", inquireStatus=" + inquireStatus
				+ ", inquireEmail=" + inquireEmail + ", inquireResponse=" + inquireResponse + ", responseDate="
				+ responseDate + ", status=" + status + ", userNo=" + userNo + ", adminNo=" + adminNo + ", inquireSep="
				+ inquireSep + ", inquireType=" + inquireType + "]";
	}

}
