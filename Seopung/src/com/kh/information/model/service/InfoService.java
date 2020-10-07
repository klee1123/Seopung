package com.kh.information.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.Member.model.vo.Member;
import com.kh.information.model.dao.InfoDao;

public class InfoService {
	
	/**
	 * 비밀번호 변경용 서비스
	 * @param userId	변경요청한 사용자아이디
	 * @param userPwd	현재 비밀번호
	 * @param updatePwd 변경된 비밀번호
	 * @return			갱신된 비밀번호
	 */
	public Member updatePwdMember(int userNo, String userPwd, String updatePwd) {
		
		Connection conn = getConnection();
		
		int result = new InfoDao().updatePwdMember(conn, userNo, userPwd, updatePwd);
		
		Member updateMem = null;
		if(result > 0) {
			
			commit(conn);
			updateMem = new InfoDao().selectMember(conn, userNo);
			
		}else {
			rollback(conn);
		}
		close(conn);
		
		return updateMem;
	}
	
	/**
	 * 닉네임 등록 서비스
	 * @param userId
	 * @param userNick
	 * @param updateNick
	 * @return
	 */
	public Member updateNick(int userNo, String userNick, String updateNick) {
			
		Connection conn = getConnection();
		
		int result = new InfoDao().updateNick(conn, userNo, userNick, updateNick);
		
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			updateMem = new InfoDao().selectMember(conn, userNo);
			
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
	public int deleteMember(int userNo, String userPwd) {
		Connection conn = getConnection();
		
		int result = new InfoDao().deleteMember(conn,userNo,userPwd);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	/**
	 * 닉네임 중복체크 서비스
	 * @param nickChk
	 * @return
	 */
	public int nickCheck(String nickChk) {
		Connection conn = getConnection();
		
		int count = new InfoDao().nickCheck(conn, nickChk);
		
		close(conn);
		
		return count;
	}
	
	
	/**
	 * 개인정보 업데이트 서비스
	 * @param m 프로필사진, 자기소개
	 * @return
	 */
	public Member updateInfo(Member m) {
		Connection conn = getConnection();
		
		int result = new InfoDao().updateInfo(conn,m);
		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			// 갱신된 회원 다시 조회해오기
			updateMem = new InfoDao().selectMember(conn, m.getUserNo());
		
		}else {
			rollback(conn);
		}
		close(conn);
		
		return updateMem; // 갱신된 회원객체 / null
	}
	
	public Member selectMember(int userNo) {
		Connection conn = getConnection();
		
		Member m = new InfoDao().selectMember(conn, userNo);
		
		close(conn);
		
		return m;
	}
	
	public int updateInfoEmail(int userNo, String updateEmail) {

        Connection conn = getConnection();

        int result = new InfoDao().updateInfoEmail(conn, userNo, updateEmail);

        if(result > 0) {
            commit(conn);
            
        }else {
            rollback(conn);
        }
        close(conn);

        return result;

    }
	
	public int deleteProfilePic(int userNo) {
		Connection conn = getConnection();
		
		int result = new InfoDao().deleteProfilePic(conn, userNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
}












