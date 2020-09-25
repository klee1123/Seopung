package com.kh.planMap.model.vo;

import java.sql.Date;

public class planMap {

	private int planXyNo;		// 좌표번호
	private Date planDay;		// 일정일
	private int orderNo;		// 순서
	private String lineMemo;	// 한줄메모
	private String latitude;	// 위도
	private String longitude;	// 경도
	
	public planMap(int planXyNo, Date planDay, int orderNo, String lineMemo, String latitude, String longitude) {
		super();
		this.planXyNo = planXyNo;
		this.planDay = planDay;
		this.orderNo = orderNo;
		this.lineMemo = lineMemo;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public int getPlanXyNo() {
		return planXyNo;
	}

	public void setPlanXyNo(int planXyNo) {
		this.planXyNo = planXyNo;
	}

	public Date getPlanDay() {
		return planDay;
	}

	public void setPlanDay(Date planDay) {
		this.planDay = planDay;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getLineMemo() {
		return lineMemo;
	}

	public void setLineMemo(String lineMemo) {
		this.lineMemo = lineMemo;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	
	@Override
	public String toString() {
		return "planMap [planXyNo=" + planXyNo + ", planDay=" + planDay + ", orderNo=" + orderNo + ", lineMemo="
				+ lineMemo + ", latitude=" + latitude + ", longitude=" + longitude + "]";
	}
	
	
	
	
	
	
	
}
