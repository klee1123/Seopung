package com.kh.adminPlan.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.adminPlan.model.vo.Plan;
import com.kh.adminPlan.model.vo.PlanComment;
import com.kh.common.PageInfo;

public class PlanDao {
	
	private Properties prop = new Properties();
	
	public PlanDao() {
		
		String fileName = PlanDao.class.getResource("/sql/adminPost/adminPlan-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn, int keyfield, String keyword) {
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
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listCount += rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	
	public ArrayList<Plan> selectList(Connection conn, PageInfo pi, int keyfield, String keyword){
		// select문 => 여러 행 조회
		ArrayList<Plan> list = new ArrayList<>();
		
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
			
			pstmt.setString(1,keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Plan(rset.getInt("plan_no"),
									rset.getString("plan_title"),
									rset.getString("user_id"),
									rset.getDate("enroll_date"),
									rset.getInt("plan_count")));
			}
			
			while(rset.next()) {
				list.add(new Plan());
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	public int increaseCount(Connection conn, int pno) {
		// update문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public Plan selectPlan(Connection conn, int pno) {
		// select문 => 한 행 조회
		Plan p = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlan");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				p = new Plan(pno,
						     rset.getString("plan_title"),
							 rset.getDate("plan_sdate"),
							 rset.getDate("plan_edate"),
							 rset.getString("plan_age"),
							 rset.getString("plan_acc"),
							 rset.getString("plan_budget"),
							 rset.getString("plan_scrap_yn"),
							 rset.getString("plan_memo"),
							 rset.getString("plan_type"),
							 rset.getString("plan_trans"),
							 rset.getInt("plan_recommend"),
							 rset.getInt("plan_scrap_count"),
							 rset.getString("user_id"),
							 rset.getString("user_nick"),
							 rset.getInt("user_no"),
							 rset.getString("profilepic_path"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return p;
	}
	
	public int deletePlan(Connection conn, String[] pno) {
		// update문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deletePlan");
		
		// 삭제할 추천코스 갯수가 복수일 경우
		if(pno.length > 1) {
			for(int i=1; i<pno.length; i++) {
				sql += " OR PLAN_NO =" + pno[i];
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(pno[0]));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	public int selectCommentCount(Connection conn, int pno) {
		// select => 한 행 조회
		int commentList = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCommentCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				commentList = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return commentList;
	}

	
	public ArrayList<PlanComment> selectCommentList(Connection conn, PageInfo pi, int pno){
		// select문 => 여러행 조회
		ArrayList<PlanComment> commentList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCommentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, pno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				commentList.add(new PlanComment(rset.getInt("COMMENT_NO"),
												rset.getString("USER_ID"),
												rset.getInt("PLAN_NO"),
												rset.getString("COMMENT_CONTENT"),
												rset.getDate("COMMENT_DATE"),
												rset.getString("PROFILEPIC_PATH"),
												rset.getString("user_nick"),
												rset.getInt("user_no")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return commentList;
	}
	
	
	public int deleteComment(Connection conn, int commentNo) {
		// update문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteComment");
	
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, commentNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertComment(Connection conn, PlanComment c) {
		// insert문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(c.getCommentWriter()));
			pstmt.setInt(2, c.getPlanNo());
			pstmt.setString(3, c.getContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int likePlan(Connection conn, int userNo, int pNo) {
		//insert문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("likePlan");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, pNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int scrapPlan(Connection conn, int userNo, int pNo) {
		//insert문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("scrapPlan");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, pNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int checkAccom(Connection conn, int userNo, int userNo2, int pNo) {
		//insert문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("checkAccom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, userNo2);
			pstmt.setInt(3, pNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int accomPlan(Connection conn, int userNo, int userNo2, int pNo) {
		//insert문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("accomPlan");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, userNo2);
			pstmt.setInt(3, pNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int increasePlanRecommend(Connection conn, int pNo) {
		//update문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increasePlanRecommend");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int increasePlanScrap(Connection conn, int pNo) {
		//update문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increasePlanScrap");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int selectDayCount(Connection conn, int pno) {
		//select문 => 조회된 결과 값
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDayCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public String selectPlanPlaces(Connection conn, int pno, int day) {
		// select문 => 조회된 결과
		String placeList = "";
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlanPlaces");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			pstmt.setInt(2, day);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				placeList = rset.getString("plan_place");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return placeList;
	}
	
}












