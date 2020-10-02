package com.kh.scrapCommunity.model.vo;

import java.sql.Date;

public class ScrapCommunity {
	
	private int communityNo;
	private String communityTitle;
	private String communityWriter;
	private Date scrapDate;
	
	
	public ScrapCommunity() {}


	public ScrapCommunity(int communityNo, String communityTitle, String communityWriter, Date scrapDate) {
		super();
		this.communityNo = communityNo;
		this.communityTitle = communityTitle;
		this.communityWriter = communityWriter;
		this.scrapDate = scrapDate;
	}


	public int getCommunityNo() {
		return communityNo;
	}


	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}


	public String getCommunityTitle() {
		return communityTitle;
	}


	public void setCommunityTitle(String communityTitle) {
		this.communityTitle = communityTitle;
	}


	public String getCommunityWriter() {
		return communityWriter;
	}


	public void setCommunityWriter(String communityWriter) {
		this.communityWriter = communityWriter;
	}


	public Date getScrapDate() {
		return scrapDate;
	}


	public void setScrapDate(Date scrapDate) {
		this.scrapDate = scrapDate;
	}


	@Override
	public String toString() {
		return "ScrapCommunity [communityNo=" + communityNo + ", communityTitle=" + communityTitle
				+ ", communityWriter=" + communityWriter + ", scrapDate=" + scrapDate + "]";
	}


	
	
}