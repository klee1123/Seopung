package com.kh.searchPlan.model.vo;

import java.util.Arrays;

public class SearchPlan {
	
	private String sDate;
	private String eDate;
	private String[] age;
	private String type;
	private String[] trans;
	private String keyword;
	
	public SearchPlan() {
		
	}

	public SearchPlan(String sDate, String eDate, String[] age, String type, String[] trans, String keyword) {
		super();
		this.sDate = sDate;
		this.eDate = eDate;
		this.age = age;
		this.type = type;
		this.trans = trans;
		this.keyword = keyword;
	}

	public String getsDate() {
		return sDate;
	}

	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

	public String geteDate() {
		return eDate;
	}

	public void seteDate(String eDate) {
		this.eDate = eDate;
	}

	public String[] getAge() {
		return age;
	}

	public void setAge(String[] age) {
		this.age = age;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String[] getTrans() {
		return trans;
	}

	public void setTrans(String[] trans) {
		this.trans = trans;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchPlan [sDate=" + sDate + ", eDate=" + eDate + ", age=" + Arrays.toString(age) + ", type=" + type
				+ ", trans=" + Arrays.toString(trans) + ", keyword=" + keyword + "]";
	}
	
}
