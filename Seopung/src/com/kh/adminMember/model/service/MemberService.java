package com.kh.adminMember.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.adminMember.model.dao.MemberDao;
import com.kh.adminMember.model.vo.Member;
import com.kh.adminMember.model.vo.Report;
import com.kh.common.PageInfo;

public class MemberService {
	
	/**
	 * 회원 수 조회용 서비스
	 * @param keyfield
	 * @param keyword
	 * @param status
	 * @return				총 회원 수
	 */
	public int selectListCount(int keyfield, String keyword, String status) {
		Connection conn = getConnection();
		
		int listCount = new MemberDao().selectListCount(conn, keyfield, keyword, status);
		
		close(conn);
		
		return listCount;
		
	}
	
	/**
	 * 회원 목록 리스트 조회용
	 * @param pi
	 * @param keyfield
	 * @param keyword
	 * @param status
	 * @return			회원 정보가 담긴 리스트
	 */
	public ArrayList<Member> selectList(PageInfo pi, int keyfield, String keyword, String status){
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectList(conn, pi, keyfield, keyword, status);
		
		close(conn);
		
		return list;
	}
	
	
	/**
	 * 선택된 회원 상세정보 조회용
	 * @param userNo	선택된 회원의 번호
	 * @return			회원 정보를 담은 멤버 객체
	 */
	public Member selectMember(int userNo) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().selectMember(conn, userNo);
		
		close(conn);
		
		return m;
	}
	
	
	/**
	 * 회원 정보 수정용 서비스
	 * @param m		변경된 정보가 담긴 멤버 객체
	 * @return		처리된 행 수 
	 */
	public int updateMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, m);
		
		if(result>0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	/**
	 * 선택된 회원 삭제용 서비스
	 * @param delUserNo		삭제할 회원 번호
	 * @return				처리된 행 수
	 */
	public int deleteMember(int delUserNo) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, delUserNo);
		
		if(result>0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	/**
	 * 블랙리스트 회원 제제사유 작성 용 신고분류 조회
	 * @return
	 */
	public String selectReportType(int userNo) {
		Connection conn = getConnection();
		
		String reportType = new MemberDao().selectReportType(conn, userNo);
		
		close(conn);
		
		return reportType;
	}
	
	
	public int selectReportCount(int userNo) {
		Connection conn = getConnection();
		
		int listCount = new MemberDao().selectReportCount(conn, userNo);
		
		close(conn);
		
		return listCount;
	}
	
	
	public ArrayList<Report> selectReportList(int userNo) {
		Connection conn = getConnection();
		
		ArrayList<Report> reportList = new MemberDao().selectReportList(conn, userNo);
		
		close(conn);
		
		return reportList;
	}
	
		

}
