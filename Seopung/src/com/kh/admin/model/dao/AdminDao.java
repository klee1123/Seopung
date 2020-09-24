package com.kh.admin.model.dao;

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

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		
		String fileName = AdminDao.class.getResource("/sql/admin/admin-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
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

	public ArrayList<Admin> selectList(Connection conn, PageInfo pi){
		// select문 => 여러행조회
		ArrayList<Admin> list = new ArrayList<>();
		
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
			
			while(rset.next()){
				list.add(new Admin(rset.getInt("admin_no"),
									rset.getString("admin_name"),
									rset.getString("admin_id"),
									rset.getDate("enroll_date"),
									rset.getDate("modify_date"),
									rset.getString("status")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	public int insertAdmin(Connection conn, Admin ad) {
		// insert문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ad.getAdminName());
			pstmt.setString(2, ad.getAdminId());
			pstmt.setString(3, ad.getAdminPwd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
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
	
	
	public Admin selectAdmin(Connection conn, int adminNo) {
		// select 문 => 한 행 조회
		Admin ad = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, adminNo);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				ad = new Admin(rset.getInt("admin_no"),
								rset.getString("admin_name"),
								rset.getString("admin_id"),
								rset.getString("admin_pwd"),
								rset.getDate("enroll_date"),
								rset.getDate("modify_date"),
								rset.getString("status"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ad;
	}
	
	public int updateAdmin(Connection conn, Admin ad) {
		// update문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ad.getAdminId());
			pstmt.setString(2, ad.getAdminPwd());
			pstmt.setString(3, ad.getAdminName());
			pstmt.setInt(4, ad.getAdminNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}



















