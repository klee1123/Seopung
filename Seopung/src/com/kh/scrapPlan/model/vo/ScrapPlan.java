package com.kh.scrapPlan.model.vo;

import java.sql.Date;

public class ScrapPlan {
	
	private int planNo;
	private String planTitle;
	private String planWriter;
	private Date pScrapDate;
	
	public ScrapPlan() {}

	public ScrapPlan(int planNo, String planTitle, String planWriter, Date pScrapDate) {
		super();
		this.planNo = planNo;
		this.planTitle = planTitle;
		this.planWriter = planWriter;
		this.pScrapDate = pScrapDate;
	}

	public int getPlanNo() {
		return planNo;
	}

	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}

	public String getPlanTitle() {
		return planTitle;
	}

	public void setPlanTitle(String planTitle) {
		this.planTitle = planTitle;
	}

	public String getPlanWriter() {
		return planWriter;
	}

	public void setPlanWriter(String planWriter) {
		this.planWriter = planWriter;
	}

	public Date getpScrapDate() {
		return pScrapDate;
	}

	public void setpScrapDate(Date pScrapDate) {
		this.pScrapDate = pScrapDate;
	}

	@Override
	public String toString() {
		return "ScrapPlan [planNo=" + planNo + ", planTitle=" + planTitle + ", planWriter=" + planWriter
				+ ", pScrapDate=" + pScrapDate + "]";
	}

}