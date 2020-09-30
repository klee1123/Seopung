package com.kh.adminPlan.model.vo;

import java.sql.Date;

public class PlanComment {
	
	private int commentNo;
	private String commentWriter;
	private int planNo;
	private String content;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	private String profile;  // 프로필 사진 경로
	
	public PlanComment() {
		
	}

	public PlanComment(int commentNo, String commentWriter, int planNo, String content, Date enrollDate,
			Date modifyDate, String status, String profile) {
		super();
		this.commentNo = commentNo;
		this.commentWriter = commentWriter;
		this.planNo = planNo;
		this.content = content;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.profile = profile;
	}

	
	public PlanComment(int commentNo, String commentWriter, int planNo, String content, Date enrollDate,
			String profile) {
		super();
		this.commentNo = commentNo;
		this.commentWriter = commentWriter;
		this.planNo = planNo;
		this.content = content;
		this.enrollDate = enrollDate;
		this.profile = profile;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getCommentWriter() {
		return commentWriter;
	}

	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}

	public int getPlanNo() {
		return planNo;
	}

	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "PlanComment [commentNo=" + commentNo + ", commentWriter=" + commentWriter + ", planNo=" + planNo
				+ ", content=" + content + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", status="
				+ status + ", profile=" + profile + "]";
	}
	
}
