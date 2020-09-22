package com.kh.recommend.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.recommend.model.dao.RecommendDao;

public class RecommendService {
	
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new RecommendDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}

}
