package com.kh.recommend.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.recommend.model.dao.RecommendDao;
import com.kh.common.PageInfo;
import com.kh.recommend.model.vo.Recommend;

public class RecommendService {
	
	/**
	 * 1_1. 추천코스 게시글 수 조회용 서비스
	 * @return	총 게시글 수
	 */
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new RecommendDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 1_2. 현재 요청한 페이지에 보여져야할 리스트 조회용 서비스
	 * @param pi		현재 요청한 페이지, 게시글최대갯수가 담겨있는 PageInfo객체 
	 * @return			조회된 결과가 담겨있는 list
	 */
	public ArrayList<Recommend> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Recommend> list = new RecommendDao().selectList(conn, pi);
		
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
		
		close(conn);
		
		return result;
	}

}












