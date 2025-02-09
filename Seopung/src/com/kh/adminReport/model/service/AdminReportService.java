package com.kh.adminReport.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.adminInquiry.model.dao.AdminInquiryDao;
import com.kh.adminInquiry.model.vo.AdminInquiry;
import com.kh.adminMember.model.dao.MemberDao;
import com.kh.adminPlan.model.dao.PlanDao;
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
	
	public AdminReport selectAdminReport(int rpno) {
		Connection conn = getConnection();
		
		 AdminReport r = new AdminReportDao().selectAdminReport(conn, rpno);
		
		close(conn);
		
		return r;
	}
	
	
	/**
	 * 신고 글 삭제용 서비스
	 * @param pno		삭제할 글 번호
	 * @return			처리된 행 수
	 */
	public int deleteReport(String[] rno) {
		Connection conn = getConnection();
		
		int result = new AdminReportDao().deleteReport(conn, rno);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	// 블랙리스트 등록
	public int enrollBlacklist(String[] enrollList) {
		Connection conn = getConnection();
		
		int result = new AdminReportDao().enrollBlacklist(conn, enrollList);
		
		if(result>0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	

}

