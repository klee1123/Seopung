package com.kh.recommend.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.PageInfo;
import com.kh.recommend.model.vo.Recommend;
public class RecommendDao {

	private Properties prop = new Properties();
	
	public RecommendDao() {
		String fileName = RecommendDao.class.getResource("/sql/recommend/recommend-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn, String keyword) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	public ArrayList<Recommend> selectList(Connection conn, PageInfo pi, String keyword, String array){
	
		ArrayList<Recommend> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		if(array.equals("최신")) {
			sql = prop.getProperty("selectList");
		}else if(array.equals("추천")) {
			sql = prop.getProperty("selectListRe");
		}else if(array.equals("조회")) {
			sql = prop.getProperty("selectListCo");
		}
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow =startRow + pi.getBoardLimit() -1;
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Recommend(rset.getInt("RECOMMEND_NO"),
						               rset.getString("RECOMMEND_TITLE"),
						               rset.getString("RECOMMEND_CONTENT"),
						               rset.getDate("RECOMMEND_ENROLL"),
						               rset.getInt("RECOMMEND_COUNT"),
						               rset.getInt("RECOMMEND_LIKE"),
						               rset.getString("RECOMMEND_THUMB"),
						               rset.getInt("ADMIN_NO")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int insertRecommend(Connection conn, Recommend c) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertRecommend");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, c.getUserNo());
			pstmt.setString(2, c.getTitle());
			pstmt.setString(3, c.getContent());
			pstmt.setString(4, c.getThumb());
			
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
