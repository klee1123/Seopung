package com.kh.adminRecommend.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.adminRecommend.model.dao.RecommendDao;
import com.kh.adminRecommend.model.vo.Recommend;
import com.kh.common.PageInfo;

public class RecommendService {
	
	/**
	 * 1_1. 추천코스 게시글 수 조회용 서비스
	 * @return	총 게시글 수
	 */
	public int selectListCount(String keyword) {
		
		Connection conn = getConnection();
		
		int listCount = new RecommendDao().selectListCount(conn, keyword);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 1_2. 현재 요청한 페이지에 보여져야할 리스트 조회용 서비스
	 * @param pi		현재 요청한 페이지, 게시글최대갯수가 담겨있는 PageInfo객체 
	 * @return			조회된 결과가 담겨있는 list
	 */
	public ArrayList<Recommend> selectList(PageInfo pi, String keyword){
		Connection conn = getConnection();
		
		ArrayList<Recommend> list = new RecommendDao().selectList(conn, pi, keyword);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 2. 추천코스 새 글 등록용 서비스
	 * @param r		추천코스 정보를 담고 있는 Recommend 객체
	 * @return		처리된 행 수
	 */
	public int insertRecommend(Recommend r) {
		Connection conn = getConnection();
		
		int result = new RecommendDao().insertRecommend(conn, r);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	
	/**
	 * 3_1. 상세조회시 조회수 증가용 서비스
	 * @param rno		조회수 증가시킬 게시글 번호
	 * @return			처리된 행 수
	 */
	public int increaseCount(int rno) {
		Connection conn = getConnection();
		
		int result = new RecommendDao().increaseCount(conn, rno);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 3. 추천코스 상세정보 조회용 서비스
	 * @param rno		상세조회요청한 게시글 번호
	 * @return			행당 게시글 정보가 담겨있는 Recommend객체
	 */
	public Recommend selectRecommend(int rno) {
		Connection conn = getConnection();
		
		Recommend r = new RecommendDao().selectRecommend(conn, rno);
		
		close(conn);
		
		return r;
	}
	
	
	/**
	 * 4. 추천코스 게시글 수정용 서비스
	 * @param r		수정된 내용이 담긴 Recommend 객체
	 * @return		처리된 행 수
	 */
	public int updateRecommend(Recommend r) {
		Connection conn = getConnection();
		
		int result = new RecommendDao().updateRecommend(conn, r);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	
	/**
	 * 5. 추천코스 게시글 삭제용 서비스
	 * @param rno		삭제할 글 번호
	 * @return			처리된 행 수
	 */
	public int deleteRecommend(String[] rno) {
		Connection conn = getConnection();
		
		int result = new RecommendDao().deleteRecommend(conn, rno);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
}












