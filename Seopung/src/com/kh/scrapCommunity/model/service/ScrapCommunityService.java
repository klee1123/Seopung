package com.kh.scrapCommunity.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.PageInfo;
import com.kh.scrapCommunity.model.dao.ScrapCommunityDao;
import com.kh.scrapCommunity.model.vo.ScrapCommunity;

public class ScrapCommunityService {
	
		public int selectListCount(int userNo) {
		
			Connection conn = getConnection();
			
			int listCount = new ScrapCommunityDao().selectListCount(conn, userNo);
			
			close(conn);
			
			return listCount;
		}
		
		public ArrayList<ScrapCommunity> selectList(PageInfo pi, int userNo) {
			
			Connection conn = getConnection();
			
			ArrayList<ScrapCommunity> list = new ScrapCommunityDao().selectList(conn, pi, userNo);
			
			close(conn);
			
			return list;
		}

}
