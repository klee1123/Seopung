package com.kh.planMake.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.planMake.model.dao.PlanMakeDao;
import com.kh.planMake.model.vo.PlanMake;


public class PlanMakeService {
	
	// option
	public int insertPlanMake(PlanMake p) {
			
		Connection conn = getConnection();
		
		int result = new PlanMakeDao().insertPlanMake(conn, p);
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	
	}

	
	

	
	// option
	public PlanMake selectPlanMake(int planNo) {
		Connection conn = getConnection();
		
		PlanMake pm = new PlanMakeDao().selectPlanMake(conn, planNo);
		
		close(conn);
		
		return pm;
	}
	
	public int updatePlanMake(PlanMake pm) {
		Connection conn = getConnection();
		
		int result = new PlanMakeDao().updatePlanMake(conn, pm);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	
	
	
}


