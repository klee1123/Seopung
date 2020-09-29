package com.kh.adminPlan.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.adminCommunity.model.vo.Community;
import com.kh.adminPlan.model.vo.Plan;
import com.kh.common.PageInfo;

public class PlanDao {
	
	private Properties prop = new Properties();
	
	public PlanDao() {
		
		String fileName = PlanDao.class.getResource("/sql/adminPost/adminPlan-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn, int keyfield, String keyword) {
		// select => 한 행 조회
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "";
		if(keyfield == 1) {
			sql = prop.getProperty("selectListCount1"); // 제목 검색
		}else {
			sql = prop.getProperty("selectListCount2"); // 아이디 검색
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listCount += rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	
	public ArrayList<Plan> selectList(Connection conn, PageInfo pi, int keyfield, String keyword){
		// select문 => 여러 행 조회
		ArrayList<Plan> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "";
		if(keyfield == 1) {
			sql = prop.getProperty("selectList1"); // 제목 검색
		}else {
			sql = prop.getProperty("selectList2"); // 아이디 검색
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			

			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Plan());
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
