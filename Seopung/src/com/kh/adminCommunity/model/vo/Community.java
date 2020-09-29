package com.kh.adminCommunity.model.vo;

import java.sql.Date;

/**
 * @author kl
 *
 */
public class Community {
	
	private int communityNo;				//글번호
	private String communityWriter;			//회원번호,작성자아이디
	private String title;					//커뮤니티제목
	private String content;					//커뮤니티내용
	private Date enrollDate;				//커뮤니티등록일
	private Date modifyDate;				//커뮤니티수정일
	private int count;						//커뮤니티조회수
	private int scrapCount;					//커뮤니티스크랩수
	private int recommendCount;				//추천수
	private String status;					//상태값(Y/N)
	private String thumbnailPath;			//썸네일 파일
	private String head;					//말머리 유형(공지/명소/맛집)
	
	public Community() {
		
	}

	public Community(int communityNo, String communityWriter, String title, String content, Date enrollDate,
			Date modifyDate, int count, int scrapCount, int recommendCount, String status, String thumbnailPath,
			String head) {
		super();
		this.communityNo = communityNo;
		this.communityWriter = communityWriter;
		this.title = title;
		this.content = content;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.count = count;
		this.scrapCount = scrapCount;
		this.recommendCount = recommendCount;
		this.status = status;
		this.thumbnailPath = thumbnailPath;
		this.head = head;
	}

	public Community(int communityNo, String communityWriter, String title, Date enrollDate, int count, String head) {
		super();
		this.communityNo = communityNo;
		this.communityWriter = communityWriter;
		this.title = title;
		this.enrollDate = enrollDate;
		this.count = count;
		this.head = head;
	}

	
	public Community(int communityNo, String communityWriter, String title, String content, Date enrollDate, int count,
			int scrapCount, int recommendCount, String thumbnailPath, String head) {
		super();
		this.communityNo = communityNo;
		this.communityWriter = communityWriter;
		this.title = title;
		this.content = content;
		this.enrollDate = enrollDate;
		this.count = count;
		this.scrapCount = scrapCount;
		this.recommendCount = recommendCount;
		this.thumbnailPath = thumbnailPath;
		this.head = head;
	}

	public int getCommunityNo() {
		return communityNo;
	}

	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}

	public String getCommunityWriter() {
		return communityWriter;
	}

	public void setCommunityWriter(String communityWriter) {
		this.communityWriter = communityWriter;
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

	public int getScrapCount() {
		return scrapCount;
	}

	public void setScrapCount(int scrapCount) {
		this.scrapCount = scrapCount;
	}

	public int getRecommendCount() {
		return recommendCount;
	}

	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
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

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	@Override
	public String toString() {
		return "Community [communityNo=" + communityNo + ", communityWriter=" + communityWriter + ", title=" + title
				+ ", content=" + content + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", count="
				+ count + ", scrapCount=" + scrapCount + ", recommendCount=" + recommendCount + ", status=" + status
				+ ", thumbnailPath=" + thumbnailPath + ", head=" + head + "]";
	}

	
}
