package com.kh.planRecommend.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.planOption.model.vo.PlanOption;
import com.kh.planOption.model.dao.PlanOptionDao;

public class PlanRecommendService {
	
	public int insertPlanOption(PlanOption ad) {
		Connection conn = getConnection();
		
		int result = new PlanOptionDao().insertPlanOption(conn, ad);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	
	
}


