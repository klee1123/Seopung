package com.kh.accompany.model.service;


import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.Member.model.vo.Member;
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
	
	public int deleteAccom(int accomNo) {
		
		Connection conn = getConnection();
		
		int result = new AccompanyDao().deleteAccom(conn, accomNo);
		
		if(result > 0) {
			
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public Member accomProfile(String userId){
		
		Connection conn = getConnection();
		
		Member profile = new AccompanyDao().accomProfile(conn, userId);
		
		close(conn);
		
		return profile;
		
		
		
		
	}
	
	
}
