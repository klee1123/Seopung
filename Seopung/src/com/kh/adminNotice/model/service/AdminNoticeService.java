package com.kh.adminNotice.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.adminCommunity.model.dao.CommunityDao;
import com.kh.adminCommunity.model.vo.Community;
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
	
	public int increaseCount(int nno) {
		Connection conn = getConnection();
		
		int result = new AdminNoticeDao().increaseCount(conn, nno);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 해당 번호의 공지사항 정보를 조회하는 서비스
	 * @param nno 해당 번호
	 * @return 공지사항 게시글 정보가 반환되는 것
	 */
	public AdminNotice selectAdminNotice(int nno) {
		Connection conn = getConnection();
		
		 AdminNotice n = new AdminNoticeDao().selectAdminNotice(conn, nno);
		
		close(conn);
		
		return n;
	}
	
	public int deleteAdminNotice(String[] nno) {
		Connection conn = getConnection();
		
		int result = new AdminNoticeDao().deleteAdminNotice(conn, nno);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	

}
