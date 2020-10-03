package com.kh.planPage.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.planPage.model.vo.PlanPage;
import com.kh.admin.model.dao.AdminDao;
import com.kh.admin.model.vo.Admin;
import com.kh.common.PageInfo;
import com.kh.planPage.model.dao.PlanPageDao;

public class PlanPageService {
	
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




	
	
}


