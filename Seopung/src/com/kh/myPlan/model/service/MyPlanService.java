package com.kh.myPlan.model.service;
import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.adminPlan.model.vo.Plan;
import com.kh.common.PageInfo;
import com.kh.myPlan.model.dao.MyPlanDao;
public class MyPlanService {
	
	public int selectListCount(int userNo) {
		
		Connection conn = getConnection();
		
		int listCount = new MyPlanDao().selectListCount(conn, userNo);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Plan> selectList(PageInfo pi, int userNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Plan> list = new MyPlanDao().selectList(conn, pi,userNo);
		
		close(conn);
		
		return list;
	}

	public int deleteMyPlanList(String[] mpno) {
		
		Connection conn = getConnection();
		
		int result = new MyPlanDao().deleteMyPlanList(conn, mpno);
		
		close(conn);
		
		return result;
	}
}
