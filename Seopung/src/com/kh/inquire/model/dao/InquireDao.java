package com.kh.inquire.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.common.PageInfo;
import com.kh.inquire.model.vo.Inquire;

public class InquireDao {

	private Properties prop = new Properties();
	
	public InquireDao() {
		
		String fileName = InquireDao.class.getResource("/sql/inquire/inquire-mapper.xml").getPath(); 
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn, int userNo) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
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
	
	public ArrayList<Inquire> selectList(Connection conn, PageInfo pi, int userNo){
		//select문 => 여러행 조회
		ArrayList<Inquire> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit()-1;
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Inquire(rset.getInt("INQUIRE_NO"),
									 rset.getString("INQUIRE_TITLE"),
									 rset.getString("inquire_content"),
									 rset.getString("inquire_status")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int deleteInquireList(Connection conn, String[] ino) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteInquireList");
		
		if(ino.length > 1) {
			for(int i=1; i<ino.length; i++) {
				sql += " OR INQUIRE_NO = " + ino[i];
			}
		}
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(ino[0]));

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public Inquire selectInquire(Connection conn, int ino) {
		//select문 => 한 행 조회
		Inquire i = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectInquire");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ino);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				i = new Inquire(rset.getInt("INQUIRE_NO"),
								rset.getString("INQUIRE_TITLE"),
								rset.getString("INQUIRE_CONTENT"),
								rset.getDate("INQUIRE_ENROLL_DATE"),
								rset.getString("INQUIRE_RESPONSE"),
								rset.getDate("RESPONSE_DATE"),
								rset.getString("USER_NICK"),
								rset.getString("ADMIN_ID"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return i;
	}

	
}
