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
import com.kh.adminInquiry.model.vo.AdminInquiry;
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
				AdminReport rp = new AdminReport();
				rp.setReportNo(rset.getInt("report_no"));
				// 유저 넘버 / 신고당한 아이디 신고한 아이디 2개 변경 예정 / 변경해씀
				rp.setUserNo(rset.getString("ID1"));
				rp.setUserNo2(rset.getInt("USER_NO2"));
				rp.setUserId2(rset.getString("ID2"));
				rp.setReportDate(rset.getDate("report_date"));
				rp.setReportType(rset.getString("report_type"));
				list.add(rp);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public AdminReport selectAdminReport(Connection conn, int rpno) {
		// select문 => 한 행 조회
		AdminReport r = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rpno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new AdminReport();
				r.setReportNo(rset.getInt("report_no"));
				r.setReportContent(rset.getString("report_content"));
				r.setReportDate(rset.getDate("report_date"));
				r.setReportType(rset.getString("report_type"));
				r.setUserNo(rset.getString("ID1"));
				r.setUserNo2(rset.getInt("ID2"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return r;
	}
	
	
	public int deleteReport(Connection conn, String[] rno) {
		// update문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteReport");
		
		// 삭제할 신고글 갯수가 복수일 경우
		if(rno.length > 1) {
			for(int i=1; i<rno.length; i++) {
				sql += " OR REPORT_NO =" + rno[i];
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(rno[0]));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int enrollBlacklist(Connection conn, String[] enrollList) {

		//update문 => 처리된 행 수
			int result = 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("enrollBlacklist");
			
			// 등록할 회원수가 복수일 경우
			if(enrollList.length > 1) {
				for(int i=1; i<enrollList.length; i++) {
					sql += " OR USER_NO =" + enrollList[i];
				}
			}
					
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, Integer.parseInt(enrollList[0]));
					
				result = pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
	}

