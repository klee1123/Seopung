package com.kh.adminCommunity.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.adminCommunity.model.dao.CommunityDao;
import com.kh.adminCommunity.model.vo.ComComment;
import com.kh.adminCommunity.model.vo.Community;
import com.kh.adminRecommend.model.dao.RecommendDao;
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
	
	/**
	 * 커뮤니티 공지글 등록용 서비스
	 * @param c
	 * @return
	 */
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
	
	
	public int increaseCount(int cno) {
		Connection conn = getConnection();
		
		int result = new CommunityDao().increaseCount(conn, cno);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
	public Community selectCommunity(int cno) {
		Connection conn = getConnection();
		
		Community c = new CommunityDao().selectCommunity(conn, cno);
		
		close(conn);
		
		return c;
	}
	
	public int selectCommentCount(int cno) {
		Connection conn = getConnection();
		
		int commentCount = new CommunityDao().selectCommentCount(conn, cno);
		
		close(conn);
		
		return commentCount;
	}
	
	
	public ArrayList<ComComment> selectCommentList(PageInfo pi, int cno){
		Connection conn = getConnection();
		
		ArrayList<ComComment> commentList = new CommunityDao().selectCommentList(conn, pi, cno);
		
		close(conn);
		
		return commentList;
	}
	
	
	public int deleteCommunity(String[] cno) {
		Connection conn = getConnection();
		
		int result = new CommunityDao().deleteCommunity(conn, cno);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	
	public int deleteComment(int commentNo) {
		Connection conn = getConnection();
		
		int result = new CommunityDao().deleteComment(conn, commentNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	public int decreaseReCount(int cno) {
		Connection conn = getConnection();
		
		int result = new CommunityDao().decreaseReCount(conn, cno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
}
