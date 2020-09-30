package com.kh.planPage.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.member.model.vo.Member;
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
	
	public int PlanPage(Connection conn, PlanPage p) {
		// select 문 => 한 행 => Member
		
		
					// 필요한 변수들 셋팅
					PlanPage p1 = null;
					
					PreparedStatement pstmt = null;
					ResultSet rset = null;
					
					String sql = prop.getProperty("loginMember"); // 미완성된 sql문
					
					try {
						pstmt = conn.prepareStatement(sql);  // 미완성된 sql 문 => 완성형태로 만들고 => 실행 (executeXXX)
						
						pstmt.setString(1, planTitle);
						pstmt.setString(2, );
						
						rset = pstmt.executeQuery();
						
						if(rset.next()) {
							p = new PlanPage( rset.getInt("USER_NO"),
											
										  );
							}
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} finally {
					close(rset);
					close(pstmt);
					}
					return p1;
				}
	
	
	
}



















