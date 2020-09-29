package com.kh.community.model.service;

import java.sql.Connection;

import com.kh.community.model.dao.CommunityDao;

import static com.kh.common.JDBCTemplate.*;
public class CommunityService {

	
	public int listCount() {
		Connection conn = getConnection();
		
		int listCount = new CommunityDao().listCount(conn);
		
		close(conn);
		return listCount;
	}
}
