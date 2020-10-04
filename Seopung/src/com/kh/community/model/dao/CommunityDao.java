package com.kh.community.model.dao;

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

import com.kh.common.PageInfo;
import com.kh.community.model.vo.Community;
import com.kh.community.model.vo.Reply;

public class CommunityDao {

	private Properties prop = new Properties();
	
	public CommunityDao() {
		String fileName = CommunityDao.class.getResource("/sql/community/community-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn, String keyword, String head) {
		
		int listCount = 0;
		
		PreparedStatement stmt = null;
		ResultSet rset = null;
			if(head.equals("전체")) {
				
			String sql = prop.getProperty("selectListCountAll");
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, keyword );
				
				rset = stmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}else {
				String sql = prop.getProperty("selectListCount");
				try {
					stmt = conn.prepareStatement(sql);
					stmt.setString(1, head);
					stmt.setString(2, keyword);
					rset = stmt.executeQuery();
					
					if(rset.next()) {
						listCount = rset.getInt(1);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	
			return listCount;
		
	}
	
	public ArrayList<Community> selectList(Connection conn, PageInfo pi, String keyword, String head, String array){
		
		ArrayList<Community> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		if(head.equals("전체")) {
			if(array.equals("최신")) {
		 sql = prop.getProperty("selectListAll");
			}else if(array.equals("추천")) {
				sql = prop.getProperty("selectListAllRe");
			}else if(array.equals("조회")) {
				 sql = prop.getProperty("selectListAllCo");
			}else if(array.equals("스크랩")) {
				 sql = prop.getProperty("selectListAllSc");
			}
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1 ) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Community(rset.getInt("COMMUNITY_NO"),
									   rset.getString("USER_NICK"),
						               rset.getString("COMMUNITY_TITLE"),
						               rset.getString("COMMUNITY_CONTENT"),
						               rset.getDate("COMMUNITY_ENROLL"),
						               rset.getInt("COMMUNITY_COUNT"),
						               rset.getInt("COMMUNITY_SCRAP"),
						               rset.getInt("COMMUNITY_RECOMMEND"),
						               rset.getString("COMMUNITY_THUMB"),
						               rset.getString("COMMUNITY_HEAD")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		}else {
			if(array.equals("최신")) {
			 sql = prop.getProperty("selectList");
			}else if(array.equals("추천")) {
				 sql = prop.getProperty("selectListRe");
			}else if(array.equals("조회")) {
				 sql = prop.getProperty("selectListCo");
			}else if(array.equals("스크랩")) {
				 sql = prop.getProperty("selectListSc");
			}
				
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage() -1 ) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() -1;
				
				pstmt.setString(1, keyword);
				pstmt.setString(2, head);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
				
				
				rset = pstmt.executeQuery();
				while(rset.next()) {
					list.add(new Community(rset.getInt("COMMUNITY_NO"),
										   rset.getString("USER_NICK"),
							               rset.getString("COMMUNITY_TITLE"),
							               rset.getString("COMMUNITY_CONTENT"),
							               rset.getDate("COMMUNITY_ENROLL"),
							               rset.getInt("COMMUNITY_COUNT"),
							               rset.getInt("COMMUNITY_SCRAP"),
							               rset.getInt("COMMUNITY_RECOMMEND"),
							               rset.getString("COMMUNITY_THUMB"),
							               rset.getString("COMMUNITY_HEAD")));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
		}
		return list;
		
	}
	
	public int insertCommunity(Connection conn, Community c) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCommunity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(c.getUserNo()));
			pstmt.setString(2, c.getTitle());
			pstmt.setString(3, c.getContent());
			pstmt.setString(4, c.getThumb());
			pstmt.setString(5, c.getHead());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int increaseCount(Connection conn, int cno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Community selectCommunity(Connection conn, int cno) {
		
		Community c = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCommunity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Community(rset.getInt("COMMUNITY_NO"),
						   rset.getString("USER_NICK"),
						   rset.getInt("USER_NO"),
			               rset.getString("COMMUNITY_TITLE"),
			               rset.getString("COMMUNITY_CONTENT"),
			               rset.getDate("COMMUNITY_ENROLL"),
			               rset.getInt("COMMUNITY_COUNT"),
			               rset.getInt("COMMUNITY_SCRAP"),
			               rset.getInt("COMMUNITY_RECOMMEND"),
			               rset.getString("COMMUNITY_THUMB")
			               );
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return c;
		
	}
	
	public int deleteCommunity(Connection conn, int cno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCommunity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int updateCommunity(Connection conn, Community c) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateCommunity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getTitle());
			pstmt.setString(2, c.getContent());
			pstmt.setString(3, c.getThumb());
			pstmt.setString(4, c.getHead());
			pstmt.setInt(5, c.getComNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int increaseRe(Connection conn, int cno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseRe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int insertRecommend(Connection conn, int cno, int userNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertRecommend");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int decreaseRe(Connection conn, int cno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("decreaseRe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int increaseScrap(Connection conn, int cno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseScrap");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	public int insertScrap(Connection conn, int cno, int userNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertScrap");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int decreaseScrap(Connection conn, int cno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("decreaseScrap");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	public int insertNotice(Connection conn, Community c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(c.getUserNo()));
			pstmt.setString(2, c.getTitle());
			pstmt.setString(3, c.getContent());
			pstmt.setString(4, c.getHead());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Community> selectNoticeList(Connection conn){
		ArrayList<Community> nList = new ArrayList<>();
		
		Statement stmt = null; 
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNoticeList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while(rset.next()) {
				nList.add(new Community(rset.getInt("COMMUNITY_NO"),
			            rset.getString("ADMIN_ID"),
		                rset.getString("COMMUNITY_TITLE"),
		                rset.getString("COMMUNITY_CONTENT"),
		                rset.getDate("COMMUNITY_ENROLL"),
		                rset.getInt("COMMUNITY_COUNT"),
		                rset.getString("COMMUNITY_HEAD")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return nList;
			
	}
	
	public Community selectNotice(Connection conn, int cno) {
		Community c = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Community(rset.getInt("COMMUNITY_NO"),
								  rset.getString("ADMIN_ID"),
								  rset.getInt("USER_NO"),
						          rset.getString("COMMUNITY_TITLE"),
						          rset.getString("COMMUNITY_CONTENT"),
						          rset.getDate("COMMUNITY_ENROLL"),
						          rset.getInt("COMMUNITY_COUNT"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}

	public int insertReply(Connection conn, Reply r) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getReplyContent());
			pstmt.setInt(2, r.getRefCommunityNo());
			pstmt.setInt(3, Integer.parseInt(r.getReplyWriter()));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Reply> selectReplyList(Connection conn, int cno){
		
		ArrayList<Reply> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Reply(rset.getInt("COMMENT_NO"),
						           rset.getString("COMMENT_CONTENT"),
						           rset.getString("USER_NAME"),
						           rset.getString("PROFILEPIC_PATH"),
						           rset.getDate("COMMENT_DATE")));
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
	
	public int countComment(Connection conn, int cno) {
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("countComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}







































}
