package com.kh.planOption.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.PageInfo;
import com.kh.planOption.model.vo.PlanOption;
import com.kh.planOption.model.dao.PlanOptionDao;

public class PlanOptionService {
	

	/**
	 * 관리자 등록용
	 * @param ad
	 * @return
	 */
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


