package com.kh.Notice.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.Notice.model.dao.NoticeDao;
import com.kh.Notice.model.vo.Notice;
import com.kh.adminNotice.model.dao.AdminNoticeDao;
import com.kh.adminNotice.model.vo.AdminNotice;
import com.kh.common.PageInfo;

public class NoticeService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new AdminNoticeDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Notice> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}	
	
	public int increaseCount(int nno) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().increaseCount(conn, nno);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public Notice selectNotice(int nno) {
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectNotice(conn, nno);
		
		close(conn);
		
		return n;
	}

}
