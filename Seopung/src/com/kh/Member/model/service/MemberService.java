package com.kh.Member.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.Member.model.dao.MemberDao;
import com.kh.Member.model.vo.Member;

public class MemberService {

	
	public int insertMember(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0){
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member loginMember = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		
		return loginMember;
	}
	
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		
		int count = new MemberDao().idCheck(conn, checkId);
		
		close(conn);
		
		return count;
	}
	
	public int nickCheck(String checkNick) {
		Connection conn = getConnection();
		
		int count = new MemberDao().nickCheck(conn, checkNick);
		close(conn);
		return count;
	}
	
	public String searchId(String name, String email) {
		Connection conn = getConnection();
		
		String id = new MemberDao().searchId(conn, name, email);
		
		close(conn);
		return id;
	}
	
	public String searchId2(String userId, String email) {
		Connection conn = getConnection();
		
		String id = new MemberDao().searchId2(conn, userId, email);
		
		close(conn);
		return id;
	}
	
	public int changePwd(String userId, String userPwd) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().changePwd(conn, userId, userPwd);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
