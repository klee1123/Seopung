package com.kh.planMap.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.planMap.model.vo.PlanMap;
import com.kh.planMap.model.dao.PlanMapDao;

public class PlanMapService {
	
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

	
	
}


