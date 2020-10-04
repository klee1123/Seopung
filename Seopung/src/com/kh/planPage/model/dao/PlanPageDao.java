package com.kh.planPage.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.admin.model.vo.Admin;
import com.kh.common.PageInfo;
import com.kh.planPage.model.vo.PlanPage;

public class PlanPageDao {
	
	private Properties prop = new Properties();
	
	public PlanPageDao() {
		
		String fileName = PlanPageDao.class.getResource("/sql/planPage/planPage-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Admin> selectList(Connection conn, PageInfo pi, int keyfield, String keyword, String status){
		// select문 => 여러행조회
		ArrayList<Admin> list = new ArrayList<>();
		
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
				list.add(new Admin(rset.getInt("admin_no"),
									rset.getString("admin_name"),
									rset.getString("admin_id"),
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
	
	
}



















