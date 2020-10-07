package com.kh.planMake.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.planMake.model.vo.PlanMake;


public class PlanMakeDao {
	
	private Properties prop = new Properties();
	
	public PlanMakeDao() {
		
		String fileName = PlanMakeDao.class.getResource("/sql/planMake/planMake-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertPlanMake(Connection conn, PlanMake p) {
		// insert문 => 처리된 행 수
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPlan");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된sql문 => 완성하고 실행
			
			pstmt.setString(1, p.getPlanTitle());
			pstmt.setString(2, p.getPlanSdate());
			pstmt.setString(3, p.getPlanEdate());
			pstmt.setString(4, p.getPlanAge());
			pstmt.setString(5, p.getPlanAcc());
			pstmt.setString(6, p.getPlanBudget());
			pstmt.setString(7, p.getPlanScrapYn());
			pstmt.setString(8, p.getPlanPrivate());
			pstmt.setString(9, p.getPlanMemo());
			pstmt.setString(10, p.getPlanType());
			pstmt.setString(11, p.getPlanTrans());
			pstmt.setInt(12, p.getUserNo());
			
			result = pstmt.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;		
		
	}
	
	
	
	
	
	public PlanMake selectPlanMake(Connection conn, int planNo) {
		// select 문 => 한 행 조회
		PlanMake pm = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlanMake");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, planNo);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				pm = new PlanMake(rset.getInt("PLAN_NO"),
								rset.getString("PLAN_TITLE"),
								rset.getDate("PLAN_SDATE"),
								rset.getDate("PLAN_EDATE"),
								rset.getString("PLAN_AGE"),
								rset.getString("PLAN_ACC"),
								rset.getString("PLAN_BUDGET"),
								rset.getString("PLAN_SCRAP_YN"),
								rset.getString("PLAN_PRIVATE"),
								rset.getString("PLAN_MEMO"),
								rset.getString("PLAN_TYPE"),
								rset.getString("PLAN_TRANS")
								
								
								);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return pm;
	}
	
	
	
	public int updatePlanMake(Connection conn, PlanMake pm) {
		// update문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePlanMake");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pm.getPlanNo());
			pstmt.setString(2, pm.getPlanTitle());
			pstmt.setString(3, pm.getPlanSdate());
			pstmt.setString(4, pm.getPlanEdate());
			pstmt.setString(5, pm.getPlanAge());
			pstmt.setString(6, pm.getPlanAcc());
			pstmt.setString(7, pm.getPlanBudget());
			pstmt.setString(8, pm.getPlanScrapYn());
			pstmt.setString(9, pm.getPlanPrivate());
			pstmt.setString(10, pm.getPlanMemo());
			pstmt.setString(11, pm.getPlanType());
			pstmt.setString(12, pm.getPlanTrans());
			pstmt.setInt(13, pm.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	
	
	
	
}



















