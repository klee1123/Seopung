package com.kh.planMap.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.planMap.model.vo.PlanMap;

public class PlanMapDao {
	
	private Properties prop = new Properties();
	
	public PlanMapDao() {
		
		String fileName = PlanMapDao.class.getResource("/sql/planMap/planMap-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertPlanMap(Connection conn, PlanMap p) {
		// insert문 => 처리된 행 수
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPlanMap");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된sql문 => 완성하고 실행
			
			pstmt.setString(1, p.getPlanDay());
			pstmt.setInt(2, p.getOrderNo());
			pstmt.setString(3, p.getLineMemo());
			pstmt.setString(4, p.getLatitude());
			pstmt.setString(5, p.getLongitude());
		
			result = pstmt.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;		
	}
	
}

