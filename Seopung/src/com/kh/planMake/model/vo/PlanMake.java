package com.kh.planMake.model.vo;

import java.sql.Date;

public class PlanMake {

	private int planNo;					// 일정번호
	private String planTitle;			// 일정제목
	private String planSdate;			// 시작일 
	private String planEdate;			// 종료일
	private String planAge;				// 연령대
	private String planAcc;				// 동행유무
	private String planBudget;			// 예산금액
	private String planScrapYn;			// 스크랩허용
	private String planPrivate;			// 공개여부
	private String planMemo;			// 작성자메모
	private String planType;			// 여행유형
	private String planTrans;			// 이동수단
	private int planRecommend;			// 추천수
	private int planScrapCount;			// 스크랩수
	private int userNo;					// 회원 번호
	
	private int planMapNo;				// 장소번호
	private String planDay;				// 일정일
	private String planPlace;			// 장소명
	
	private Date sDate;
	private Date eDate;
	
	
	public PlanMake() {
		super();
	}

	// 일정 만들기 - 옵션
		public PlanMake(int planNo, String planTitle, String planSdate, String planEdate, String planAge, String planAcc,
				String planBudget, String planScrapYn, String planPrivate, String planMemo, String planType,
				String planTrans, int userNo) {
			super();
			this.planNo = planNo;
			this.planTitle = planTitle;
			this.planSdate = planSdate;
			this.planEdate = planEdate;
			this.planAge = planAge;
			this.planAcc = planAcc;
			this.planBudget = planBudget;
			this.planScrapYn = planScrapYn;
			this.planPrivate = planPrivate;
			this.planMemo = planMemo;
			this.planType = planType;
			this.planTrans = planTrans;
			this.userNo = userNo;
		}
	
		// 일정만들기 - 장소명
		public PlanMake(int planMapNo, String planDay, String planPlace, int planNo) {
			super();
			this.planMapNo = planMapNo;
			this.planDay = planDay;
			this.planPlace = planPlace;
			this.planNo = planNo;
		}

		
		
	public PlanMake(int planNo, String planTitle, String planSdate, String planEdate, String planAge, String planAcc,
			String planBudget, String planScrapYn, String planPrivate, String planMemo, String planType,
			String planTrans, int planRecommend, int planScrapCount, int userNo) {
		super();
		this.planNo = planNo;
		this.planTitle = planTitle;
		this.planSdate = planSdate;
		this.planEdate = planEdate;
		this.planAge = planAge;
		this.planAcc = planAcc;
		this.planBudget = planBudget;
		this.planScrapYn = planScrapYn;
		this.planPrivate = planPrivate;
		this.planMemo = planMemo;
		this.planType = planType;
		this.planTrans = planTrans;
		this.planRecommend = planRecommend;
		this.planScrapCount = planScrapCount;
		this.userNo = userNo;
	}
	
	public PlanMake(int planNo, String planTitle, int planRecommend) {
		super();
		this.planNo = planNo;
		this.planTitle = planTitle;
		this.planRecommend = planRecommend;
	}

	
	
	// selectPlanPlace
	//public PlanMake(int planMapNo, String planDay, String planPlace, int planNo) {
	//	super();
	//	this.planMapNo = planMapNo;
	//	this.planDay = planDay;
	//	this.planPlace = planPlace;
	//	this.planNo = planNo;
	//}
	
	

	// select / updatePlanMake
	public PlanMake(int planNo, String planTitle, Date sDate, Date eDate, String planAge, String planAcc,
			String planBudget, String planScrapYn, String planPrivate, String planMemo, String planType,
			String planTrans) {
		super();
		this.planNo = planNo;
		this.planTitle = planTitle;
		this.sDate = sDate;
		this.eDate = eDate;
		this.planAge = planAge;
		this.planAcc = planAcc;
		this.planBudget = planBudget;
		this.planScrapYn = planScrapYn;
		this.planPrivate = planPrivate;
		this.planMemo = planMemo;
		this.planType = planType;
		this.planTrans = planTrans;
	}
	
	// updatePlanPlace
	//	public PlanMake(String planDay, String planPlace) {
		//	super();
	//		this.planDay = planDay;
		//	this.planPlace = planPlace;
		//}
		
	

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

	public String getPlanSdate() {
		return planSdate;
	}

	public void setPlanSdate(String planSdate) {
		this.planSdate = planSdate;
	}

	public String getPlanEdate() {
		return planEdate;
	}

	public void setPlanEdate(String planEdate) {
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

	public String getPlanBudget() {
		return planBudget;
	}

	public void setPlanBudget(String planBudget) {
		this.planBudget = planBudget;
	}

	public String getPlanScrapYn() {
		return planScrapYn;
	}

	public void setPlanScrapYn(String planScrapYn) {
		this.planScrapYn = planScrapYn;
	}

	public String getPlanPrivate() {
		return planPrivate;
	}

	public void setPlanPrivate(String planPrivate) {
		this.planPrivate = planPrivate;
	}

	public String getPlanMemo() {
		return planMemo;
	}

	public void setPlanMemo(String planMemo) {
		this.planMemo = planMemo;
	}

	public String getPlanType() {
		return planType;
	}

	public void setPlanType(String planType) {
		this.planType = planType;
	}

	public String getPlanTrans() {
		return planTrans;
	}

	public void setPlanTrans(String planTrans) {
		this.planTrans = planTrans;
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

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public Date getsDate() {
		return sDate;
	}

	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}

	public Date geteDate() {
		return eDate;
	}

	public void seteDate(Date eDate) {
		this.eDate = eDate;
	}

	@Override
	public String toString() {
		return "PlanMake [planNo=" + planNo + ", planTitle=" + planTitle + ", planSdate=" + planSdate + ", planEdate="
				+ planEdate + ", planAge=" + planAge + ", planAcc=" + planAcc + ", planBudget=" + planBudget
				+ ", planScrapYn=" + planScrapYn + ", planPrivate=" + planPrivate + ", planMemo=" + planMemo
				+ ", planType=" + planType + ", planTrans=" + planTrans + ", planRecommend=" + planRecommend
				+ ", planScrapCount=" + planScrapCount + ", userNo=" + userNo
				+  ", sDate=" + sDate + ", eDate=" + eDate + "]";
	}

	
	
	
}
