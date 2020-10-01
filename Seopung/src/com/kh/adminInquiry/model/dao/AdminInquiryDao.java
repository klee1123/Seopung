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
	
	public int selectListCount(Connection conn, int keyfield, String keyword, String status) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = "";
		// 키워드 검색 조건 설정
		if(keyfield == 1) {
			sql = prop.getProperty("selectListCount1");		// 이름검색	
		}else {
			sql = prop.getProperty("selectListCount2");		// 아이디검색
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, status);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<AdminInquiry> selectList(Connection conn, PageInfo pi, int keyfield, String keyword, String status){
		// select문 => 여러행조회
		ArrayList<AdminInquiry> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "";
		// 키워드 검색 조건 설정
		if(keyfield == 1) {
			sql = prop.getProperty("selectList1");		// 이름검색	
		}else {
			sql = prop.getProperty("selectList2");		// 아이디검색
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, status);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				list.add(new AdminInquiry(rset.getInt("inquire_no"),
										  rset.getString("inquire_title"),
										  rset.getString("inquire_content"),
										  rset.getDate("inquire_enroll_date"),
										  rset.getString("inquire_status"),
										  rset.getString("inquire_email"),
										  rset.getString("inquire_response"),
										  rset.getDate("response_date"),
										  rset.getString("status"),
										  rset.getInt("user_no"),
										  rset.getInt("admin_no"),
										  rset.getString("inquire_sep"),
										  rset.getString("inquire_type")));
			}  
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int idCheck(Connection conn, String checkId) {
		// select문 => 한 개의 값 조회
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,  checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
	
	public AdminInquiry selectAdmin(Connection conn, int adminNo) {
		// select 문 => 한 행 조회
		AdminInquiry ad = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, adminNo);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				ad = new AdminInquiry(rset.getInt("inquire_no"),
									  rset.getString("inquire_title"),
									  rset.getString("inquire_content"),
									  rset.getDate("inquire_enroll_date"),
									  rset.getString("inquire_status"),
									  rset.getString("inquire_email"),
									  rset.getString("inquire_response"),
									  rset.getDate("response_date"),
									  rset.getString("status"),
									  rset.getInt("user_no"),
									  rset.getInt("admin_no"),
									  rset.getString("inquire_sep"),
									  rset.getString("inquire_type"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ad;
	}

}


