package com.kh.message.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.accompany.model.vo.Accompany;
import com.kh.common.PageInfo;
import com.kh.message.model.vo.Message;

public class MessageDao {

	private Properties prop = new Properties();
	
		public MessageDao() {
	
		String fileName = MessageDao.class.getResource("/sql/message/message-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public int selectReceiverCount(Connection conn, int userNo) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReceiverCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			
			rset = pstmt.executeQuery();
			
			
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		}
		
		return listCount;
		
	}
		
		
	public ArrayList<Message> selectReceiverList(Connection conn , PageInfo pi, int userNo){
		
		ArrayList<Message> list = new ArrayList<Message>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReceiverList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			

			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Message(rset.getInt("MESSAGE_NO"),
									   rset.getString("USER_ID"),
						               rset.getString("USER_NICK"),
						               rset.getString("MESSAGE_CONTENT"),
						               rset.getDate("MESSAGE_DATE"),
						               rset.getInt("USER_NO"),
						               rset.getInt("USER_NO2")));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
	}
	
	public int messageDelete(Connection conn , String[] mno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMessage");
		
		// 삭제할 추천코스 갯수가 복수일 경우
		if(mno.length > 1) {
			for(int i=1; i<mno.length; i++) {
				sql += " OR MESSAGE_NO =" + mno[i];
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(mno[0]));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		return result;
	}
	
	public int selectSenderCount(Connection conn, int userNo) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSenderCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			
			rset = pstmt.executeQuery();
			
			
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		}
		
		return listCount;
		
	}
	
	public ArrayList<Message> selectSenderList(Connection conn , PageInfo pi, int userNo){
		
		ArrayList<Message> list = new ArrayList<Message>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSenderList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			

			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Message(rset.getInt("MESSAGE_NO"),
									   rset.getString("USER_ID"),
						               rset.getString("USER_NICK"),
						               rset.getString("MESSAGE_CONTENT"),
						               rset.getDate("MESSAGE_DATE"),
						               rset.getInt("USER_NO"),
						               rset.getInt("USER_NO2")));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
	}
		
	
	
	
	
}
