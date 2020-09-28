package com.kh.adminCommunity.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.adminCommunity.model.dao.CommunityDao;
import com.kh.adminCommunity.model.vo.Community;
import com.kh.common.PageInfo;

public class CommunityService {

	/**
	 * 커뮤니티 목록 조회 조건에 따른 게시글 수 조회하는 서비스
	 * @param keyfield
	 * @param keyword
	 * @param head
	 * @return
	 */
	public int selectListCount(int keyfield, String keyword, String head) {
		Connection conn = getConnection();
		
		int listCount = new CommunityDao().selectListCount(conn, keyfield, keyword, head);
		
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
	public ArrayList<Community> selectList(PageInfo pi, int keyfield, String keyword, String head){
		Connection conn = getConnection();
		
		ArrayList<Community> list = new CommunityDao().selectList(conn, pi, keyfield, keyword, head);
		
		close(conn);
		
		return list;
	}
	
	public int insertCommunity(Community c) {
		Connection conn = getConnection();
		
		int result = new CommunityDao().insertCommunity(conn, c);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
}
