package com.kh.adminNotice.model.vo;

import java.sql.Date;

public class AdminNotice {

	private int adminNo;
	private String noticeContent;
	private Date noticeEnroll;
	private Date noticeModify;
	private int noticeNo;
	private String noticeTitle;
	private int noticeViews;
	private String status;
	
	public AdminNotice() {
		
	}

	public AdminNotice(int adminNo, String noticeContent, Date noticeEnroll, Date noticeModify, int noticeNo,
			String noticeTitle, int noticeViews, String status) {
		super();
		this.adminNo = adminNo;
		this.noticeContent = noticeContent;
		this.noticeEnroll = noticeEnroll;
		this.noticeModify = noticeModify;
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeViews = noticeViews;
		this.status = status;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeEnroll() {
		return noticeEnroll;
	}

	public void setNoticeEnroll(Date noticeEnroll) {
		this.noticeEnroll = noticeEnroll;
	}

	public Date getNoticeModify() {
		return noticeModify;
	}

	public void setNoticeModify(Date noticeModify) {
		this.noticeModify = noticeModify;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public int getNoticeViews() {
		return noticeViews;
	}

	public void setNoticeViews(int noticeViews) {
		this.noticeViews = noticeViews;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "AdminNotice [adminNo=" + adminNo + ", noticeContent=" + noticeContent + ", noticeEnroll=" + noticeEnroll
				+ ", noticeModify=" + noticeModify + ", noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle
				+ ", noticeViews=" + noticeViews + ", status=" + status + "]";
	}
	
	
}
