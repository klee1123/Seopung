package com.kh.planOption.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.planOption.model.vo.PlanOption;
import com.kh.planOption.model.dao.PlanOptionDao;

public class PlanOptionService {
	
	public int insertPlanOption(PlanOption po) {
			
			Connection conn = /* JDBCTemplate. */getConnection();
			
			int result = new PlanOptionDao().insertPlanOption(conn, po);
			
			// 트랜잭션 처리
			if(result > 0) {
				/* JDBCTemplate. */commit(conn);
			}else {
				/* JDBCTemplate. */rollback(conn);
			}
			
			/* JDBCTemplate. */close(conn);
			
			return result;
			
		}

	
	
}


