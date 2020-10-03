package com.kh.Member.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.Member.model.vo.LoginUser;
import com.kh.Member.model.vo.Member;

public class MemberDao {

	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int insertMember(Connection conn, Member m) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getNickName());
			pstmt.setString(5, m.getBirth());
			pstmt.setString(6, m.getGender());
			pstmt.setString(7, m.getEmail());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public LoginUser loginMember(Connection conn, String userId, String userPwd) {
		
		LoginUser loginUser = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			pstmt.setString(3, userId);
			pstmt.setString(4, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new LoginUser(rset.getInt("USER_NO"),
							   rset.getString("NAME"),
							   rset.getInt("category"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
	}
	
	public int idCheck(Connection conn, String checkId) {
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return count;
		
	}
	
	
	public int nickCheck(Connection conn, String checkNick) {
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("nickCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkNick);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	public String searchId(Connection conn, String name, String email) {
		
		String id = "";
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				id = rset.getString("USER_ID");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return id;
		
	}
	
	public String searchId2(Connection conn, String userId, String email ) {
		String id = "";
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println(userId);
		System.out.println(email);
		String sql = prop.getProperty("searchId2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				id = rset.getString("USER_ID");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return id;
	}
	
	public int changePwd(Connection conn, String userId, String userPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("changePwd");
			System.out.println(userId);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userPwd);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
