package com.kh.adminInquiry.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.adminInquiry.model.dao.AdminInquiryDao;
import com.kh.adminInquiry.model.vo.AdminInquiry;
import com.kh.adminNotice.model.dao.AdminNoticeDao;
import com.kh.adminNotice.model.vo.AdminNotice;
import com.kh.common.PageInfo;

public class AdminInquiryService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new AdminInquiryDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<AdminInquiry> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<AdminInquiry> list = new AdminInquiryDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}	
	
	// 1:1문의글 조회
	public AdminInquiry selectAdminInquiry(int ino) {
		Connection conn = getConnection();
		
		 AdminInquiry i = new AdminInquiryDao().selectAdminInquiry(conn, ino);
		
		close(conn);
		
		return i;
	}
	

}
