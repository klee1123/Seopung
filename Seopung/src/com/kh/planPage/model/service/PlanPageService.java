package com.kh.planPage.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.planPage.model.vo.PlanPage;
import com.kh.planPage.model.dao.PlanPageDao;

public class PlanPageService {
	
public int planPage(PlanPage p) {
		
		Connection conn = getConnection();
		
		int result = new PlanPageDao().PlanPage(conn, p);
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	
	}




	
	
}


