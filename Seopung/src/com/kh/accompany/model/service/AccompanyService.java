package com.kh.accompany.model.service;


import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.accompany.model.dao.AccompanyDao;

public class AccompanyService {

	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new AccompanyDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
		
		
		
		
	}
	
	
	
}
