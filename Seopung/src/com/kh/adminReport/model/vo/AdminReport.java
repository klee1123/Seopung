package com.kh.adminReport.model.vo;

import java.sql.Date;

public class AdminReport {
	
	private int reportNo;
	private String reportContent;
	private Date reportDate;
	private String reportstatus;
	private String userNo; // userNo 신고한사람
	private String userId2;// userNo2 신고당한사람
	private int reportPostno;
	private String reportType;
	private int reportPosttype;
	private int userNo2;
	
	
	public AdminReport() {
		
	}
	

	public AdminReport(int reportNo, String reportContent, Date reportDate, String reportstatus, String userNo,
			String userId2, String reportType, int userNo2) {
		super();
		this.reportNo = reportNo;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportstatus = reportstatus;
		this.userNo = userNo;
		this.userId2 = userId2;
		this.reportType = reportType;
		this.userNo2 = userNo2;
	}


	public AdminReport(int reportNo, String reportContent, Date reportDate, String reportstatus, String userNo,
			String userNo2, int reportPostno, String reportType, int reportPosttype) {
		super();
		this.reportNo = reportNo;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportstatus = reportstatus;
		this.userNo = userNo;
		this.reportPostno = reportPostno;
		this.reportType = reportType;
		this.reportPosttype = reportPosttype;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportstatus() {
		return reportstatus;
	}

	public void setReportstatus(String reportstatus) {
		this.reportstatus = reportstatus;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	

	public int getUserNo2() {
		return userNo2;
	}


	public String getUserId2() {
		return userId2;
	}


	public void setUserId2(String userId2) {
		this.userId2 = userId2;
	}


	public void setUserNo2(int userNo2) {
		this.userNo2 = userNo2;
	}


	public int getReportPostno() {
		return reportPostno;
	}

	public void setReportPostno(int reportPostno) {
		this.reportPostno = reportPostno;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public int getReportPosttype() {
		return reportPosttype;
	}

	public void setReportPosttype(int reportPosttype) {
		this.reportPosttype = reportPosttype;
	}

	@Override
	public String toString() {
		return "AdminReport [reportNo=" + reportNo + ", reportContent=" + reportContent + ", reportDate=" + reportDate
				+ ", reportstatus=" + reportstatus + ", userNo=" + userNo + ", userNo2=" + userNo2 + ", reportPostno="
				+ reportPostno + ", reportType=" + reportType + ", reportPosttype=" + reportPosttype + "]";
	}
	
	

}