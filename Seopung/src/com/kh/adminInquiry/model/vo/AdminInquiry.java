package com.kh.adminInquiry.model.vo;

import java.sql.Date;

public class AdminInquiry {
	
	private int inquireNo;				//
	private String inquireTitle;
	private String inquireContent;
	private Date inquireEnrollDate;
	private String inquireStatus;
	private String inquireEmail;
	private String inquireResponse;
	private Date responseDate;
	private String status;
	private String inquireWriter; 		// 회원번호 또는 회원아이디
	private int adminNo;				// 
	private String inquireSep;
	private String inquireType;
	private String adminWriter;			// 관리자 아이디 / 답변한
	
	public AdminInquiry() {}

	public AdminInquiry(int inquireNo, String inquireTitle, String inquireContent, Date inquireEnrollDate,
			String inquireStatus, String inquireEmail, String inquireResponse, Date responseDate, String status,
			String inquireWriter, int adminNo, String inquireSep, String inquireType) {
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
		this.inquireWriter = inquireWriter;
		this.adminNo = adminNo;
		this.inquireSep = inquireSep;
		this.inquireType = inquireType;
	}
	
	

	public AdminInquiry(int inquireNo, String inquireTitle, String inquireContent, Date inquireEnrollDate,
			String inquireEmail, String inquireResponse, String inquireWriter, String inquireSep, String inquireType,
			String adminWriter) {
		super();
		this.inquireNo = inquireNo;
		this.inquireTitle = inquireTitle;
		this.inquireContent = inquireContent;
		this.inquireEnrollDate = inquireEnrollDate;
		this.inquireEmail = inquireEmail;
		this.inquireResponse = inquireResponse;
		this.inquireWriter = inquireWriter;
		this.inquireSep = inquireSep;
		this.inquireType = inquireType;
		this.adminWriter = adminWriter;
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

	public String getInquireWriter() {
		return inquireWriter;
	}

	public void setInquireWriter(String inquireWriter) {
		this.inquireWriter = inquireWriter;
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
	
	public String getAdminWriter() {
		return adminWriter;
	}

	public void setAdminWriter(String adminWriter) {
		this.adminWriter = adminWriter;
	}

	@Override
	public String toString() {
		return "AdminInquiry [inquireNo=" + inquireNo + ", inquireTitle=" + inquireTitle + ", inquireContent="
				+ inquireContent + ", inquireEnrollDate=" + inquireEnrollDate + ", inquireStatus=" + inquireStatus
				+ ", inquireEmail=" + inquireEmail + ", inquireResponse=" + inquireResponse + ", responseDate="
				+ responseDate + ", status=" + status + ", inquireWriter=" + inquireWriter + ", adminNo=" + adminNo
				+ ", inquireSep=" + inquireSep + ", inquireType=" + inquireType + "]";
	}
	
	

}