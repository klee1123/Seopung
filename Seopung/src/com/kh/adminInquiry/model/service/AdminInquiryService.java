package com.kh.adminInquiry.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.adminInquiry.model.dao.AdminInquiryDao;
import com.kh.adminInquiry.model.vo.AdminInquiry;
import com.kh.common.PageInfo;

public class AdminInquiryService {
	
	/**
	 * 관리자 수 조회용 서비스
	 * @return		총 관리자 수 / 여기서는 문의글 수
	 */
	public int selectListCount(int keyfield, String keyword, String status) {
		Connection conn = getConnection();
		
		int listCount = new AdminInquiryDao().selectListCount(conn, keyfield, keyword, status);
		
		close(conn);
		
		return listCount;
		
	}
	
	/**
	 * 관리자 목록 리스트 조회용 / 여기서는 1:1문의글 리스트
	 * @param pi
	 * @return
	 */
	public ArrayList<AdminInquiry> selectList(PageInfo pi, int keyfield, String keyword, String status){
		Connection conn = getConnection();
		
		ArrayList<AdminInquiry> list = new AdminInquiryDao().selectList(conn, pi, keyfield, keyword, status);
		
		close(conn);
		
		return list;
	}

	/**
	 * 아이디 중복 검사용
	 * @param checkId		검사할 아이디 문자열
	 * @return				중복된 아이디 수
	 */
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		
		int count = new AdminInquiryDao().idCheck(conn, checkId);
		
		close(conn);
		
		return count;
	}
	
	
	/**
	 * 특정 회원번호의 회원 정보 조회용
	 * @param adminNo
	 * @return
	 */
	public AdminInquiry selectAdmin(int adminNo) {
		Connection conn = getConnection();
		
		AdminInquiry ad = new AdminInquiryDao().selectAdmin(conn, adminNo);
		
		close(conn);
		
		return ad;
	}
	
}


