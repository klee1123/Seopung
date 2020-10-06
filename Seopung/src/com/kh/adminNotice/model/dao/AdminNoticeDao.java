package com.kh.adminNotice.model.dao;

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

import com.kh.adminNotice.model.vo.AdminNotice;
import com.kh.common.PageInfo;

public class AdminNoticeDao {
	
private Properties prop = new Properties();
	
	public AdminNoticeDao() {
		
		String fileName = AdminNoticeDao.class.getResource("/sql/adminNotice/adminNotice-mapper.xml").getPath();
		
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
	
	public ArrayList<AdminNotice> selectList(Connection conn, PageInfo pi){
		// select문 => 여러행 조회
		ArrayList<AdminNotice> list = new ArrayList<>();
		
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
				AdminNotice a = new AdminNotice();
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
	
	public int insertAdminNotice(Connection conn, AdminNotice n) {
		// insert문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAdminNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getAdminNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int increaseCount(Connection conn, int nno) {
		// update문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public AdminNotice selectAdminNotice(Connection conn, int nno) {
		// select문 => 한 행 조회
		AdminNotice n = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, nno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new AdminNotice(
								rset.getString("NOTICE_CONTENT"),
								rset.getDate("NOTICE_ENROLL"),
								nno,
								rset.getString("NOTICE_TITLE"),
								rset.getInt("NOTICE_VIEWS"),
								rset.getString("ADMIN_ID"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return n;
	}
	
	public int deleteAdminNotice(Connection conn, String[] nno) {
		// update문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteAdminNotice");
		
		// 삭제할 공지사항 갯수가 복수일 경우
		if(nno.length > 1) {
			for(int i=1; i<nno.length; i++) {
				sql += " OR NOTICE_NO =" + nno[i];
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(nno[0]));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}



