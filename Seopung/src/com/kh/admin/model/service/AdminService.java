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
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new AdminDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	/**
	 * 관리자 목록 리스트 조회용
	 * @param pi
	 * @return
	 */
	public ArrayList<Admin> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Admin> list = new AdminDao().selectList(conn, pi);
		
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
}






















