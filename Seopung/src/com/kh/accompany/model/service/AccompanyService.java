package com.kh.accompany.model.service;


import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.accompany.model.dao.AccompanyDao;
import com.kh.accompany.model.vo.Accompany;
import com.kh.common.PageInfo;

public class AccompanyService {

	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new AccompanyDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
		
		
		
		
	}
	
	
	public ArrayList<Accompany> selectList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Accompany> list = new AccompanyDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
		
		
		
	}
	
	
}
