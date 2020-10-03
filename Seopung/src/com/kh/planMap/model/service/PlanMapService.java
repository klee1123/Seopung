package com.kh.planMap.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.planMap.model.dao.PlanMapDao;
import com.kh.planMap.model.vo.PlanMap;
import com.kh.planOption.model.dao.PlanOptionDao;
import com.kh.planOption.model.vo.PlanOption;

public class PlanMapService {
	
	
//1. 장소명 저장용 서비스
public int insertPlanMap(PlanMap p) {
		
		Connection conn = getConnection();
		
		int result = new PlanMapDao().insertPlanMap(conn, p);
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	
	}

/**
 * 특정 회원번호의 회원 정보 조회용
 * @param adminNo
 * @return
 */
public PlanOption selectPlanDays(int planNo) {
	Connection conn = getConnection();
	
	PlanOption pl = new PlanMapDao().selectPlanDays(conn, planNo);
	
	close(conn);
	
	return pl;
}




	
	
}


