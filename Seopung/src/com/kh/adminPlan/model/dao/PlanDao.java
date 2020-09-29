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
import com.kh.adminRecommend.model.vo.Recommend;
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
			pstmt.setString(1, keyword);
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
			
			pstmt.setString(1,keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Plan(rset.getInt("plan_no"),
									rset.getString("plan_title"),
									rset.getString("user_id"),
									rset.getDate("enroll_date"),
									rset.getInt("plan_count")));
			}
			
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
	
	
	public int increaseCount(Connection conn, int pno) {
		// update문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public Plan selectPlan(Connection conn, int pno) {
		// select문 => 한 행 조회
		Plan p = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlan");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				p = new Plan(pno,
						     rset.getString("plan_title"),
							 rset.getDate("plan_sdate"),
							 rset.getDate("plan_edate"),
							 rset.getString("plan_age"),
							 rset.getString("plan_budget"),
							 rset.getString("plan_memo"),
							 rset.getString("plan_type"),
							 rset.getString("plan_trans"),
							 rset.getInt("plan_recommend"),
							 rset.getInt("plan_scrap_count"),
							 rset.getString("user_id"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return p;
	}
	
	public int deletePlan(Connection conn, String[] pno) {
		// update문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deletePlan");
		
		// 삭제할 추천코스 갯수가 복수일 경우
		if(pno.length > 1) {
			for(int i=1; i<pno.length; i++) {
				sql += " OR PLAN_NO =" + pno[i];
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(pno[0]));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
