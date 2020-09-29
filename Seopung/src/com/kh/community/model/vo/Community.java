package com.kh.community.model.vo;

import java.sql.Date;

public class Community {

	private int comNo;
	private int userNo;
	private String title;
	private String content;
	private Date enroll;
	private Date modify;
	private int count;
	private int scrap;
	private int recommend;
	private String status;
	private String thumb;
	private String head;
	
	public Community() {}

	public Community(int comNo, int userNo, String title, String content, Date enroll, Date modify, int count,
			int scrap, int recommend, String status, String thumb, String head) {
		super();
		this.comNo = comNo;
		this.userNo = userNo;
		this.title = title;
		this.content = content;
		this.enroll = enroll;
		this.modify = modify;
		this.count = count;
		this.scrap = scrap;
		this.recommend = recommend;
		this.status = status;
		this.thumb = thumb;
		this.head = head;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getEnroll() {
		return enroll;
	}

	public void setEnroll(Date enroll) {
		this.enroll = enroll;
	}

	public Date getModify() {
		return modify;
	}

	public void setModify(Date modify) {
		this.modify = modify;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getScrap() {
		return scrap;
	}

	public void setScrap(int scrap) {
		this.scrap = scrap;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	@Override
	public String toString() {
		return "Community [comNo=" + comNo + ", userNo=" + userNo + ", title=" + title + ", content=" + content
				+ ", enroll=" + enroll + ", modify=" + modify + ", count=" + count + ", scrap=" + scrap + ", recommend="
				+ recommend + ", status=" + status + ", thumb=" + thumb + ", head=" + head + "]";
	}
	
	
}
