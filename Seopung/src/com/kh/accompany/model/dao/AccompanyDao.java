package com.kh.accompany.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.accompany.model.vo.Accompany;
import com.kh.common.PageInfo;



public class AccompanyDao {

private Properties prop = new Properties();
	
	public AccompanyDao() {
		
		String fileName = AccompanyDao.class.getResource("/sql/accompany/accompany-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
			
		}
		
		return listCount;
		
	}
	
	public ArrayList<Accompany> selectList(Connection conn , PageInfo pi){
		
		ArrayList<Accompany> list = new ArrayList<Accompany>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty(key)
		
		
		
	}
	
	
}
