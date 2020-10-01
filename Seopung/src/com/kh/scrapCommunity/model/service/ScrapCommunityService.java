package com.kh.scrapCommunity.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.PageInfo;
import com.kh.scrapCommunity.model.dao.ScrapCommunityDao;
import com.kh.scrapCommunity.model.vo.ScrapCommunity;

public class ScrapCommunityService {
	
		public int selectListCount() {
		
			Connection conn = getConnection();
			
			int listCount = new ScrapCommunityDao().selectListCount(conn);
			
			close(conn);
			
			return listCount;
		}
		
		public ArrayList<ScrapCommunity> selectList(PageInfo pi) {
			
			Connection conn = getConnection();
			
			ArrayList<ScrapCommunity> list = new ScrapCommunityDao().selectList(conn, pi);
			
			close(conn);
			
			return list;
		}
		
		public int deleteScrapCommunityList(String[] scno) {
			
			Connection conn = getConnection();
			
			int result = new ScrapCommunityDao().deleteScrapCommunityList(conn, scno);
			
			close(conn);
			
			return result;
			
		}

}
