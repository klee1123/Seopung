package com.kh.searchPlan.model.dao;

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
import com.kh.common.PageInfo;
import com.kh.searchPlan.model.vo.SearchPlan;

public class PlanSearchDao {

	private Properties prop = new Properties();
	
	public PlanSearchDao() {
		
		String fileName = PlanSearchDao.class.getResource("/sql/searchPlan/planSearch-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn, SearchPlan filter) {
		// select => 한 행 조회
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		if(filter.getAge()!=null) {
			String[] age = filter.getAge();
			for(int i=0; i<age.length; i++) {
				sql += " AND PLAN_AGE LIKE '%' || '" +  age[i] + "' || '%'";
			}
		}
		
		if(filter.getTrans()!=null) {
			String[] trans = filter.getTrans();
			for(int i=0; i<trans.length; i++) {
				sql += " AND PLAN_TRANS LIKE '%' || '" +  trans[i] + "' || '%'";
			}
		}
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, filter.getKeyword());
			pstmt.setString(2, filter.getKeyword());
			pstmt.setString(3, filter.getsDate());
			pstmt.setString(4, filter.geteDate());
			pstmt.setString(5, filter.getsDate());
			pstmt.setString(6, filter.geteDate());
			pstmt.setString(7, filter.getType());
			
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

	
	public ArrayList<Plan> selectList(Connection conn, PageInfo pi, SearchPlan filter){
		// select문 => 여러 행 조회
		ArrayList<Plan> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT * FROM(SELECT ROWNUM RNUM, A.* FROM (";
		
		sql += prop.getProperty("selectList");
		if(filter.getAge()!=null) {
			String[] age = filter.getAge();
			for(int i=0; i<age.length; i++) {
				sql += " AND PLAN_AGE LIKE '%' || '" +  age[i] + "' || '%'";
			}
		}
		
		
		if(filter.getTrans()!=null) {
			String[] trans = filter.getTrans();
			for(int i=0; i<trans.length; i++) {
				sql += " AND PLAN_TRANS LIKE '%' || '" +  trans[i] + "' || '%'";
			}
		}
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		sql += " ORDER BY PLAN_NO DESC) A) WHERE RNUM BETWEEN " + startRow + " AND " + endRow;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, filter.getKeyword());
			pstmt.setString(2, filter.getKeyword());
			pstmt.setString(3, filter.getsDate());
			pstmt.setString(4, filter.geteDate());
			pstmt.setString(5, filter.getsDate());
			pstmt.setString(6, filter.geteDate());
			pstmt.setString(7, filter.getType());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Plan p = new Plan();
				p.setPlanNo(rset.getInt("plan_no"));
				p.setPlanTitle(rset.getString("plan_title"));
				p.setPlanWriter(rset.getString("user_nick"));
				p.setStartDate(rset.getDate("plan_sdate"));
				p.setEndDate(rset.getDate("plan_edate"));
				
				list.add(p);
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
