package com.kh.searchPlan.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.adminPlan.model.vo.Plan;
import com.kh.common.PageInfo;
import com.kh.searchPlan.model.dao.PlanSearchDao;
import com.kh.searchPlan.model.vo.SearchPlan;

public class PlanSearchService {
	
	/**
	 * 조회 조건에 따른 게시글 수 조회하는 서비스
	 * @param keyfield
	 * @param keyword
	 * @param head
	 * @return
	 */
	public int selectListCount(SearchPlan filter) {
		Connection conn = getConnection();
		
		int listCount = new PlanSearchDao().selectListCount(conn, filter);
		
		close(conn);
		
		return listCount;
	}
	
	
	/**
	 * @param pi
	 * @param keyfield
	 * @param keyword
	 * @param head
	 * @return
	 */
	public ArrayList<Plan> selectList(PageInfo pi, SearchPlan filter){
		Connection conn = getConnection();
		
		ArrayList<Plan> list = new PlanSearchDao().selectList(conn, pi, filter);
		
		close(conn);
		
		return list;
	}

}
