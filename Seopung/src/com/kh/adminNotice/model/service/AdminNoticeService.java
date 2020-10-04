package com.kh.adminNotice.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.adminNotice.model.dao.AdminNoticeDao;
import com.kh.adminNotice.model.vo.AdminNotice;
import com.kh.common.PageInfo;

public class AdminNoticeService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new AdminNoticeDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<AdminNotice> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<AdminNotice> list = new AdminNoticeDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}	
	
	// 수정잊지마~
	public int insertAdminNotice(AdminNotice n) {
		Connection conn = getConnection();
		
		int result = new AdminNoticeDao().insertAdminNotice(conn, n);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	

}
