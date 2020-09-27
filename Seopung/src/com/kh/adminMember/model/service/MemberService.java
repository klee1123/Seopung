package com.kh.adminMember.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.model.dao.AdminDao;
import com.kh.admin.model.vo.Admin;
import com.kh.adminMember.model.dao.MemberDao;
import com.kh.adminMember.model.vo.Member;
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
	 * @return
	 */
	public Member selectMember(int userNo) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().selectMember(conn, userNo);
		
		close(conn);
		
		return m;
	}

}
