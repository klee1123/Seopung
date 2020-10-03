package com.kh.community.model.vo;

import java.sql.Date;

public class Reply {

	private int replyNo;
	private String replyContent;
	private int refCommunityNo;
	private String replyWriter;
	private String profile;
	private Date createDate;
	private String status;
	
	public Reply() {}

	public Reply(int replyNo, String replyContent, int refCommunityNo, String replyWriter, Date createDate,
			String status) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.refCommunityNo = refCommunityNo;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
		this.status = status;
	}
	
	

	public Reply(int replyNo, String replyContent, int refCommunityNo, String replyWriter, String profile,
			Date createDate, String status) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.refCommunityNo = refCommunityNo;
		this.replyWriter = replyWriter;
		this.profile = profile;
		this.createDate = createDate;
		this.status = status;
	}
	

	public Reply(int replyNo, String replyContent, String replyWriter, String profile, Date createDate) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyWriter = replyWriter;
		this.profile = profile;
		this.createDate = createDate;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getRefCommunityNo() {
		return refCommunityNo;
	}

	public void setRefCommunityNo(int refCommunityNo) {
		this.refCommunityNo = refCommunityNo;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", refCommunityNo=" + refCommunityNo
				+ ", replyWriter=" + replyWriter + ", profile=" + profile + ", createDate=" + createDate + ", status="
				+ status + "]";
	}

	
	
}
