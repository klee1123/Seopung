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
}
