package com.kh.search.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.adminCommunity.model.vo.Community;
import com.kh.adminPlan.model.vo.Plan;
import com.kh.adminRecommend.model.vo.Recommend;
import com.kh.search.model.dao.SearchDao;

public class SearchService {
	
	public int searchPlanCount(String keyword) {
		Connection conn = getConnection();
		
		int pCount = new SearchDao().searchPlanCount(conn, keyword);
		
		close(conn);
		
		return pCount;
	}
	
	
	public int searchCommunityCount(String keyword) {
		Connection conn = getConnection();
		
		int cCount = new SearchDao().searchCommunityCount(conn, keyword);
		
		close(conn);
		
		return cCount;
	}
	
	
	public int searchRecommendCount(String keyword) {
		Connection conn = getConnection();
		
		int rCount = new SearchDao().searchRecommendCount(conn, keyword);
		
		close(conn);
		
		return rCount;
	}
	
	
	public ArrayList<Plan> searchPlan(String keyword) {
		Connection conn = getConnection();
		
		ArrayList<Plan> plist = new SearchDao().searchPlan(conn, keyword);
		
		close(conn);
		
		return plist;
	}
	
	public ArrayList<Community> searchCommunity(String keyword) {
		Connection conn = getConnection();
		
		ArrayList<Community> c = new SearchDao().searchCommunity(conn, keyword);
		
		close(conn);
		
		return c;
	}

	public ArrayList<Recommend> searchRecommend(String keyword) {
		Connection conn = getConnection();
		
		ArrayList<Recommend> rlist = new SearchDao().searchRecommend(conn, keyword);
		
		close(conn);
		
		return rlist;
	}
}
