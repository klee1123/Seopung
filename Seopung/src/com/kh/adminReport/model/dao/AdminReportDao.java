package com.kh.adminReport.model.dao;

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

import com.kh.adminReport.model.vo.AdminReport;
import com.kh.adminNotice.model.dao.AdminNoticeDao;
import com.kh.adminNotice.model.vo.AdminNotice;
import com.kh.adminPlan.model.vo.PlanComment;
import com.kh.common.PageInfo;

public class AdminReportDao {
	
private Properties prop = new Properties();
	
	public AdminReportDao() {
		
		String fileName = AdminReportDao.class.getResource("/sql/adminReport/adminReport-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		// select => 한 행 조회
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}
	
	public ArrayList<AdminReport> selectList(Connection conn, PageInfo pi){
		// select문 => 여러행 조회
		ArrayList<AdminReport> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				AdminReport a = new AdminReport();
				a.setNoticeNo(rset.getInt("notice_no"));
				a.setNoticeTitle(rset.getString("notice_title"));
				a.setNoticeEnroll(rset.getDate("notice_enroll"));
				a.setNoticeViews(rset.getInt("notice_views"));

				list.add(a);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
}

