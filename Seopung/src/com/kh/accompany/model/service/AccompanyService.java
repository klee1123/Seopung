package com.kh.accompany.model.service;


import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.Member.model.vo.Member;
import com.kh.accompany.model.dao.AccompanyDao;
import com.kh.accompany.model.vo.Accompany;
import com.kh.adminMember.model.vo.Report;
import com.kh.common.PageInfo;

public class AccompanyService {

	public int selectListCount(int userNo) {
		
		Connection conn = getConnection();
		
		int listCount = new AccompanyDao().selectListCount(conn, userNo);
		
		close(conn);
		
		return listCount;
		
		
		
		
		
	}
	
	
	public ArrayList<Accompany> selectList(PageInfo pi, int userNo){
		
		Connection conn = getConnection();
		
		ArrayList<Accompany> list = new AccompanyDao().selectList(conn, pi, userNo);
		
		close(conn);
		
		return list;
		
		
		
	}
	
	public int deleteAccom(int accomNo) {
		
		Connection conn = getConnection();
		
		int result = new AccompanyDao().deleteAccom(conn, accomNo);
		
		if(result > 0) {
			
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public Member accomProfile(String userId){
		
		Connection conn = getConnection();
		
		Member profile = new AccompanyDao().accomProfile(conn, userId);
		
		close(conn);
		
		return profile;
		
		
		
		
	}
	
	public int sendMessage(int senderNo, int receiverNo, String introduction) {
		
		Connection conn = getConnection();
		
		int result = new AccompanyDao().sendMessage(conn, senderNo, receiverNo, introduction);
		
		if(result > 0 ) {
			
			commit(conn);
			
		}else {
			
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
		
	}
	
	public int checkReport(Report accomReport) {
		
		Connection conn = getConnection();
		
		int result = new AccompanyDao().checkReport(conn, accomReport);
		
		close(conn);
		
		return result;
		
		
		
	}
	
	
	
	
	
	public int insertReport(Report accomReport) {
		
		Connection conn = getConnection();
		
		int result = new AccompanyDao().insertReport(conn, accomReport);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		close(conn);
		
		return result;
		
	}
	
	public int updateReport(int accomNo) {
		
		Connection conn = getConnection();
		
		int result = new AccompanyDao().updateReport(conn, accomNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
				
		return result;
		
	}
	
	
	public int selectRequestListCount(int userNo) {
		
		Connection conn = getConnection();
		
		int listCount = new AccompanyDao().selectRequestListCount(conn, userNo);
		
		close(conn);
		
		return listCount;
		
		
		
	}
	
	public ArrayList<Accompany> selectRequestList(PageInfo pi, int userNo){
		
		Connection conn = getConnection();
		
		ArrayList<Accompany> list = new AccompanyDao().selectRequestList(conn, pi, userNo);
		
		close(conn);
		
		return list;
		
		
	}
	
	public int agree(int accomNo) {
		
		Connection conn = getConnection();
		
		int result = new AccompanyDao().agree(conn, accomNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
	}
	
	public int cancel(int accomNo) {
		
		Connection conn = getConnection();
		
		int result = new AccompanyDao().cancel(conn, accomNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
	}
	
	public int selectResponseListCount(int userNo) {
		
		
		Connection conn = getConnection();
		
		int listCount = new AccompanyDao().selectResponseListCount(conn, userNo);
		
		close(conn);
		
		return listCount;
		
		
		
	}
	
	public ArrayList<Accompany> selectResponseList(PageInfo pi, int userNo){
		
		Connection conn = getConnection();
		
		ArrayList<Accompany> list = new AccompanyDao().selectResponseList(conn, pi, userNo);
		
		close(conn);
		
		return list;
	
	
	}
	
	
	
	
}
