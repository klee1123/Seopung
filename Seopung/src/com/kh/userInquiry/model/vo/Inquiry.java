package com.kh.userInquiry.model.vo;

public class Inquiry {
	
	private int inquireNo;
	private String inquiryType;
	private String userEmail;
	private String userPrivacy;
	private String title;
	private int userNo;
	private String sep;
	private String content;
	
	public Inquiry() {
		
	}

	public Inquiry(int inquireNo, String inquiryType, String userEmail, String userPrivacy, String title, int userNo,
			String sep, String content) {
		super();
		this.inquireNo = inquireNo;
		this.inquiryType = inquiryType;
		this.userEmail = userEmail;
		this.userPrivacy = userPrivacy;
		this.title = title;
		this.userNo = userNo;
		this.sep = sep;
		this.content = content;
	}

	public int getInquireNo() {
		return inquireNo;
	}

	public void setInquireNo(int inquireNo) {
		this.inquireNo = inquireNo;
	}

	public String getInquiryType() {
		return inquiryType;
	}

	public void setInquiryType(String inquiryType) {
		this.inquiryType = inquiryType;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPrivacy() {
		return userPrivacy;
	}

	public void setUserPrivacy(String userPrivacy) {
		this.userPrivacy = userPrivacy;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getSep() {
		return sep;
	}

	public void setSep(String sep) {
		this.sep = sep;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Inquiry [inquireNo=" + inquireNo + ", inquiryType=" + inquiryType + ", userEmail=" + userEmail
				+ ", userPrivacy=" + userPrivacy + ", title=" + title + ", userNo=" + userNo + ", sep=" + sep
				+ ", content=" + content + "]";
	}

	
	
	
}