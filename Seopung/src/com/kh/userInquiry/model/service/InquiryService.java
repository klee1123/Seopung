package com.kh.userInquiry.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.userInquiry.model.dao.InquiryDao;
import com.kh.userInquiry.model.vo.Inquiry;

public class InquiryService {

	/*
	 * 1:1문의 등록용
	 */
	
	public int insertInquiry(Inquiry iq) {
		Connection conn = getConnection();
		
		int result = new InquiryDao().insertInquiry(conn, iq);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	

}



