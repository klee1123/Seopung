package com.kh.adminReport.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.adminReport.model.dao.AdminReportDao;
import com.kh.adminReport.model.vo.AdminReport;
import com.kh.common.PageInfo;

public class AdminReportService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new AdminReportDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<AdminReport> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<AdminReport> list = new AdminReportDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}	
	

}

