package com.kh.userInquiry.model.service;

import java.sql.Connection;

public class InquiryService {

	/*
	 * 1:1문의 등록용
	 */
	
	public int insertInquiry() {
		Connection conn = getConnection();
		
		int result = new InquiryDao().insertInquiry(conn);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
}
