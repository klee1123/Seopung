package com.kh.admin.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.model.dao.AdminDao;
import com.kh.admin.model.vo.Admin;
import com.kh.common.PageInfo;

public class AdminService {
	
	/**
	 * 관리자 수 조회용 서비스
	 * @return		총 관리자 수
	 */
	public int selectListCount(int keyfield, String keyword, String status) {
		Connection conn = getConnection();
		
		int listCount = new AdminDao().selectListCount(conn, keyfield, keyword, status);
		
		close(conn);
		
		return listCount;
		
	}
	
	/**
	 * 관리자 목록 리스트 조회용
	 * @param pi
	 * @return
	 */
	public ArrayList<Admin> selectList(PageInfo pi, int keyfield, String keyword, String status){
		Connection conn = getConnection();
		
		ArrayList<Admin> list = new AdminDao().selectList(conn, pi, keyfield, keyword, status);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 관리자 등록용
	 * @param ad
	 * @return
	 */
	public int insertAdmin(Admin ad) {
		Connection conn = getConnection();
		
		int result = new AdminDao().insertAdmin(conn, ad);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	/**
	 * 아이디 중복 검사용
	 * @param checkId		검사할 아이디 문자열
	 * @return				중복된 아이디 수
	 */
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		
		int count = new AdminDao().idCheck(conn, checkId);
		
		close(conn);
		
		return count;
	}
	
	
	/**
	 * 특정 회원번호의 회원 정보 조회용
	 * @param adminNo
	 * @return
	 */
	public Admin selectAdmin(int adminNo) {
		Connection conn = getConnection();
		
		Admin ad = new AdminDao().selectAdmin(conn, adminNo);
		
		close(conn);
		
		return ad;
	}
	
	/**
	 * 관리자 정보 수정용
	 * @param ad
	 * @return
	 */
	public int updateAdmin(Admin ad) {
		Connection conn = getConnection();
		
		int result = new AdminDao().updateAdmin(conn, ad);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	/**
	 * 관리자 탈퇴용 서비스
	 * @param delAdminNo	탈퇴한 관리자번호
	 * @return				처리된 행 수 
	 */
	public int deleteAdmin(int delAdminNo) {
		Connection conn = getConnection();
		
		int result = new AdminDao().deleteAdmin(conn, delAdminNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
}






















