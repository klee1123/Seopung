package com.kh.adminMember.model.vo;

import java.sql.Date;

public class Report {
	
	private int reportNo;				//신고번호
	private Date reportDate;			//신고일시
	private String reportStatus;		//신고처리상태
	private String userNo1;				//신고자번호
	private String userNo2;				//신고대상자번호
	private int reportPostNo;			//글번호
	private String reportType;			//신고분류(불법성, 광고성 등등)
	private int reportPostType;			//글분류(1:커뮤니티/2:일정/3:댓글)
	private String reportContent;		//신고내용
	
	
	public Report() {
		
	}

	
	public Report(int reportNo, Date reportDate, String reportStatus, String userNo1, String userNo2, int reportPostNo,
			String reportType, int reportPostType, String reportContent) {
		super();
		this.reportNo = reportNo;
		this.reportDate = reportDate;
		this.reportStatus = reportStatus;
		this.userNo1 = userNo1;
		this.userNo2 = userNo2;
		this.reportPostNo = reportPostNo;
		this.reportType = reportType;
		this.reportPostType = reportPostType;
		this.reportContent = reportContent;
	}

	

	public Report(int reportNo, Date reportDate, String userNo2, String reportType, String reportContent) {
		super();
		this.reportNo = reportNo;
		this.reportDate = reportDate;
		this.userNo2 = userNo2;
		this.reportType = reportType;
		this.reportContent = reportContent;
	}
	
	


	public Report(String userNo1, String userNo2, int reportPostNo, String reportType, String reportContent) {
		super();
		this.userNo1 = userNo1;
		this.userNo2 = userNo2;
		this.reportPostNo = reportPostNo;
		this.reportType = reportType;
		this.reportContent = reportContent;
	}


	public int getReportNo() {
		return reportNo;
	}


	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}


	public Date getReportDate() {
		return reportDate;
	}


	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}


	public String getReportStatus() {
		return reportStatus;
	}


	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}


	public String getUserNo1() {
		return userNo1;
	}


	public void setUserNo1(String userNo1) {
		this.userNo1 = userNo1;
	}


	public String getUserNo2() {
		return userNo2;
	}


	public void setUserNo2(String userNo2) {
		this.userNo2 = userNo2;
	}


	public int getReportPostNo() {
		return reportPostNo;
	}


	public void setReportPostNo(int reportPostNo) {
		this.reportPostNo = reportPostNo;
	}


	public String getReportType() {
		return reportType;
	}


	public void setReportType(String reportType) {
		this.reportType = reportType;
	}


	public int getReportPostType() {
		return reportPostType;
	}


	public void setReportPostType(int reportPostType) {
		this.reportPostType = reportPostType;
	}


	public String getReportContent() {
		return reportContent;
	}


	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}


	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportDate=" + reportDate + ", reportStatus=" + reportStatus
				+ ", userNo1=" + userNo1 + ", userNo2=" + userNo2 + ", reportPostNo=" + reportPostNo + ", reportType="
				+ reportType + ", reportPostType=" + reportPostType + ", reportContent=" + reportContent + "]";
	}
	

}
