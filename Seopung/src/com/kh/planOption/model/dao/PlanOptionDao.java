package com.kh.planOption.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.planOption.model.vo.PlanOption;

public class PlanOptionDao {
	
	private Properties prop = new Properties();
	
	public PlanOptionDao() {
		
		String fileName = PlanOptionDao.class.getResource("/sql/planOption/planOption-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertPlanOption(Connection conn, PlanOption p) {
		// insert문 => 처리된 행 수
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPlanOption");
		
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
			pstmt.setString(10, p.getPlanHashtag());
			pstmt.setString(11, p.getPlanTemp());
			pstmt.setString(12, p.getPlanType());
			pstmt.setString(13, p.getPlanTrans());
			
			result = pstmt.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			/* JDBCTemplate. */close(pstmt);
		}
		
		return result;		
		
	}
	
	
	
	
}



















