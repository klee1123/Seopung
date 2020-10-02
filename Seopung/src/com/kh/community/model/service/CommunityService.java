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
	
	public int increaseCount(int cno) {
		
		Connection conn = getConnection();
		
		int result = new CommunityDao().increaseCount(conn, cno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Community selectCommunity(int cno) {
		Connection conn = getConnection();
		
		Community c = new CommunityDao().selectCommunity( conn, cno);
		
		close(conn);
		return c;
	}
	
	public int deleteCommunity(int cno) {
		Connection conn = getConnection();
		
		int result = new CommunityDao().deleteCommunity(conn, cno);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updateCommunity(Community c) {
		Connection conn = getConnection();
		
		int result = new CommunityDao().updateCommunity(conn, c);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int increaseRe(int cno, int userNo) {
		Connection conn = getConnection();
		
		int result1 = new CommunityDao().increaseRe(conn, cno);
		int result2 = new CommunityDao().insertRecommend(conn, cno, userNo);
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
	}
	
	public int decreaseRe(int cno) {
		Connection conn = getConnection();
		
		int result = new CommunityDao().decreaseRe(conn, cno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int increaseScrap(int cno, int userNo) {
		
		Connection conn = getConnection();
		
		int result1 = new CommunityDao().increaseScrap(conn, cno);
		int result2 = new CommunityDao().insertScrap(conn, cno, userNo);
		
		if(result1 > 0 && result2 > 0){
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
		
	}
	
	public int decreaseScrap(int cno) {
		Connection conn = getConnection();
		
		int result = new CommunityDao().decreaseScrap(conn, cno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
