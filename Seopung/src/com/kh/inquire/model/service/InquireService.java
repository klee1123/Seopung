package com.kh.inquire.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.PageInfo;
import com.kh.inquire.model.dao.InquireDao;
import com.kh.inquire.model.vo.Inquire;

public class InquireService {
	
	/**
	 * 1_1. 총 일반게시글 갯수 조회용 서비스
	 * @return		총 갯수
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new InquireDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	/**
	 * 1_2. 현재요청한 페이지에 보여져야할 리스트 조회용 서비스
	 * @param pi		현재요청페이지, 게시글최대갯수가 담겨있는 PageInfo 객체
	 * @return			조회된 결과가 담겨있는 list
	 */
	public ArrayList<Inquire> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Inquire> list = new InquireDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
}
