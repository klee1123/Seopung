package com.kh.index.model.service;
import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.index.model.dao.IndexDao;
import com.kh.planMake.model.vo.PlanMake;
import com.kh.recommend.model.vo.Recommend;

public class IndexService {
	
	public ArrayList<Recommend> selectRecommend() {
		Connection conn = getConnection();
		
		ArrayList<Recommend> list = new IndexDao().selectRecommend(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<PlanMake> selectPlanRec() {
		Connection conn = getConnection();
		
		ArrayList<PlanMake> list = new IndexDao().selectPlanRec(conn);
		
		close(conn);
		
		return list;
	}

}
