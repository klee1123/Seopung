package com.kh.userInquiry.model.vo;

public class Inquiry {
	
	private String inquiryType;
	private String userEmail;
	private String userPrivacy;
	
	public Inquiry() {
		
	}

	public Inquiry(String inquiryType, String userEmail, String userPrivacy) {
		super();
		this.inquiryType = inquiryType;
		this.userEmail = userEmail;
		this.userPrivacy = userPrivacy;
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

	@Override
	public String toString() {
		return "Inquiry [inquiryType=" + inquiryType + ", userEmail=" + userEmail + ", userPrivacy=" + userPrivacy
				+ "]";
	}
	

}
