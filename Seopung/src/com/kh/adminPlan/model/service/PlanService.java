package com.kh.adminPlan.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.adminCommunity.model.vo.Community;
import com.kh.adminPlan.model.dao.PlanDao;
import com.kh.adminPlan.model.vo.Plan;
import com.kh.common.PageInfo;

public class PlanService {

	/**
	 * 일정 목록 조회 조건에 따른 게시글 수 조회하는 서비스
	 * @param keyfield
	 * @param keyword
	 * @return
	 */
	public int selectListCount(int keyfield, String keyword) {
		Connection conn = getConnection();
		
		int listCount = new PlanDao().selectListCount(conn, keyfield, keyword);
		
		close(conn);
		
		return listCount;
	}
	
	
	/**
	 * 일정 목록 조회 조건에 따른 게시글 조회하는 서비스
	 * @param pi
	 * @param keyfield
	 * @param keyword
	 * @return
	 */
	public ArrayList<Plan> selectList(PageInfo pi, int keyfield, String keyword){
		Connection conn = getConnection();
		
		ArrayList<Plan> list = new PlanDao().selectList(conn, pi, keyfield, keyword);
		
		close(conn);
		
		return list;
	}
}
