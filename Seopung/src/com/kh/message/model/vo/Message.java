package com.kh.message.model.vo;

import java.sql.Date;

public class Message {

	private int massageNo;					// 메세지번호
	private String userId;					// 아이디
	private String userNick;				// 닉네임
	private String messageContent;			// 메세지내용
	private Date messageDate;				// 메세지발신,수신날짜
	private String status;					// 상태값
	private int userNo;						// 발신자
	private int userNo2;					// 수신자
	
	
	public Message() {}

	public Message(int massageNo, String messageContent, Date messageDate, String status, int userNo, int userNo2) {
		super();
		this.massageNo = massageNo;
		this.messageContent = messageContent;
		this.messageDate = messageDate;
		this.status = status;
		this.userNo = userNo;
		this.userNo2 = userNo2;
	}
	
	
	

	public Message(int massageNo, String userId, String userNick, String messageContent, Date messageDate, int userNo,
			int userNo2) {
		super();
		this.massageNo = massageNo;
		this.userId = userId;
		this.userNick = userNick;
		this.messageContent = messageContent;
		this.messageDate = messageDate;
		this.userNo = userNo;
		this.userNo2 = userNo2;
	}

	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public int getMassageNo() {
		return massageNo;
	}

	public void setMassageNo(int massageNo) {
		this.massageNo = massageNo;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public Date getMessageDate() {
		return messageDate;
	}

	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getUserNo2() {
		return userNo2;
	}

	public void setUserNo2(int userNo1) {
		this.userNo2 = userNo1;
	}

	@Override
	public String toString() {
		return "Message [massageNo=" + massageNo + ", messageContent=" + messageContent + ", messageDate=" + messageDate
				+ ", status=" + status + ", userNo=" + userNo + ", userNo1=" + userNo2 + "]";
	}
	
	
	
	
	
	
}
