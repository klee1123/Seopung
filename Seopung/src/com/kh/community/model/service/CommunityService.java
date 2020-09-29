package com.kh.community.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.PageInfo;
import com.kh.community.model.dao.CommunityDao;
import com.kh.community.model.vo.Community;
public class CommunityService {

	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new CommunityDao().selectListCount(conn);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Community> selectList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Community> list = new CommunityDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	public int insertCommunity(Community c) {
		Connection conn = getConnection();
		
		int result = new CommunityDao().insertCommunity(conn, c);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
			
		}
		
		close(conn);
		return result;
		
	}
}
