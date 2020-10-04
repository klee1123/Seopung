package com.kh.planMake.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
	
	
	public int insertPlanPlace(Connection conn, PlanMake pp) {
		// insert문 => 처리된 행 수
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPlanPlace");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된sql문 => 완성하고 실행
			
			pstmt.setString(1, pp.getPlanDay());
			pstmt.setString(2, pp.getPlanPlace());
		
			
			result = pstmt.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;		
		
	}
	
	
	
	
	
}



















