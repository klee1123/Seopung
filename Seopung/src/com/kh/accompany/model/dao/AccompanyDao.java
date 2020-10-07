package com.kh.accompany.model.dao;

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

import com.kh.Member.model.vo.Member;
import com.kh.accompany.model.vo.Accompany;
import com.kh.adminMember.model.vo.Report;
import com.kh.common.PageInfo;



public class AccompanyDao {

private Properties prop = new Properties();
	
	public AccompanyDao() {
		
		String fileName = AccompanyDao.class.getResource("/sql/accompany/accompany-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
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
			pstmt.setInt(2, userNo);
			
			rset = pstmt.executeQuery();
			
			
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		}
		
		return listCount;
		
	}
	
	public ArrayList<Accompany> selectList(Connection conn , PageInfo pi, int userNo){
		
		ArrayList<Accompany> list = new ArrayList<Accompany>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			pstmt.setInt(4, userNo);
			pstmt.setInt(5, startRow);
			pstmt.setInt(6, endRow);

			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Accompany(rset.getInt("ACCOM_NO"),
									   rset.getString("USER_ID"),
						               rset.getString("USER_NICK"),
						               rset.getInt("USER_NO"),
						               rset.getInt("USER_NO2"),
						               rset.getInt("PLAN_NO")));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
	}
	
	

	
	public int deleteAccom(Connection conn, int accomNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteAccom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, accomNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return result;
		
	}
	
	public Member accomProfile(Connection conn, String userId){
		
		Member profile = new Member();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("accomProfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				profile = new Member(rset.getString("USER_ID"),
									 rset.getString("USER_NAME"),
									 rset.getString("USER_NICK"),
									 rset.getString("EMAIL"),
									 rset.getString("USER_BIRTH"),
									 rset.getString("USER_INTRO"));
			 	
			}
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
			
		}
		
		return profile;
		
		
	}
	
	public int sendMessage(Connection conn, int senderNo, int receiverNo, String introduction) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("sendMessage");
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, introduction);
			pstmt.setInt(2, senderNo);
			pstmt.setInt(3, receiverNo);

			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int checkReport(Connection conn , Report accomReport){
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("accomCheckReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(accomReport.getUserNo1()));
			pstmt.setInt(2, Integer.parseInt(accomReport.getUserNo2()));
			pstmt.setInt(3, accomReport.getReportPostNo());
			
			rset = pstmt.executeQuery();
			
			rset.next();
			result = rset.getInt(1);
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		}
		
		return result;
		
	}
	
	public int insertReport(Connection conn, Report accomReport) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("accomInsertReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(accomReport.getUserNo1()));
			pstmt.setInt(2, Integer.parseInt(accomReport.getUserNo2()));
			pstmt.setInt(3, accomReport.getReportPostNo());
			pstmt.setString(4, accomReport.getReportType());
			pstmt.setString(5, accomReport.getReportContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int updateReport(Connection conn, int accomNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, accomNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		return result;
	}
	
	
	
	public int selectRequestListCount(Connection conn, int userNo) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRequestListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT");
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		}
		
		return listCount;
		
		
	}
	
	public ArrayList<Accompany> selectRequestList(Connection conn, PageInfo pi, int userNo){
		
		ArrayList<Accompany> list = new ArrayList<Accompany>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRequestList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, userNo);
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Accompany(rset.getInt("ACCOM_NO"),
									   rset.getString("USER_ID"),
						               rset.getString("USER_NICK"),
						               rset.getDate("ACCOM_APPLY"),
						               rset.getInt("USER_NO"),
						               rset.getInt("USER_NO2"),
						               rset.getInt("PLAN_NO"),
						               rset.getString("PLAN_TITLE")));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int agree(Connection conn, int accomNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("accomAgree");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, accomNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			close(pstmt);
			
		}
		
		return result;
		
	}
	
	public int cancel(Connection conn, int accomNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("accomCancel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, accomNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			close(pstmt);
			
		}
		
		return result;
		
	}
	
	public int selectResponseListCount(Connection conn, int userNo) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRequestListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT");
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		}
		
		return listCount;
		
		
		
		
	}
	
	public ArrayList<Accompany> selectResponseList(Connection conn, PageInfo pi, int userNo){
		
		ArrayList<Accompany> list = new ArrayList<Accompany>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectResponseList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, userNo);
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Accompany(rset.getInt("ACCOM_NO"),
									   rset.getString("USER_ID"),
						               rset.getString("USER_NICK"),
						               rset.getDate("ACCOM_APPLY"),
						               rset.getString("ACCOM_STATUS"),
						               rset.getInt("USER_NO"),
						               rset.getInt("USER_NO2"),
						               rset.getInt("PLAN_NO"),
						               rset.getString("PLAN_TITLE")));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int responseCancel(Connection conn, int accomNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("accomResponseCancel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, accomNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			close(pstmt);
			
		}
		
		return result;
		
	}
	
	public int selectDelete(Connection conn , String[] accomNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectDelete");
		
		// 삭제할 추천코스 갯수가 복수일 경우
		if(accomNo.length > 1) {
			for(int i=1; i<accomNo.length; i++) {
				sql += " OR ACCOM_NO =" + accomNo[i];
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(accomNo[0]));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		return result;
	}
	

	
	
}
