package com.kh.planMap.model.vo;

public class PlanMap {

	private String planMapNo;		// 좌표번호
	private String planDay;		// 일정일
	private String orderNo;		// 순서
	private String placeName;	// 한줄메모
	private String planNo;		// 일정번호
	
	public PlanMap() {}

	public PlanMap(String planDay, String orderNo, String placeName, String planNo) {
		super();
		this.planDay = planDay;
		this.orderNo = orderNo;
		this.placeName = placeName;
		this.planNo = planNo;
	}

	public String getPlanMapNo() {
		return planMapNo;
	}

	public void setPlanMapNo(String planMapNo) {
		this.planMapNo = planMapNo;
	}

	public String getPlanDay() {
		return planDay;
	}

	public void setPlanDay(String planDay) {
		this.planDay = planDay;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getPlanNo() {
		return planNo;
	}

	public void setPlanNo(String planNo) {
		this.planNo = planNo;
	}

	@Override
	public String toString() {
		return "PlanMap [planMapNo=" + planMapNo + ", planDay=" + planDay + ", orderNo=" + orderNo + ", placeName="
				+ placeName + ", planNo=" + planNo + "]";
	}
	
	
	
	

}
