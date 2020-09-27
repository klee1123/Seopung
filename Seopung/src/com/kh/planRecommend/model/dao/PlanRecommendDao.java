package com.kh.planRecommend.model.dao;

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

import com.kh.admin.model.vo.Admin;
import com.kh.common.PageInfo;
import com.kh.planOption.model.vo.PlanOption;

public class PlanRecommendDao {
	
	private Properties prop = new Properties();
	
	public PlanRecommendDao() {
		
		String fileName = PlanRecommendDao.class.getResource("").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int insertPlanOption(Connection conn, PlanOption ad) {
		// insert문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPlanOption");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ad.getPlanTitle());
		
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	
	
}



















