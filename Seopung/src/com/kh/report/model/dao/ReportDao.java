package com.kh.report.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.report.model.vo.Report;

public class ReportDao {
	
private Properties prop = new Properties();
	
	public ReportDao() {
		
		String fileName = ReportDao.class.getResource("/sql/report/report-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int checkReport(Connection conn, Report r) {
		// select문 => 조회된 결과
		int result = 1;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("checkReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(r.getUserNo()));
			pstmt.setInt(2, Integer.parseInt(r.getUserNo2()));
			pstmt.setInt(3, r.getReportPostno());
			pstmt.setInt(4, r.getReportPostType());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int insertReport(Connection conn, Report r) {
		//insert문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(r.getUserNo()));
			pstmt.setInt(2, Integer.parseInt(r.getUserNo2()));
			pstmt.setInt(3, r.getReportPostno());
			pstmt.setString(4, r.getReportType());
			pstmt.setInt(5, r.getReportPostType());
			pstmt.setString(6, r.getReportContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		 
		return result;
	}
}

