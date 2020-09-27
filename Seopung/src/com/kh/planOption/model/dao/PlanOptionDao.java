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

import com.kh.admin.model.vo.Admin;
import com.kh.common.PageInfo;
import com.kh.planOption.model.vo.PlanOption;

public class PlanOptionDao {
	
	private Properties prop = new Properties();
	
	public PlanOptionDao() {
		
		String fileName = PlanOptionDao.class.getResource("/sql/admin/admin-mapper.xml").getPath();
		
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
			pstmt.setString(1, ad.getPlanSdate());
			pstmt.setString(1, ad.getPlanEdate());
			pstmt.setString(1, ad.getPlanAge());
			pstmt.setString(1, ad.getPlanAcc());
			pstmt.setString(1, ad.getPlanBudget());
			pstmt.setString(1, ad.getPlanScrapYn());
			pstmt.setString(1, ad.getPlanPrivate());
			pstmt.setString(1, ad.getPlanMemo());
			pstmt.setString(1, ad.getPlanHashtag());
			pstmt.setString(1, ad.getPlanTemp());
			pstmt.setString(1, ad.getPlanType());
			pstmt.setString(1, ad.getPlanTrans());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	
	
}



















