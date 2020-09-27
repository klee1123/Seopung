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
	
	
	
	public int insertPlanOption(Connection conn, PlanOption po) {
		// insert문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPlanOption");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, po.getPlanTitle());
			pstmt.setString(2, po.getPlanSdate());
			pstmt.setString(3, po.getPlanEdate());
			pstmt.setString(4, po.getPlanAge());
			pstmt.setString(5, po.getPlanAcc());
			pstmt.setString(6, po.getPlanBudget());
			pstmt.setString(7, po.getPlanScrapYn());
			pstmt.setString(8, po.getPlanPrivate());
			pstmt.setString(9, po.getPlanMemo());
			pstmt.setString(10, po.getPlanHashtag());
			pstmt.setString(11, po.getPlanTemp());
			pstmt.setString(12, po.getPlanType());
			pstmt.setString(13, po.getPlanTrans());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	
}



















