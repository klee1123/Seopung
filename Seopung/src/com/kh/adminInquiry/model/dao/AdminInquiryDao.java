package com.kh.adminInquiry.model.dao;

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

import com.kh.adminInquiry.model.dao.AdminInquiryDao;
import com.kh.adminInquiry.model.vo.AdminInquiry;
import com.kh.adminNotice.model.dao.AdminNoticeDao;
import com.kh.adminNotice.model.vo.AdminNotice;
import com.kh.common.PageInfo;

public class AdminInquiryDao {
	
	private Properties prop = new Properties();
	
	public AdminInquiryDao() {
		
		String fileName = AdminInquiryDao.class.getResource("/sql/adminInquiry/adminInquiry-mapper.xml").getPath();
		
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
	
	public ArrayList<AdminInquiry> selectList(Connection conn, PageInfo pi){
		// select문 => 여러행 조회
		ArrayList<AdminInquiry> list = new ArrayList<>();
		
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
			
			// 번호 제목 작성자 처리상태
			while(rset.next()) {
				AdminInquiry a = new AdminInquiry();
				a.setInquireNo(rset.getInt("inquire_no"));
				a.setInquireTitle(rset.getString("inquire_title"));
				a.setInquireEnrollDate(rset.getDate("inquire_enroll_date"));
				a.setInquireStatus(rset.getString("inquire_status"));
				a.setInquireEmail(rset.getString("inquire_email"));
				a.setInquireSep(rset.getString("inquire_sep"));
				a.setInquireWriter(rset.getString("user_id"));

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
	
	public AdminInquiry selectAdminInquiry(Connection conn, int ino) {
		// select문 => 한 행 조회
		AdminInquiry i = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminInquiry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ino);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				i = new AdminInquiry(rset.getInt("INQUIRE_NO"),
								 	 rset.getString("INQUIRE_TITLE"),
									 rset.getString("INQUIRE_CONTENT"),
									 rset.getDate("INQUIRE_ENROLL_DATE"),
									 rset.getString("INQUIRE_EMAIL"),
									 rset.getString("INQUIRE_RESPONSE"),
									 rset.getString("USER_ID"),
									 rset.getString("INQUIRE_SEP"),
									 rset.getString("INQUIRE_TYPE"),
									 rset.getString("ADMIN_ID"));
						}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return i;
	}
	
	
	
	
	

}