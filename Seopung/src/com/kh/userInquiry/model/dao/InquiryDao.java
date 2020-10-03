package com.kh.userInquiry.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.sql.Statement;

import com.kh.admin.model.dao.AdminDao;

	public class InquiryDao {
		
			private Properties prop = new Properties();
			
			public InquiryDao() {
				
				String fileName = AdminDao.class.getResource("/sql/Inquiry/Inquiry-mapper.xml").getPath();
				
				try {
					prop.loadFromXML(new FileInputStream(fileName));
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
	
	public int insertInquiry(Connection conn, String inquiryType,
							 String userEmail, String userPrivacy) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertInquiry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, getInquiryType());
			pstmt.setString(2, getUserEmail());
			pstmt.setString(3, getUserPrivacy());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

		
}
	
	
	
	