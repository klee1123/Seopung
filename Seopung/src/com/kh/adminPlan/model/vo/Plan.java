package com.kh.adminPlan.model.vo;

import java.sql.Date;

public class Plan {

	private int planNo;
	private String planTitle;
	private Date startDate;
	private Date endDate;
	private String age;
	private String accompany;
	private String budget;
	private String scrapYN;
	private String privateYN;
	private String memo;
	private String hashtag;
	private String tempYN;
	private String planType;
	private String transrportations;
	private int recommendCount;
	private int scrapCount;
	private String planWriter; // 회원번호 또는 회원아이디 담기
	
	
	public Plan() {
		
	}


	public Plan(int planNo, String planTitle, Date startDate, Date endDate, String age, String accompany, String budget,
			String scrapYN, String privateYN, String memo, String hashtag, String tempYN, String planType,
			String transrportations, int recommendCount, int scrapCount, String planWriter) {
		super();
		this.planNo = planNo;
		this.planTitle = planTitle;
		this.startDate = startDate;
		this.endDate = endDate;
		this.age = age;
		this.accompany = accompany;
		this.budget = budget;
		this.scrapYN = scrapYN;
		this.privateYN = privateYN;
		this.memo = memo;
		this.hashtag = hashtag;
		this.tempYN = tempYN;
		this.planType = planType;
		this.transrportations = transrportations;
		this.recommendCount = recommendCount;
		this.scrapCount = scrapCount;
		this.planWriter = planWriter;
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


	public Date getStartDate() {
		return startDate;
	}


	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getAccompany() {
		return accompany;
	}


	public void setAccompany(String accompany) {
		this.accompany = accompany;
	}


	public String getBudget() {
		return budget;
	}


	public void setBudget(String budget) {
		this.budget = budget;
	}


	public String getScrapYN() {
		return scrapYN;
	}


	public void setScrapYN(String scrapYN) {
		this.scrapYN = scrapYN;
	}


	public String getPrivateYN() {
		return privateYN;
	}


	public void setPrivateYN(String privateYN) {
		this.privateYN = privateYN;
	}


	public String getMemo() {
		return memo;
	}


	public void setMemo(String memo) {
		this.memo = memo;
	}


	public String getHashtag() {
		return hashtag;
	}


	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}


	public String getTempYN() {
		return tempYN;
	}


	public void setTempYN(String tempYN) {
		this.tempYN = tempYN;
	}


	public String getPlanType() {
		return planType;
	}


	public void setPlanType(String planType) {
		this.planType = planType;
	}


	public String getTransrportations() {
		return transrportations;
	}


	public void setTransrportations(String transrportations) {
		this.transrportations = transrportations;
	}


	public int getRecommendCount() {
		return recommendCount;
	}


	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}


	public int getScrapCount() {
		return scrapCount;
	}


	public void setScrapCount(int scrapCount) {
		this.scrapCount = scrapCount;
	}


	public String getPlanWriter() {
		return planWriter;
	}


	public void setPlanWriter(String planWriter) {
		this.planWriter = planWriter;
	}


	@Override
	public String toString() {
		return "Plan [planNo=" + planNo + ", planTitle=" + planTitle + ", startDate=" + startDate + ", endDate="
				+ endDate + ", age=" + age + ", accompany=" + accompany + ", budget=" + budget + ", scrapYN=" + scrapYN
				+ ", privateYN=" + privateYN + ", memo=" + memo + ", hashtag=" + hashtag + ", tempYN=" + tempYN
				+ ", planType=" + planType + ", transrportations=" + transrportations + ", recommendCount="
				+ recommendCount + ", scrapCount=" + scrapCount + ", planWriter=" + planWriter + "]";
	}
	
}
