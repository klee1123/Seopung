package com.kh.recommend.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.PageInfo;
import com.kh.recommend.model.dao.RecommendDao;
import com.kh.recommend.model.vo.Recommend;

public class RecommendService {

	public int selectListCount(String keyword) {
		Connection conn = getConnection();
		int listCount = new RecommendDao().selectListCount(conn, keyword);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Recommend> selectList(PageInfo pi, String keyword, String array){
		Connection conn = getConnection();
		
		ArrayList<Recommend> list = new RecommendDao().selectList(conn, pi, keyword, array);
		close(conn);
		return list;
	}
	
	public int insertRecommend(Recommend c) {
		Connection conn = getConnection();
		
		int result = new RecommendDao().insertRecommend(conn, c);
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
		
		int result = new RecommendDao().increaseCount(conn, cno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Recommend selectRecommend(int cno) {
		Connection conn = getConnection();
		
		Recommend nc = new RecommendDao().selectRecommend(conn, cno);
		
		close(conn);
		return nc;
	}
	
	public int updateRecommend(Recommend nc) {
		Connection conn = getConnection();
		
		int result = new RecommendDao().updateRecommend(conn, nc);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}
	
	public int deleteRecommend(int cno) {
		Connection conn = getConnection();
		
		int result = new RecommendDao().deleteRecommend(conn, cno);
		
		if(result > 0){
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int increaseLike(int cno, int userNo) {
		Connection conn = getConnection();
		
		int result1 = new RecommendDao().increaseLike(conn, cno);
		int result2 = new RecommendDao().insertLike(conn, cno, userNo);
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
	public int decreaseLike(int cno) {
		Connection conn = getConnection();
		
		int result = new RecommendDao().decreaseLike(conn, cno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
