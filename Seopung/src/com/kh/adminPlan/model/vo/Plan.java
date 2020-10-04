package com.kh.adminPlan.model.vo;

import java.sql.Date;

public class Plan {

	private int planNo;				//일정번호
	private String planTitle;		//일정제목
	private Date startDate;			//일정시작일
	private Date endDate;			//일정종료일
	private String age;				//나이선택
	private String accompany;		//동행여부
	private String budget;			//예산
	private String scrapYN;			//스크랩가능여부
	private String privateYN;		//공개y, 비공개n
	private String memo;			//일정메모
	private String hashtag;			//해시태그   --- 삭제
	private String tempYN;			//임시저장	 --- 삭제
	private String planType;		//여행유형
	private String transrportations;//여행이동수단
	private int recommendCount;		//추천수
	private int scrapCount;			//스크랩수
	private String planWriter; 		//작성자번호 또는 회원아이디 담기
	private String status;			//상태값
	private Date enrollDate;		//작성일
	private Date modifyDate;		//수정일
	private int count;				//조회수
	private String userNick;		//닉네임
	private int userNo;				//회원번호
	private String profile;			//프로필사진경로
	
	public Plan() {
		
	}


	public Plan(int planNo, String planTitle, Date startDate, Date endDate, String age, String accompany, String budget,
			String scrapYN, String privateYN, String memo, String hashtag, String tempYN, String planType,
			String transrportations, int recommendCount, int scrapCount, String planWriter, String status,
			Date enrollDate, Date modifyDate, int count) {
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
		this.status = status;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.count = count;
	}


	public Plan(int planNo, String planTitle, String planWriter, Date enrollDate, int count) {
		super();
		this.planNo = planNo;
		this.planTitle = planTitle;
		this.planWriter = planWriter;
		this.enrollDate = enrollDate;
		this.count = count;
	}


	public Plan(int planNo, String planTitle, Date startDate, Date endDate, String age, String accompany, String budget,
			String scrapYN, String memo, String planType, String transrportations, int recommendCount, int scrapCount,
			String planWriter, String userNick, int userNo, String profile) {
		super();
		this.planNo = planNo;
		this.planTitle = planTitle;
		this.startDate = startDate;
		this.endDate = endDate;
		this.age = age;
		this.accompany = accompany;
		this.budget = budget;
		this.scrapYN = scrapYN;
		this.memo = memo;
		this.planType = planType;
		this.transrportations = transrportations;
		this.recommendCount = recommendCount;
		this.scrapCount = scrapCount;
		this.planWriter = planWriter;
		this.userNick = userNick;
		this.userNo = userNo;
		this.profile = profile;
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


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
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


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public String getUserNick() {
		return userNick;
	}


	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getProfile() {
		return profile;
	}


	public void setProfile(String profile) {
		this.profile = profile;
	}


	@Override
	public String toString() {
		return "Plan [planNo=" + planNo + ", planTitle=" + planTitle + ", startDate=" + startDate + ", endDate="
				+ endDate + ", age=" + age + ", accompany=" + accompany + ", budget=" + budget + ", scrapYN=" + scrapYN
				+ ", privateYN=" + privateYN + ", memo=" + memo + ", hashtag=" + hashtag + ", tempYN=" + tempYN
				+ ", planType=" + planType + ", transrportations=" + transrportations + ", recommendCount="
				+ recommendCount + ", scrapCount=" + scrapCount + ", planWriter=" + planWriter + ", status=" + status
				+ ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", count=" + count + "]";
	}

	
}
