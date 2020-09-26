package com.kh.adminRecommend.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.adminRecommend.model.vo.Recommend;
import com.kh.common.PageInfo;

public class RecommendDao {
	
	private Properties prop = new Properties();
	
	public RecommendDao() {
		
		String fileName = RecommendDao.class.getResource("/sql/adminRecommend/adminRecommend-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn, String keyword) {
		// select문 => 총 게시글 수(int)
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
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	

	public ArrayList<Recommend> selectList(Connection conn, PageInfo pi, String keyword){
		// select문 => 여러 행 조회
		ArrayList<Recommend> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Recommend(rset.getInt("recommend_no"),
									   rset.getString("recommend_title"),
									   rset.getString("admin_id"),
									   rset.getDate("recommend_enroll"),
									   rset.getInt("recommend_count"),
									   rset.getInt("recommend_like")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	public int insertRecommend(Connection conn, Recommend r) {
		//insert문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertRecommend");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, r.getRecommendTitle());
			pstmt.setString(2, r.getRecommendContent());
			pstmt.setString(3, r.getThumbnailPath());
			pstmt.setInt(4, Integer.parseInt(r.getRecommendWriter()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int increaseCount(Connection conn, int rno) {
		// update문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public Recommend selectRecommend(Connection conn, int rno) {
		// select문 => 한 행 조회
		Recommend r = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRecommend");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Recommend();
				r.setRecommendNo(rno);
				r.setRecommendTitle(rset.getString("recommend_title"));
				r.setRecommendContent(rset.getString("recommend_content"));
				r.setRecommendWriter(rset.getString("admin_id"));
				r.setEnrollDate(rset.getDate("recommend_enroll"));
				r.setCount(rset.getInt("recommend_count"));
				r.setLike(rset.getInt("recommend_like"));
				r.setThumbnailPath(rset.getString("RECOMMEND_THUMB"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return r;
	}
	
	
	public int updateRecommend(Connection conn, Recommend r) {
		// update문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateRecommend");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, r.getRecommendTitle());
			pstmt.setString(2, r.getRecommendContent());
			pstmt.setString(3, r.getThumbnailPath());
			pstmt.setInt(4, r.getRecommendNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteRecommend(Connection conn, String[] rno) {
		// update문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteRecommend");
		
		// 삭제할 추천코스 갯수가 복수일 경우
		if(rno.length > 1) {
			for(int i=1; i<rno.length; i++) {
				sql += " OR RECOMMEND_NO =" + rno[i];
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(rno[0]));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}















