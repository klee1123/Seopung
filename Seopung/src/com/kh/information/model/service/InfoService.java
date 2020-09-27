package com.kh.information.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.Member.model.vo.Member;
import com.kh.information.model.dao.InfoDao;

public class InfoService {
	
	
	public Member updateMember(Member m) {
		Connection conn = getConnection();
		
		int result = new InfoDao().updateMember(conn, m);
		
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			
			updateMem = new InfoDao().selectMember(conn, m.getUserId());
		}else {
			rollback(conn);
		}
		close(conn);
		
		return updateMem;
	}
	
	/**
	 * 비밀번호 변경용 서비스
	 * @param userId	변경요청한 사용자아이디
	 * @param userPwd	현재 비밀번호
	 * @param updatePwd 변경된 비밀번호
	 * @return			갱신된 비밀번호
	 */
	public Member updatePwdMember(String userId, String userPwd, String updatePwd) {
		
		Connection conn = getConnection();
		
		int result = new InfoDao().updatePwdMember(conn, userId, userPwd, updatePwd);
		
		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			updateMem = new InfoDao().selectMember(conn, userId);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return updateMem;
	}
	
	public Member updateNick(String userId, String userNick, String updateNick) {
			
		Connection conn = getConnection();
		
		int result = new InfoDao().updateNick(conn, userId, userNick, updateNick);
		
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			updateMem = new InfoDao().selectMember(conn, userId);
			
		}else {
			rollback(conn);
		}
		close(conn);
		
		return updateMem;
	}

	/**
	 * 회원탈퇴용 서비스
	 * @param userId	탈퇴요청하는 회원아이디
	 * @param userPwd	회원비밀번호
	 * @return
	 */
	public int deleteMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		int result = new InfoDao().deleteMember(conn,userId,userPwd);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int nickCheck(String nickChk) {
		Connection conn = getConnection();
		
		int count = new InfoDao().nickCheck(conn, nickChk);
		
		close(conn);
		
		return count;
	}
}












