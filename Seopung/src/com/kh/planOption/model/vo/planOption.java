package com.kh.planOption.model.vo;

import java.sql.Date;

public class planOption {

	private int planNo;					// 일정번호
	private String planTitle;			// 일정제목
	private Date planSdate;				// 시작일 
	private Date planEdate;				// 종료일
	private String planAge;				// 연령대
	private String planAcc;				// 동행유무
	private String gender;				// 예산금액
	private String phone;				// 스크랩허용
	private String email;				// 공개여부
	private Date enrollDate;			// 작성자메모
	private Date modifyDate;			// 해시태그
	private String userIntro;			// 임시저장
	private String profile;				// 여행유형
	private String status;				// 이동수단
	private int planRecommend;			// 추천수
	private int planScrapCount;			// 스크랩수
	
	
	public planOption() {
		
	}

	
	public planOption(int planNo, String planTitle, Date planSdate, Date planEdate, String planAge, String planAcc,
			String gender, String phone, String email, Date enrollDate, Date modifyDate, String userIntro,
			String profile, String status, int planRecommend, int planScrapCount) {
		super();
		this.planNo = planNo;
		this.planTitle = planTitle;
		this.planSdate = planSdate;
		this.planEdate = planEdate;
		this.planAge = planAge;
		this.planAcc = planAcc;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.userIntro = userIntro;
		this.profile = profile;
		this.status = status;
		this.planRecommend = planRecommend;
		this.planScrapCount = planScrapCount;
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


	public Date getPlanSdate() {
		return planSdate;
	}


	public void setPlanSdate(Date planSdate) {
		this.planSdate = planSdate;
	}


	public Date getPlanEdate() {
		return planEdate;
	}


	public void setPlanEdate(Date planEdate) {
		this.planEdate = planEdate;
	}


	public String getPlanAge() {
		return planAge;
	}


	public void setPlanAge(String planAge) {
		this.planAge = planAge;
	}


	public String getPlanAcc() {
		return planAcc;
	}


	public void setPlanAcc(String planAcc) {
		this.planAcc = planAcc;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
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


	public String getUserIntro() {
		return userIntro;
	}


	public void setUserIntro(String userIntro) {
		this.userIntro = userIntro;
	}


	public String getProfile() {
		return profile;
	}


	public void setProfile(String profile) {
		this.profile = profile;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getPlanRecommend() {
		return planRecommend;
	}


	public void setPlanRecommend(int planRecommend) {
		this.planRecommend = planRecommend;
	}


	public int getPlanScrapCount() {
		return planScrapCount;
	}


	public void setPlanScrapCount(int planScrapCount) {
		this.planScrapCount = planScrapCount;
	}


	
	@Override
	public String toString() {
		return "planOption [planNo=" + planNo + ", planTitle=" + planTitle + ", planSdate=" + planSdate + ", planEdate="
				+ planEdate + ", planAge=" + planAge + ", planAcc=" + planAcc + ", gender=" + gender + ", phone="
				+ phone + ", email=" + email + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate
				+ ", userIntro=" + userIntro + ", profile=" + profile + ", status=" + status + ", planRecommend="
				+ planRecommend + ", planScrapCount=" + planScrapCount + "]";
	}

	
	

}
