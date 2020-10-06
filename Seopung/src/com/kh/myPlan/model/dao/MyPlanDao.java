package com.kh.myPlan.model.dao;
import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.adminPlan.model.vo.Plan;
import com.kh.common.PageInfo;

public class MyPlanDao {
	
	private Properties prop = new Properties();
	
	public MyPlanDao() {
		
		String fileName = MyPlanDao.class.getResource("/sql/myPlan/myPlan-mapper.xml").getPath();
	
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
	
	public int selectListCount(Connection conn, int userNo) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
	
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
		}
		return listCount;
	}
	
	public ArrayList<Plan> selectList (Connection conn, PageInfo pi, int userNo, String planOp) {
		
		ArrayList<Plan> list = new ArrayList<Plan>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = "";
		if(planOp.equals("모든일정")) {
			sql = prop.getProperty("selectList");		
		}else if(planOp.equals("공개")) {
			sql = prop.getProperty("selectListY");
		}else if(planOp.equals("비공개")){
			sql = prop.getProperty("selectListN");
		}
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit()-1;
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
			Plan p = new Plan();
			p.setPlanNo(rset.getInt("plan_no"));
			p.setPlanTitle(rset.getString("plan_title"));
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
	
	public int deleteMyPlanList(Connection conn, String[] mpno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMyPlanList");
		
		if(mpno.length > 1) {
			for(int i=1; i<mpno.length; i++) {
				sql += " OR PLAN_NO = " + mpno[i];
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(mpno[0]));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
