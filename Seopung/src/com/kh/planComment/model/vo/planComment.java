package com.kh.planComment.model.vo;

import java.sql.Date;

public class planComment {

		private int commentNo;				// 댓글번호
		private String commentContent;		// 댓글내용
		private Date commentDate;			// 작성일
		private Date commentModify;			// 수정일
		private String commentStatus;		// 상태
		
		
		
		
		public planComment() {
			
		}
		
		public planComment(int commentNo, String commentContent, Date commentDate, Date commentModify,
				String commentStatus) {
			super();
			this.commentNo = commentNo;
			this.commentContent = commentContent;
			this.commentDate = commentDate;
			this.commentModify = commentModify;
			this.commentStatus = commentStatus;
		}
		
		
		public int getCommentNo() {
			return commentNo;
		}
		public void setCommentNo(int commentNo) {
			this.commentNo = commentNo;
		}
		public String getCommentContent() {
			return commentContent;
		}
		public void setCommentContent(String commentContent) {
			this.commentContent = commentContent;
		}
		public Date getCommentDate() {
			return commentDate;
		}
		public void setCommentDate(Date commentDate) {
			this.commentDate = commentDate;
		}
		public Date getCommentModify() {
			return commentModify;
		}
		public void setCommentModify(Date commentModify) {
			this.commentModify = commentModify;
		}
		public String getCommentStatus() {
			return commentStatus;
		}
		public void setCommentStatus(String commentStatus) {
			this.commentStatus = commentStatus;
		}
		
		@Override
		public String toString() {
			return "planComment [commentNo=" + commentNo + ", commentContent=" + commentContent + ", commentDate="
					+ commentDate + ", commentModify=" + commentModify + ", commentStatus=" + commentStatus + "]";
		}
		
		
		
		
		
		
		
		
	
	
	
}



