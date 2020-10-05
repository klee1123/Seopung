package com.kh.index.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.adminNotice.model.vo.AdminNotice;
import com.kh.planMake.model.vo.PlanMake;
import com.kh.recommend.model.vo.Recommend;

public class IndexDao {
	
	private Properties prop = new Properties();
	
	public IndexDao() {
		
		String fileName = IndexDao.class.getResource("/sql/index/index-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 추천코스 게시판 
	 * @param conn
	 * @return
	 */
	public ArrayList<Recommend> selectRecommend(Connection conn) {
		
		ArrayList<Recommend> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRecommend");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Recommend(rset.getInt("RECOMMEND_NO"),
									   rset.getString("RECOMMEND_TITLE"),
									   rset.getString("RECOMMEND_THUMB")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * 인기글(추천순으로 나열)
	 * @param conn
	 * @return
	 */
	public ArrayList<PlanMake> selectPlanRec(Connection conn){
		
		ArrayList<PlanMake> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlanRec");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new PlanMake(rset.getInt("PLAN_NO"),
									  rset.getString("PLAN_TITLE"),
									  rset.getInt("PLAN_RECOMMEND")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * 공지사항 게시판
	 * @param conn
	 * @return
	 */
	public ArrayList<AdminNotice> selectNotice(Connection conn) {
		
		ArrayList<AdminNotice> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new AdminNotice(rset.getInt("NOTICE_NO"),
										 rset.getString("NOTICE_TITLE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
}
