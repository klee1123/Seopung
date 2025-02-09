package com.kh.information.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.Member.model.vo.Member;

public class InfoDao {
	
	private Properties prop = new Properties();
	
	public InfoDao() {
		String fileName = InfoDao.class.getResource("/sql/info/info-mapper.xml").getPath();
		
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
	
	public Member selectMember(Connection conn, int userNo) {
		
		Member m = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("user_no"),
							   rset.getString("user_id"),
							   rset.getString("user_pwd"),
							   rset.getString("user_name"),
							   rset.getString("user_nick"),
							   rset.getString("user_birth"),
							   rset.getString("email"),
							   rset.getDate("enroll_date"),
							   rset.getDate("modify_date"),
							   rset.getString("PROFILEPIC_PATH"),
							   rset.getString("user_intro"),
							   rset.getString("status"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

	public int updatePwdMember(Connection conn, int userNo, String userPwd, String updatePwd) {
		//update문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePwdMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, updatePwd);
			pstmt.setInt(2, userNo);
			pstmt.setString(3, userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateNick(Connection conn, int userNo, String userNick, String updateNick) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateNick");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, updateNick);
			pstmt.setInt(2, userNo);
			pstmt.setString(3, userNick);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int deleteMember(Connection conn , int userNo, String userPwd) {
		// update문 = > 처리된 행 수
		int result = 0;
		
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql
			
			pstmt.setInt(1, userNo);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int nickCheck(Connection conn, String nickChk) {
		// select문 => 오로지 한개의 값(개수)
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("nickChk");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, nickChk);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
	
	public int updateInfo(Connection conn, Member m) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserIntro());
			pstmt.setString(2, m.getProfile());
			pstmt.setInt(3, m.getUserNo());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateInfoEmail(Connection conn, int userNo, String updateEmail) {
        int result = 0;

        PreparedStatement pstmt = null;

        String sql = prop.getProperty("updateInfoEmail");

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, updateEmail);
            pstmt.setInt(2, userNo);

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
	
	public int deleteProfilePic(Connection conn, int userNo) {
		int result = 0;
		
        PreparedStatement pstmt = null;

        String sql = prop.getProperty("deleteProfilePic");
        
        try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
        return result;
		
	}
	
}
