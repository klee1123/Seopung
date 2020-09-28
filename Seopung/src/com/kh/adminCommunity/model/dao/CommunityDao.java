package com.kh.adminCommunity.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.adminCommunity.model.vo.Community;
import com.kh.common.PageInfo;

import static com.kh.common.JDBCTemplate.*;

public class CommunityDao {
	
	private Properties prop = new Properties();
	
	public CommunityDao() {
		
		String fileName = CommunityDao.class.getResource("/sql/adminPost/adminCommunity-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn, int keyfield, String keyword, String head) {
		// select => 한 행 조회
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "";
		if(keyfield == 1) {
			sql = prop.getProperty("selectListCount1"); // 제목 검색
		}else {
			sql = prop.getProperty("selectListCount2"); // 아이디 검색
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(keyfield == 1) {
				pstmt.setString(1, keyword);
				pstmt.setString(2, head);
				rset = pstmt.executeQuery();
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
			}else {
				if(head.equals("공지")) {
					pstmt.setString(1, keyword);
					pstmt.setString(2, head);
					pstmt.setString(3, keyword);
					pstmt.setString(4, "x");
					pstmt.setString(5, "x");
				}else if(head.equals("명소")) {
					pstmt.setString(1, keyword);
					pstmt.setString(2, "x");
					pstmt.setString(3, keyword);
					pstmt.setString(4, head);
					pstmt.setString(5, "x");
				}else if(head.equals("맛집")){
					pstmt.setString(1, keyword);
					pstmt.setString(2, "x");
					pstmt.setString(3, keyword);
					pstmt.setString(4, "x");
					pstmt.setString(5, head);
				}else {
					pstmt.setString(1, keyword);
					pstmt.setString(2, "공지");
					pstmt.setString(3, keyword);
					pstmt.setString(4, "명소");
					pstmt.setString(5, "맛집");
				}
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					listCount += rset.getInt(1);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	
	public ArrayList<Community> selectList(Connection conn, PageInfo pi, int keyfield, String keyword, String head){
		// select문 => 여러 행 조회
		ArrayList<Community> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "";
		if(keyfield == 1) {
			sql = prop.getProperty("selectList1"); // 제목 검색
		}else {
			sql = prop.getProperty("selectList2"); // 아이디 검색
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			if(head.equals("공지")) {
				pstmt.setString(1, keyword);
				pstmt.setString(2, "공지");
				pstmt.setString(3, keyword);
				pstmt.setString(4, "x");
				pstmt.setString(5, "x");
				pstmt.setInt(6, startRow);
				pstmt.setInt(7, endRow);
			}else if(head.equals("명소")) {
				pstmt.setString(1, keyword);
				pstmt.setString(2, "x");
				pstmt.setString(3, keyword);
				pstmt.setString(4, "명소");
				pstmt.setString(5, "x");
				pstmt.setInt(6, startRow);
				pstmt.setInt(7, endRow);
			}else if(head.equals("맛집")) {
				pstmt.setString(1, keyword);
				pstmt.setString(2, "x");
				pstmt.setString(3, keyword);
				pstmt.setString(4, "x");
				pstmt.setString(5, "맛집");
				pstmt.setInt(6, startRow);
				pstmt.setInt(7, endRow);
			}else {
				pstmt.setString(1, keyword);
				pstmt.setString(2, "공지");
				pstmt.setString(3, keyword);
				pstmt.setString(4, "명소");
				pstmt.setString(5, "맛집");
				pstmt.setInt(6, startRow);
				pstmt.setInt(7, endRow);
			}

			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Community(rset.getInt("community_no"),
										rset.getString("writer"),
										rset.getString("community_title"),
										rset.getDate("community_enroll"),
										rset.getInt("community_count"),
										rset.getString("community_head")));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	public int insertCommunity(Connection conn, Community c) {
		// insert문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCommunity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(c.getCommunityWriter()));
			pstmt.setString(2, c.getTitle());
			pstmt.setString(3, c.getContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
















