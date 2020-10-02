package com.kh.scrapPlan.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.PageInfo;
import com.kh.scrapPlan.model.dao.ScrapPlanDao;
import com.kh.scrapPlan.model.vo.ScrapPlan;

public class ScrapPlanService {
	
	public int selectListCount(int userNo) {
		Connection conn = getConnection();
		
		int listCount = new ScrapPlanDao().selectListCount(conn, userNo);
	
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<ScrapPlan> selectList(PageInfo pi , int userNo) {
		
		Connection conn = getConnection();
		
		ArrayList<ScrapPlan> list = new ScrapPlanDao().selectList(conn, pi, userNo);
		
		close(conn);
		
		return list;
	}

}
