package com.kh.recommend.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.PageInfo;
import com.kh.recommend.model.dao.RecommendDao;
import com.kh.recommend.model.vo.Recommend;

public class RecommendService {

	public int selectListCount(String keyword) {
		Connection conn = getConnection();
		int listCount = new RecommendDao().selectListCount(conn, keyword);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Recommend> selectList(PageInfo pi, String keyword, String array){
		Connection conn = getConnection();
		
		ArrayList<Recommend> list = new RecommendDao().selectList(conn, pi, keyword, array);
		close(conn);
		return list;
	}
	
	public int insertRecommend(Recommend c) {
		Connection conn = getConnection();
		
		int result = new RecommendDao().insertRecommend(conn, c);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
