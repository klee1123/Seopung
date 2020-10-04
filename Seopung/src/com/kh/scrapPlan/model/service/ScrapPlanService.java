package com.kh.scrapPlan.model.service;

import static com.kh.common.JDBCTemplate.*;
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

	public int deleteList(String[] spno, int userNo) {
		
		Connection conn = getConnection();
		
		int result = new ScrapPlanDao().deleteList(conn, spno, userNo);
	
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int decreasePlanScrapCount(String[] spno) {
		
		Connection conn = getConnection();
		
		int result = new ScrapPlanDao().decreasePlanScrapCount(conn, spno);
	
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
}
