package com.kh.recommend.model.vo;

import java.sql.Date;

public class Recommend {

	private int reNo;
	private String title;
	private String content;
	private Date enroll;
	private Date modify;
	private int count;
	private int like;
	private String status;
	private String thumb;
	private int userNo;
	
	public Recommend() {}

	public Recommend(int reNo, String title, String content, Date enroll, Date modify, int count, int like,
			String status, String thumb, int userNo) {
		super();
		this.reNo = reNo;
		this.title = title;
		this.content = content;
		this.enroll = enroll;
		this.modify = modify;
		this.count = count;
		this.like = like;
		this.status = status;
		this.thumb = thumb;
		this.userNo = userNo;
	}

	public int getReNo() {
		return reNo;
	}

	public void setReNo(int reNo) {
		this.reNo = reNo;
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

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
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

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Recommend [reNo=" + reNo + ", title=" + title + ", content=" + content + ", enroll=" + enroll
				+ ", modify=" + modify + ", count=" + count + ", like=" + like + ", status=" + status + ", thumb="
				+ thumb + ", userNo=" + userNo + "]";
	}
	
	
}
