package com.kh.adminMember.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.admin.model.dao.AdminDao;
import com.kh.admin.model.vo.Admin;
import com.kh.adminMember.model.vo.Member;
import com.kh.common.PageInfo;

public class MemberDao {
	
private Properties prop = new Properties();
	
	public MemberDao() {
		
		String fileName = AdminDao.class.getResource("/sql/adminMember/adminMember-mapper.xml").getPath();
		
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

	public ArrayList<Member> selectList(Connection conn, PageInfo pi, int keyfield, String keyword, String status){
		// select문 => 여러행조회
		ArrayList<Member> list = new ArrayList<>();
		
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
				list.add(new Member(rset.getInt("user_no"),
									rset.getString("user_id"),
									rset.getString("user_name"),
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
	
	public Member selectMember(Connection conn, int userNo) {
		// select 문 => 한 행 조회
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				m = new Member(userNo, 
						        rset.getString("USER_ID"),
								rset.getString("USER_NAME"),
								rset.getString("USER_NICK"),
								rset.getString("USER_BIRTH"),
								rset.getString("GENDER"),
								rset.getString("PHONE"),
								rset.getString("EMAIL"),
								rset.getDate("enroll_date"),
								rset.getDate("modify_date"),
								rset.getString("user_intro"),
								rset.getString("profilepic_path"),
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
	

}
