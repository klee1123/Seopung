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
import com.kh.userInquiry.model.vo.Inquiry;

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
	
	public int insertInquiry(Connection conn, Inquiry iq) {
		//
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = "";
		if(iq.getSep().equals("회원")){
			sql = prop.getProperty("insertInquiryUserNo");
		}else {
			sql = prop.getProperty("insertInquiryEmail");
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, iq.getTitle());
			pstmt.setString(2, iq.getInquiryType());
			pstmt.setString(3, iq.getContent());
			pstmt.setString(4,  iq.getSep());
			
			if(iq.getSep().equals("회원")){				
				pstmt.setInt(5, iq.getUserNo());
			}else {
				pstmt.setString(5, iq.getUserEmail());
			}
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
		
}
	
	
	
	