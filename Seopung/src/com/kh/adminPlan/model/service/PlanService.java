package com.kh.adminPlan.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.adminPlan.model.dao.PlanDao;
import com.kh.adminPlan.model.vo.Plan;
import com.kh.adminRecommend.model.dao.RecommendDao;
import com.kh.adminRecommend.model.vo.Recommend;
import com.kh.common.PageInfo;

public class PlanService {

	/**
	 * 일정 목록 조회 조건에 따른 게시글 수 조회하는 서비스
	 * @param keyfield
	 * @param keyword
	 * @return
	 */
	public int selectListCount(int keyfield, String keyword) {
		Connection conn = getConnection();
		
		int listCount = new PlanDao().selectListCount(conn, keyfield, keyword);
		
		close(conn);
		
		return listCount;
	}
	
	
	/**
	 * 일정 목록 조회 조건에 따른 게시글 조회하는 서비스
	 * @param pi
	 * @param keyfield
	 * @param keyword
	 * @return
	 */
	public ArrayList<Plan> selectList(PageInfo pi, int keyfield, String keyword){
		Connection conn = getConnection();
		
		ArrayList<Plan> list = new PlanDao().selectList(conn, pi, keyfield, keyword);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 상세조회시 조회수 증가용 서비스
	 * @param pno		조회수 증가시킬 게시글 번호
	 * @return			처리된 행 수
	 */
	public int increaseCount(int pno) {
		Connection conn = getConnection();
		
		int result = new PlanDao().increaseCount(conn, pno);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 일정 상세정보 조회용 서비스
	 * @param pno		상세조회요청한 게시글 번호
	 * @return			행당 게시글 정보가 담겨있는 객체
	 */
	public Plan selectPlan(int pno) {
		Connection conn = getConnection();
		
		Plan p = new PlanDao().selectPlan(conn, pno);
		
		close(conn);
		
		return p;
	}
	
	/**
	 * 일정 게시글 삭제용 서비스
	 * @param pno		삭제할 글 번호
	 * @return			처리된 행 수
	 */
	public int deletePlan(String[] pno) {
		Connection conn = getConnection();
		
		int result = new PlanDao().deletePlan(conn, pno);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
}
