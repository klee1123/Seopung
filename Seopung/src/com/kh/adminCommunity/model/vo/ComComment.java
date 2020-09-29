package com.kh.adminCommunity.model.vo;

import java.sql.Date;

public class ComComment {
	
	private int commentNo;
	private int communityNo;
	private String commentWriter;
	private String content;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	private String profile;
	
	public ComComment() {
		
	}
	
	
	public ComComment(int commentNo, int communityNo, String commentWriter, String content, Date enrollDate,
			Date modifyDate, String status) {
		super();
		this.commentNo = commentNo;
		this.communityNo = communityNo;
		this.commentWriter = commentWriter;
		this.content = content;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}
	

	public ComComment(int commentNo, int communityNo, String commentWriter, String content, Date enrollDate,
			String profile) {
		super();
		this.commentNo = commentNo;
		this.communityNo = communityNo;
		this.commentWriter = commentWriter;
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


	public int getCommunityNo() {
		return communityNo;
	}


	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}


	public String getCommentWriter() {
		return commentWriter;
	}


	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
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
		return "ComComment [commentNo=" + commentNo + ", communityNo=" + communityNo + ", commentWriter="
				+ commentWriter + ", content=" + content + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate
				+ ", status=" + status + "]";
	}
	
}
