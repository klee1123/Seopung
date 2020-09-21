package com.kh.recommend.model.vo;

import java.sql.Date;

public class Recommend {

	private int recommendNo;			//추천코스 글번호
	private String recommendTitle;		// 제목
	private String recommendContent;	// 내용
	private String recommendWriter;		// 관리자번호 또는 "관리자"
	private Date enrollDate;			// 등록일
	private int count;					// 조회수
	private int like;					// 추천수
	private String status;				// 상태값(Y/N)
	private String thumbnailPath;		// 썸네일주소
	
	public Recommend() {
		
	}

	public Recommend(int recommendNo, String recommendTitle, String recommendContent, String recommendWriter,
			Date enrollDate, int count, int like, String status, String thumbnailPath) {
		super();
		this.recommendNo = recommendNo;
		this.recommendTitle = recommendTitle;
		this.recommendContent = recommendContent;
		this.recommendWriter = recommendWriter;
		this.enrollDate = enrollDate;
		this.count = count;
		this.like = like;
		this.status = status;
		this.thumbnailPath = thumbnailPath;
	}

	public int getRecommendNo() {
		return recommendNo;
	}

	public void setRecommendNo(int recommendNo) {
		this.recommendNo = recommendNo;
	}

	public String getRecommendTitle() {
		return recommendTitle;
	}

	public void setRecommendTitle(String recommendTitle) {
		this.recommendTitle = recommendTitle;
	}

	public String getRecommendContent() {
		return recommendContent;
	}

	public void setRecommendContent(String recommendContent) {
		this.recommendContent = recommendContent;
	}

	public String getRecommendWriter() {
		return recommendWriter;
	}

	public void setRecommendWriter(String recommendWriter) {
		this.recommendWriter = recommendWriter;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
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

	public String getThumbnailPath() {
		return thumbnailPath;
	}

	public void setThumbnailPath(String thumbnailPath) {
		this.thumbnailPath = thumbnailPath;
	}

	@Override
	public String toString() {
		return "Recommend [recommendNo=" + recommendNo + ", recommendTitle=" + recommendTitle + ", recommendContent="
				+ recommendContent + ", recommendWriter=" + recommendWriter + ", enrollDate=" + enrollDate + ", count="
				+ count + ", like=" + like + ", status=" + status + ", thumbnailPath=" + thumbnailPath + "]";
	}
	
}
